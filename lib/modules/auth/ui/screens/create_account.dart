import 'package:b2b/core/helpers/extensions.dart';
import 'package:b2b/core/helpers/spacing.dart';
import 'package:b2b/core/theme/textstyles.dart';
import 'package:b2b/core/theme/theme_mode_cubit.dart';
import 'package:b2b/core/routing/routes.dart';
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
  final _emailController = TextEditingController();
  final _phoneController = TextEditingController();
  final _passwordController = TextEditingController();
  final _confirmPasswordController = TextEditingController();

  _AccountType _selectedType = _AccountType.store;
  bool _obscurePassword = true;
  bool _obscureConfirmPassword = true;

  @override
  void dispose() {
    _storeNameController.dispose();
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
              _FormFieldLabel(text: 'اسم المتجر'),
              verticalSpace(8.h),
              _AuthField(
                controller: _storeNameController,
                hintText: 'مثال: متجر الأسرة',
                keyboardType: TextInputType.name,
              ),
              verticalSpace(14.h),
              _FormFieldLabel(text: 'البريد الإلكتروني'),
              verticalSpace(8.h),
              _AuthField(
                controller: _emailController,
                hintText: 'example@company.com',
                keyboardType: TextInputType.emailAddress,
              ),
              verticalSpace(14.h),
              _FormFieldLabel(text: 'رقم الهاتف'),
              verticalSpace(8.h),
              _AuthField(
                controller: _phoneController,
                hintText: '+966 XX XXX XXXX',
                keyboardType: TextInputType.phone,
              ),
              verticalSpace(14.h),
              _FormFieldLabel(text: 'كلمة المرور'),
              verticalSpace(8.h),
              _AuthField(
                controller: _passwordController,
                hintText: '••••••••',
                obscureText: _obscurePassword,
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
                  onPressed: () {},
                  style: FilledButton.styleFrom(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(14.r),
                    ),
                  ),
                  child: Text(
                    'إنشاء الحساب',
                    style: TextStyles.font16w700.copyWith(color: cs.onPrimary),
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

  const _AuthField({
    required this.controller,
    required this.hintText,
    this.keyboardType,
    this.obscureText = false,
    this.suffixIcon,
  });

  @override
  Widget build(BuildContext context) {
    final cs = context.cs;

    return TextFormField(
      controller: controller,
      keyboardType: keyboardType,
      obscureText: obscureText,
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
