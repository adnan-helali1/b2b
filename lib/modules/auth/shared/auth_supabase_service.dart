import 'package:supabase_flutter/supabase_flutter.dart';

class RegisterResult {
  final String role;
  final bool needsEmailConfirmation;

  const RegisterResult({
    required this.role,
    required this.needsEmailConfirmation,
  });
}

class UserProfile {
  final String id;
  final String name;
  final String email;
  final String phone;
  final String role;
  final String? address;
  final String? companyName;

  const UserProfile({
    required this.id,
    required this.name,
    required this.email,
    required this.phone,
    required this.role,
    this.address,
    this.companyName,
  });

  factory UserProfile.fromJson(Map<String, dynamic> json) {
    return UserProfile(
      id: json['id'] ?? '',
      name: json['name'] ?? '',
      email: json['email'] ?? '',
      phone: json['phone'] ?? '',
      role: json['role'] ?? '',
      address: json['address'],
      companyName: json['company_name'],
    );
  }
}

class AuthSupabaseService {
  AuthSupabaseService._();

  static final AuthSupabaseService instance = AuthSupabaseService._();
  final SupabaseClient _client = Supabase.instance.client;

  String userMessageFromError(Object error) {
    if (error is AuthException) {
      final msg = error.message.toLowerCase();

      if (msg.contains('email rate limit') ||
          msg.contains('over_email_send_rate_limit') ||
          msg.contains('rate limit')) {
        return 'تم تجاوز الحد المسموح لإرسال الإيميلات. ⏳\n\n'
            'الحلول:\n'
            '✓ جرّب مجددًا بعد دقائق\n'
            '✓ استخدم إيميل سابق مسجل\n'
            '✓ الرجوع لتسجيل الدخول إذا كان لديك حساب';
      }

      if (msg.contains('invalid login credentials')) {
        return 'البريد الإلكتروني أو كلمة المرور غير صحيحة.';
      }

      if (msg.contains('email not confirmed')) {
        return 'الإيميل غير مؤكد بعد. يرجى تأكيد البريد أولًا.';
      }

      if (msg.contains('user already registered')) {
        return 'هذا البريد مسجل مسبقًا. جرّب تسجيل الدخول.';
      }

      return error.message;
    }

    if (error is PostgrestException) {
      final msg = error.message.toLowerCase();
      if (msg.contains('row-level security')) {
        return 'الصلاحيات الحالية تمنع العملية (RLS). تأكد من الـ policies.';
      }
      return error.message.isEmpty ? 'خطأ في قاعدة البيانات.' : error.message;
    }

    return 'حدث خطأ غير متوقع.';
  }

  Future<String> loginAndGetRole({
    required String email,
    required String password,
    String? selectedRole,
  }) async {
    final authRes = await _client.auth.signInWithPassword(
      email: email,
      password: password,
    );

    final user = authRes.user;
    if (user == null) {
      throw const AuthException('لم يتم العثور على المستخدم بعد تسجيل الدخول');
    }

    final roleData = await _client
        .from('users')
        .select('role')
        .eq('id', user.id)
        .maybeSingle();

    final existingRole = roleData?['role'] as String?;
    if (existingRole != null && existingRole.isNotEmpty) {
      return existingRole;
    }

    final metadataRole = user.userMetadata?['role'] as String?;
    final role = metadataRole ?? selectedRole;
    if (role == null || (role != 'supermarket' && role != 'supplier')) {
      throw const PostgrestException(
        message: 'لا يوجد role صالح للمستخدم في جدول users أو metadata',
      );
    }

    final name =
        (user.userMetadata?['name'] as String?) ?? user.email?.split('@').first;
    final phone = (user.userMetadata?['phone'] as String?) ?? '-';
    final address = (user.userMetadata?['address'] as String?) ?? '-';
    final companyName =
        (user.userMetadata?['company_name'] as String?) ?? (name ?? '');

    await _client.from('users').upsert({
      'id': user.id,
      'name': name ?? 'user',
      'email': user.email,
      'phone': phone,
      'role': role,
    });

    await _ensureRoleProfile(
      userId: user.id,
      role: role,
      name: name ?? 'user',
      address: address,
      companyName: companyName,
    );

    return role;
  }

  Future<RegisterResult> register({
    required String name,
    required String email,
    required String phone,
    required String password,
    required String role,
    String? address,
    String? companyName,
    int retryCount = 3,
  }) async {
    Exception? lastError;

    for (int attempt = 1; attempt <= retryCount; attempt++) {
      try {
        final authRes = await _client.auth.signUp(
          email: email,
          password: password,
          data: {
            'name': name,
            'phone': phone,
            'role': role,
            'address': (address == null || address.trim().isEmpty)
                ? '-'
                : address,
            'company_name': (companyName == null || companyName.trim().isEmpty)
                ? name
                : companyName,
          },
        );

        final user = authRes.user;
        if (user == null) {
          throw const AuthException('فشل إنشاء مستخدم auth');
        }

        // نجاح! اخرج من حلقة الـ retry
        return _handleSignUpSuccess(
          user: user,
          session: authRes.session,
          name: name,
          email: email,
          phone: phone,
          role: role,
          address: address,
          companyName: companyName,
        );
      } on AuthException catch (e) {
        lastError = e;
        final isRateLimit =
            e.message.toLowerCase().contains('rate limit') ||
            e.message.toLowerCase().contains('email');

        if (isRateLimit && attempt < retryCount) {
          // انتظر قبل المحاولة التالية (exponential backoff)
          await Future.delayed(Duration(seconds: 2 * attempt));
          continue;
        }
        rethrow;
      }
    }

    throw lastError ?? const AuthException('فشل التسجيل بعد عدة محاولات');
  }

  Future<RegisterResult> _handleSignUpSuccess({
    required User user,
    required Session? session,
    required String name,
    required String email,
    required String phone,
    required String role,
    String? address,
    String? companyName,
  }) async {
    final hasSession = session != null;
    if (hasSession) {
      // احفظ كل البيانات الأساسية والإضافية في جدول users
      await _client.from('users').upsert({
        'id': user.id,
        'name': name,
        'email': email,
        'phone': phone,
        'role': role,
        'address': (address == null || address.trim().isEmpty) ? '-' : address,
        'company_name': (companyName == null || companyName.trim().isEmpty)
            ? name
            : companyName,
      });

      // ثم احفظ البيانات المتخصصة في الجدول الخاص بكل role
      await _ensureRoleProfile(
        userId: user.id,
        role: role,
        name: name,
        address: (address == null || address.trim().isEmpty) ? '-' : address,
        companyName: (companyName == null || companyName.trim().isEmpty)
            ? name
            : companyName,
      );
    }

    return RegisterResult(role: role, needsEmailConfirmation: !hasSession);
  }

  Future<void> _ensureRoleProfile({
    required String userId,
    required String role,
    required String name,
    required String address,
    required String companyName,
  }) async {
    if (role == 'supermarket') {
      final exists = await _client
          .from('supermarkets')
          .select('id')
          .eq('user_id', userId)
          .maybeSingle();

      if (exists == null) {
        await _client.from('supermarkets').insert({
          'user_id': userId,
          'name': name,
          'address': address,
        });
      }
      return;
    }

    if (role == 'supplier') {
      final exists = await _client
          .from('suppliers')
          .select('id')
          .eq('user_id', userId)
          .maybeSingle();

      if (exists == null) {
        await _client.from('suppliers').insert({
          'user_id': userId,
          'name': name,
          'company_name': companyName,
        });
      }
      return;
    }

    throw const PostgrestException(message: 'role غير مدعوم في التسجيل');
  }

  /// احصل على بيانات المستخدم الحالي من Supabase
  Future<UserProfile> getCurrentUserProfile() async {
    final user = _client.auth.currentUser;
    if (user == null) {
      throw const AuthException('لا يوجد مستخدم مسجل دخول');
    }

    final userData = await _client
        .from('users')
        .select()
        .eq('id', user.id)
        .single();

    return UserProfile.fromJson(userData);
  }

  /// احصل على بيانات المتجر (supermarket)
  Future<Map<String, dynamic>> getSupermarketData(String userId) async {
    final data = await _client
        .from('supermarkets')
        .select()
        .eq('user_id', userId)
        .maybeSingle();

    return data ?? {};
  }

  /// احصل على بيانات الموزع (supplier)
  Future<Map<String, dynamic>> getSupplierData(String userId) async {
    final data = await _client
        .from('suppliers')
        .select()
        .eq('user_id', userId)
        .maybeSingle();

    return data ?? {};
  }
}
