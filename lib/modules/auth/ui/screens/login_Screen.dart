import 'package:b2b/core/helpers/spacing.dart';
import 'package:b2b/core/theme/app_color_scheme_extention.dart';
import 'package:b2b/core/theme/textstyles.dart';
import 'package:b2b/modules/auth/ui/widgets/app_text.dart';
import 'package:b2b/modules/auth/ui/widgets/auth_button.dart';
import 'package:b2b/modules/auth/ui/widgets/auth_container.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class LoginScreen extends StatelessWidget {
  final emailController = TextEditingController();

  final passwordController = TextEditingController();
  LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final cs = Theme.of(context).colorScheme;
    final ext = Theme.of(context).extension<AppColorScheme>()!;

    return Scaffold(
      backgroundColor: cs.surface, // ✅ FIXED
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          verticalSpace(10.h),

          Text(
            'Smart Order',
            style: TextStyles.font22bold.copyWith(
              color: cs.onSurface, // ✅ FIXED
            ),
          ),

          Text(
            'نظام الطلبات الذكي B2B',
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

          // Account type row
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              AuthContainer(
                icon: Icons.store,
                text: 'متجر',
                color: cs.primary, // ✅ FIXED
              ),
              AuthContainer(
                icon: Icons.local_shipping,
                text: 'مورد',
                color: cs.secondary, // ✅ FIXED
              ),
              AuthContainer(
                icon: Icons.admin_panel_settings,
                text: 'مدير',
                color: ext.warning, // 🔥 Using theme warning color
              ),
            ],
          ),

          verticalSpace(30.h),

          // Email
          AppTextField(
            label: 'البريد الالكتروني',
            hint: 'example@company.com',
            controller: emailController,
            validator: (v) {
              if (v == null || v.isEmpty) return 'Enter email';
              return null;
            },
          ),

          const SizedBox(height: 20),

          // Password
          AppTextField(
            label: 'كلمة المرور',
            hint: '******',
            controller: passwordController,
            validator: (v) {
              if (v == null || v.length < 6) return 'Weak password';
              return null;
            },
          ),

          verticalSpace(30.h),

          // Login button
          AuthButton(),
        ],
      ),
    );
  }
}
