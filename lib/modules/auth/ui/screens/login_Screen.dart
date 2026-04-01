import 'package:b2b/core/helpers/spacing.dart';
import 'package:b2b/core/theme/colors.dart';
import 'package:b2b/core/theme/textstyles.dart';
import 'package:b2b/modules/auth/ui/widgets/app_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class loginScreen extends StatelessWidget {
  loginScreen({super.key});

  final emailController = TextEditingController();

  final passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorsManegar.scaffold,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            width: 100.w,
            height: 100.h,
            decoration: BoxDecoration(
              color: ColorsManegar.backgroundIcon,
              borderRadius: BorderRadius.circular(30),
            ),
            child: Center(
              child: Icon(
                Icons.shopping_cart_outlined,
                color: ColorsManegar.white,
                size: 40.sp,
              ),
            ),
          ),
          verticalSpace(10.h),
          Text('Smart Order', style: TextStyles.font22blackbold),
          Text('نظام الطلبات الذكي B2B', style: TextStyles.font18greyw600),
          verticalSpace(30.h),
          Text('اختر نوع الحساب', style: TextStyles.font12GreyW600),
          verticalSpace(20.h),

          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              _buildType(Icons.store, 'متجر', ColorsManegar.backgroundIcon),
              _buildType(
                Icons.local_shipping,
                'مورد',
                const Color.fromARGB(255, 100, 135, 230),
              ),
              _buildType(
                Icons.admin_panel_settings,
                'مدير',
                const Color.fromARGB(255, 255, 0, 0),
              ),
            ],
          ),

          verticalSpace(30.h),

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

          ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: ColorsManegar.backgroundIcon,
              minimumSize: const Size(double.infinity, 50),
            ),
            onPressed: () {},
            child: const Text('تسجيل الدخول'),
          ),
        ],
      ),
    );
  }

  Widget _buildType(IconData icon, String text, Color color) {
    return Container(
      width: 100,
      height: 100,
      decoration: BoxDecoration(
        color: ColorsManegar.white,
        borderRadius: BorderRadius.circular(40),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          IconButton(icon: Icon(icon), color: color, onPressed: () {}),
          verticalSpace(10.h),
          Text(text, style: TextStyles.font16blackbold),
        ],
      ),
    );
  }
}
