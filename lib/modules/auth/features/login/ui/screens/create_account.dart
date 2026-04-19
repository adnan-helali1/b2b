import 'package:b2b/core/helpers/extensions.dart';
import 'package:b2b/core/helpers/spacing.dart';
import 'package:b2b/core/theme/textstyles.dart';
import 'package:b2b/core/theme/theme_mode_cubit.dart';
import 'package:b2b/core/routing/routes.dart';
import 'package:b2b/modules/auth/shared/auth_supabase_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CreateAccount extends StatefulWidget {
  const CreateAccount({super.key});

  @override
  State<CreateAccount> createState() => _CreateAccountState();
}

enum _AccountType { store, supplier }

class _CreateAccountState extends State<CreateAccount> {
  final _formKey = GlobalKey<FormState>();
  final _storeNameController = TextEditingController();
  final _extraInfoController = TextEditingController();
  final _emailController = TextEditingController();
  final _phoneController = TextEditingController();
  final _passwordController = TextEditingController();
  final _confirmPasswordController = TextEditingController();

  _AccountType _selectedType = _AccountType.store;
  bool _obscurePassword = true;
  bool _obscureConfirmPassword = true;
  bool _isLoading = false;

  Future<void> _onCreateAccount() async {
    if (!_formKey.currentState!.validate()) return;

    if (_passwordController.text != _confirmPasswordController.text) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('كلمتا المرور غير متطابقتين')),
      );
      return;
    }

    setState(() => _isLoading = true);

    try {
      final role = _selectedType == _AccountType.store
          ? 'supermarket'
          : 'supplier';

      final result = await AuthSupabaseService.instance.register(
        name: _storeNameController.text.trim(),
        email: _emailController.text.trim(),
        phone: _phoneController.text.trim(),
        password: _passwordController.text,
        role: role,
        address: _selectedType == _AccountType.store
            ? _extraInfoController.text.trim()
            : null,
        companyName: _selectedType == _AccountType.supplier
            ? _extraInfoController.text.trim()
            : null,
      );

      if (!mounted) return;

      if (result.needsEmailConfirmation) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text(
              'تم إنشاء الحساب. يرجى تأكيد البريد الإلكتروني ثم تسجيل الدخول.',
            ),
          ),
        );
        context.pushNamed(Routes.loginScreen);
        return;
      }

      if (result.role == 'supermarket') {
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
  void dispose() {
    _storeNameController.dispose();
    _extraInfoController.dispose();
    _emailController.dispose();
    _phoneController.dispose();
    _passwordController.dispose();
    _confirmPasswordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final cs = context.cs;
    final scaffoldColor = Theme.of(context).scaffoldBackgroundColor;

    return Scaffold(
      backgroundColor: scaffoldColor,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: scaffoldColor,
        elevation: 0,
        titleSpacing: 0,
        leadingWidth: 56.w,
        leading: IconButton(
          onPressed: () => context.pop(),
          icon: Icon(Icons.arrow_back_ios_new_rounded, color: cs.onSurface),
        ),
        actions: [
          IconButton(
            onPressed: () => context.read<ThemeModeCubit>().toggle(),
            icon: Icon(
              Theme.of(context).brightness == Brightness.light
                  ? Icons.dark_mode_outlined
                  : Icons.light_mode_outlined,
              color: cs.onSurface,
            ),
          ),
          horizontalSpace(6.w),
        ],
      ),
      body: SafeArea(
        child: Form(
          key: _formKey,
          child: ListView(
            padding: EdgeInsets.fromLTRB(16.w, 0, 16.w, 20.h),
            children: [
              verticalSpace(18.h),
              Center(
                child: Container(
                  width: 74.w,
                  height: 74.w,
                  decoration: BoxDecoration(
                    color: cs.primary,
                    borderRadius: BorderRadius.circular(20.r),
                    boxShadow: [
                      BoxShadow(
                        color: cs.primary.withOpacity(0.18),
                        blurRadius: 18,
                        offset: const Offset(0, 8),
                      ),
                    ],
                  ),
                  child: Icon(
                    Icons.shopping_cart_outlined,
                    color: cs.onPrimary,
                    size: 34.sp,
                  ),
                ),
              ),
              verticalSpace(18.h),
              Center(
                child: Text(
                  'إنشاء حساب جديد',
                  style: TextStyles.font22bold.copyWith(color: cs.onSurface),
                ),
              ),
              verticalSpace(6.h),
              Center(
                child: Text(
                  'Smart Order انضم إلى شبكة',
                  style: TextStyles.font14.copyWith(color: cs.onSurfaceVariant),
                ),
              ),
              verticalSpace(22.h),
              Text(
                'اختر نوع الحساب',
                style: TextStyles.font12w600.copyWith(color: cs.onSurface),
              ),
              verticalSpace(10.h),
              Row(
                children: [
                  Expanded(
                    child: _AccountTypeCard(
                      icon: Icons.store_outlined,
                      label: 'متجر',
                      isSelected: _selectedType == _AccountType.store,
                      onTap: () =>
                          setState(() => _selectedType = _AccountType.store),
                    ),
                  ),
                  horizontalSpace(10.w),
                  Expanded(
                    child: _AccountTypeCard(
                      icon: Icons.local_shipping_outlined,
                      label: 'مورد',
                      isSelected: _selectedType == _AccountType.supplier,
                      onTap: () =>
                          setState(() => _selectedType = _AccountType.supplier),
                    ),
                  ),
                ],
              ),
              verticalSpace(16.h),
              _FormFieldLabel(
                text: _selectedType == _AccountType.store
                    ? 'اسم السوبر ماركت'
                    : 'اسم المورد',
              ),
              verticalSpace(8.h),
              _AuthField(
                controller: _storeNameController,
                hintText: _selectedType == _AccountType.store
                    ? 'مثال: متجر الأسرة'
                    : 'مثال: مورد الخليج',
                keyboardType: TextInputType.name,
                validator: (value) {
                  if (value == null || value.trim().isEmpty) {
                    return 'هذا الحقل مطلوب';
                  }
                  return null;
                },
              ),
              verticalSpace(14.h),
              _FormFieldLabel(
                text: _selectedType == _AccountType.store
                    ? 'العنوان'
                    : 'اسم الشركة',
              ),
              verticalSpace(8.h),
              _AuthField(
                controller: _extraInfoController,
                hintText: _selectedType == _AccountType.store
                    ? 'مثال: الرياض - حي اليرموك'
                    : 'مثال: شركة المورد الحديث',
                keyboardType: TextInputType.text,
                validator: (value) {
                  if (value == null || value.trim().isEmpty) {
                    return 'هذا الحقل مطلوب';
                  }
                  return null;
                },
              ),
              verticalSpace(14.h),
              _FormFieldLabel(text: 'البريد الإلكتروني'),
              verticalSpace(8.h),
              _AuthField(
                controller: _emailController,
                hintText: 'example@company.com',
                keyboardType: TextInputType.emailAddress,
                validator: (value) {
                  if (value == null || value.trim().isEmpty) {
                    return 'هذا الحقل مطلوب';
                  }
                  if (!value.contains('@')) {
                    return 'صيغة البريد غير صحيحة';
                  }
                  return null;
                },
              ),
              verticalSpace(14.h),
              _FormFieldLabel(text: 'رقم الهاتف'),
              verticalSpace(8.h),
              _AuthField(
                controller: _phoneController,
                hintText: '+966 XX XXX XXXX',
                keyboardType: TextInputType.phone,
                validator: (value) {
                  if (value == null || value.trim().isEmpty) {
                    return 'هذا الحقل مطلوب';
                  }
                  return null;
                },
              ),
              verticalSpace(14.h),
              _FormFieldLabel(text: 'كلمة المرور'),
              verticalSpace(8.h),
              _AuthField(
                controller: _passwordController,
                hintText: '••••••••',
                obscureText: _obscurePassword,
                validator: (value) {
                  if (value == null || value.length < 6) {
                    return 'كلمة المرور قصيرة';
                  }
                  return null;
                },
                suffixIcon: IconButton(
                  onPressed: () {
                    setState(() => _obscurePassword = !_obscurePassword);
                  },
                  icon: Icon(
                    _obscurePassword
                        ? Icons.visibility_outlined
                        : Icons.visibility_off_outlined,
                    color: cs.onSurfaceVariant,
                  ),
                ),
              ),
              verticalSpace(14.h),
              _FormFieldLabel(text: 'تأكيد كلمة المرور'),
              verticalSpace(8.h),
              _AuthField(
                controller: _confirmPasswordController,
                hintText: '••••••••',
                obscureText: _obscureConfirmPassword,
                validator: (value) {
                  if (value == null || value.length < 6) {
                    return 'كلمة المرور قصيرة';
                  }
                  return null;
                },
                suffixIcon: IconButton(
                  onPressed: () {
                    setState(() {
                      _obscureConfirmPassword = !_obscureConfirmPassword;
                    });
                  },
                  icon: Icon(
                    _obscureConfirmPassword
                        ? Icons.visibility_outlined
                        : Icons.visibility_off_outlined,
                    color: cs.onSurfaceVariant,
                  ),
                ),
              ),
              verticalSpace(22.h),
              SizedBox(
                width: double.infinity,
                height: 52.h,
                child: FilledButton(
                  onPressed: _isLoading ? null : _onCreateAccount,
                  style: FilledButton.styleFrom(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(14.r),
                    ),
                  ),
                  child: _isLoading
                      ? SizedBox(
                          width: 20.w,
                          height: 20.w,
                          child: CircularProgressIndicator(
                            strokeWidth: 2,
                            color: cs.onPrimary,
                          ),
                        )
                      : Text(
                          'إنشاء الحساب',
                          style: TextStyles.font16w700.copyWith(
                            color: cs.onPrimary,
                          ),
                        ),
                ),
              ),
              verticalSpace(12.h),
              Center(
                child: TextButton(
                  onPressed: () => context.pushNamed(Routes.loginScreen),
                  child: Text(
                    'لديك حساب بالفعل؟ تسجيل الدخول',
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

class _AccountTypeCard extends StatelessWidget {
  final IconData icon;
  final String label;
  final bool isSelected;
  final VoidCallback onTap;

  const _AccountTypeCard({
    required this.icon,
    required this.label,
    required this.isSelected,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final cs = context.cs;

    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(16.r),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 220),
        padding: EdgeInsets.symmetric(vertical: 16.h),
        decoration: BoxDecoration(
          color: isSelected ? cs.primary.withOpacity(0.12) : cs.surface,
          borderRadius: BorderRadius.circular(16.r),
          border: Border.all(
            color: isSelected ? cs.primary : context.appColors.borderColor,
            width: isSelected ? 1.2 : 1,
          ),
        ),
        child: Column(
          children: [
            Container(
              width: 46.w,
              height: 46.w,
              decoration: BoxDecoration(
                color: isSelected ? cs.primary : cs.primary.withOpacity(0.95),
                borderRadius: BorderRadius.circular(14.r),
              ),
              child: Icon(icon, color: cs.onPrimary, size: 24.sp),
            ),
            verticalSpace(10.h),
            Text(
              label,
              style: TextStyles.font12w600.copyWith(
                color: cs.onSurface,
                fontWeight: isSelected ? FontWeight.w700 : FontWeight.w600,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _FormFieldLabel extends StatelessWidget {
  final String text;

  const _FormFieldLabel({required this.text});

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyles.font12w600.copyWith(color: context.cs.onSurface),
    );
  }
}

class _AuthField extends StatelessWidget {
  final TextEditingController controller;
  final String hintText;
  final TextInputType? keyboardType;
  final bool obscureText;
  final Widget? suffixIcon;
  final String? Function(String?)? validator;

  const _AuthField({
    required this.controller,
    required this.hintText,
    this.keyboardType,
    this.obscureText = false,
    this.suffixIcon,
    this.validator,
  });

  @override
  Widget build(BuildContext context) {
    final cs = context.cs;

    return TextFormField(
      controller: controller,
      keyboardType: keyboardType,
      obscureText: obscureText,
      validator: validator,
      decoration: InputDecoration(
        hintText: hintText,
        hintStyle: TextStyles.font12normal.copyWith(color: cs.onSurfaceVariant),
        suffixIcon: suffixIcon,
        filled: true,
        fillColor: cs.surface,
        contentPadding: EdgeInsets.symmetric(horizontal: 14.w, vertical: 14.h),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(14.r),
          borderSide: BorderSide(color: context.appColors.borderColor),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(14.r),
          borderSide: BorderSide(color: context.appColors.borderColor),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(14.r),
          borderSide: BorderSide(color: cs.primary),
        ),
      ),
    );
  }
}
