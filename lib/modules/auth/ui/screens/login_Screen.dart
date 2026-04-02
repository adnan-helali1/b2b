import 'package:b2b/core/helpers/spacing.dart';
import 'package:b2b/core/theme/app_color_scheme_extention.dart';
import 'package:b2b/core/theme/textstyles.dart';
import 'package:b2b/modules/auth/ui/widgets/app_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class LoginScreen extends StatelessWidget {
  final emailController = TextEditingController();

  final passwordController = TextEditingController();
  LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final cs = Theme.of(context).colorScheme;
    final ext = Theme.of(
      context,
    ).extension<AppColorScheme>()!;

    return Scaffold(
      backgroundColor: cs.surface, // ✅ FIXED
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          // Logo container
          Container(
            width: 100.w,
            height: 100.h,
            decoration: BoxDecoration(
              color: cs.primary.withOpacity(
                0.12,
              ), // ✅ FIXED
              borderRadius: BorderRadius.circular(30),
            ),
            child: Center(
              child: Icon(
                Icons.shopping_cart_outlined,
                color: cs.primary, // ✅ FIXED
                size: 40.sp,
              ),
            ),
          ),

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
            mainAxisAlignment:
                MainAxisAlignment.spaceBetween,
            children: [
              _buildType(
                context,
                Icons.store,
                'متجر',
                cs.primary, // ✅ FIXED
              ),
              _buildType(
                context,
                Icons.local_shipping,
                'مورد',
                cs.secondary, // ✅ FIXED
              ),
              _buildType(
                context,
                Icons.admin_panel_settings,
                'مدير',
                ext.warning, // 🔥 Using theme warning color
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
              if (v == null || v.isEmpty)
                return 'Enter email';
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
              if (v == null || v.length < 6)
                return 'Weak password';
              return null;
            },
          ),

          verticalSpace(30.h),

          // Login button
          ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: cs.primary, // ✅ FIXED
              foregroundColor: cs.onPrimary,
              minimumSize: const Size(double.infinity, 50),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
            ),
            onPressed: () {},
            child: const Text('تسجيل الدخول'),
          ),
        ],
      ),
    );
  }

  Widget _buildType(
    BuildContext context,
    IconData icon,
    String text,
    Color color,
  ) {
    final cs = Theme.of(context).colorScheme;

    return Container(
      width: 100,
      height: 100,
      decoration: BoxDecoration(
        color: cs.surface, // ✅ FIXED
        borderRadius: BorderRadius.circular(40),
        border: Border.all(
          color: cs.outline.withOpacity(0.3), // ✅ FIXED
        ),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          IconButton(
            icon: Icon(icon),
            color: color,
            onPressed: () {},
          ),
          verticalSpace(10.h),
          Text(
            text,
            style: TextStyles.font16bold.copyWith(
              color: cs.onSurface, // ✅ FIXED
            ),
          ),
        ],
      ),
    );
  }
}
