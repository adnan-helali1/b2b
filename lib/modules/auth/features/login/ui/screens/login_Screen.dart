import 'package:b2b/core/helpers/extensions.dart';
import 'package:b2b/core/helpers/spacing.dart';
import 'package:b2b/core/routing/routes.dart';
import 'package:b2b/core/theme/app_color_scheme_extention.dart';
import 'package:b2b/core/theme/textstyles.dart';
import 'package:b2b/modules/auth/features/login/ui/widgets/app_text.dart';
import 'package:b2b/modules/auth/features/login/ui/widgets/auth_button.dart';
import 'package:b2b/modules/auth/features/login/ui/widgets/auth_container.dart';
import 'package:b2b/modules/auth/features/login/ui/widgets/auth_logo_container.dart';
import 'package:b2b/modules/auth/shared/auth_supabase_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

enum _LoginRole { supermarket, supplier, admin }

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _formKey = GlobalKey<FormState>();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  _LoginRole _selectedRole = _LoginRole.supermarket;
  bool _isLoading = false;

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  Future<void> _onLogin() async {
    if (!_formKey.currentState!.validate()) return;

    if (_selectedRole == _LoginRole.admin) {
      context.pushNamed(Routes.adminHomeScreen);
      return;
    }

    setState(() => _isLoading = true);

    try {
      final selectedRole = _selectedRole == _LoginRole.supermarket
          ? 'supermarket'
          : 'supplier';

      final dbRole = await AuthSupabaseService.instance.loginAndGetRole(
        email: emailController.text.trim(),
        password: passwordController.text,
        selectedRole: selectedRole,
      );

      if (dbRole != selectedRole) {
        throw const AuthException('نوع الحساب المختار لا يطابق حسابك الفعلي');
      }

      if (!mounted) return;

      if (dbRole == 'supermarket') {
        context.pushNamed(Routes.superHomeScreen);
      } else {
        context.pushNamed(Routes.supplierHomeScreen);
      }
    } catch (e) {
      if (!mounted) return;
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(AuthSupabaseService.instance.userMessageFromError(e)),
        ),
      );
    } finally {
      if (mounted) setState(() => _isLoading = false);
    }
  }

  @override
  Widget build(BuildContext context) {
    final cs = Theme.of(context).colorScheme;
    final ext = Theme.of(context).extension<AppColorScheme>()!;

    return Scaffold(
      backgroundColor: cs.surface, // ✅ FIXED
      body: SafeArea(
        child: Form(
          key: _formKey,
          child: ListView(
            padding: EdgeInsets.fromLTRB(16.w, 10.h, 16.w, 20.h),
            children: [
              const AuthLogoContainer(),
              Text(
                'Smart Order',
                textAlign: TextAlign.center,
                style: TextStyles.font22bold.copyWith(
                  color: cs.onSurface, // ✅ FIXED
                ),
              ),
              Text(
                'نظام الطلبات الذكي B2B',
                textAlign: TextAlign.center,
                style: TextStyles.font18w600.copyWith(
                  color: cs.onSurfaceVariant, // ✅ FIXED
                ),
              ),
              verticalSpace(30.h),
              Text(
                'اختر نوع الحساب',
                style: TextStyles.font12.copyWith(
                  color: cs.onSurface, // ✅ FIXED
                ),
              ),
              verticalSpace(20.h),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  AuthContainer(
                    icon: Icons.store,
                    text: 'متجر',
                    color: cs.primary,
                    isSelected: _selectedRole == _LoginRole.supermarket,
                    onTap: () {
                      setState(() => _selectedRole = _LoginRole.supermarket);
                    },
                  ),
                  AuthContainer(
                    icon: Icons.local_shipping,
                    text: 'مورد',
                    color: cs.secondary,
                    isSelected: _selectedRole == _LoginRole.supplier,
                    onTap: () {
                      setState(() => _selectedRole = _LoginRole.supplier);
                    },
                  ),
                  AuthContainer(
                    icon: Icons.admin_panel_settings,
                    text: 'مدير',
                    color: ext.warning,
                    isSelected: _selectedRole == _LoginRole.admin,
                    onTap: () {
                      setState(() => _selectedRole = _LoginRole.admin);
                    },
                  ),
                ],
              ),
              verticalSpace(30.h),
              AppTextField(
                label: 'البريد الالكتروني',
                hint: 'example@company.com',
                controller: emailController,
                validator: (v) {
                  if (v == null || v.trim().isEmpty) {
                    return 'الرجاء إدخال البريد الإلكتروني';
                  }
                  if (!v.contains('@')) {
                    return 'صيغة البريد غير صحيحة';
                  }
                  return null;
                },
              ),
              verticalSpace(20.h),
              AppTextField(
                label: 'كلمة المرور',
                hint: '******',
                controller: passwordController,
                validator: (v) {
                  if (v == null || v.length < 6) {
                    return 'كلمة المرور قصيرة';
                  }
                  return null;
                },
              ),
              verticalSpace(30.h),
              AuthButton(onPressed: _onLogin, isLoading: _isLoading),
              verticalSpace(10.h),
              Center(
                child: TextButton(
                  onPressed: () =>
                      context.pushNamed(Routes.createAccountScreen),
                  child: Text(
                    'إنشاء حساب جديد',
                    style: TextStyles.font12w600.copyWith(color: cs.primary),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
