import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AuthLogoContainer extends StatelessWidget {
  const AuthLogoContainer({super.key});

  @override
  Widget build(BuildContext context) {
    final cs = Theme.of(context).colorScheme;

    return Container(
      width: 100.w,
      height: 100.h,
      decoration: BoxDecoration(
        color: cs.primary.withOpacity(0.12), // ✅ FIXED
        borderRadius: BorderRadius.circular(30),
      ),
      child: Center(
        child: Icon(
          Icons.shopping_cart_outlined,
          color: cs.primary, // ✅ FIXED
          size: 40.sp,
        ),
      ),
    );
    ;
  }
}
