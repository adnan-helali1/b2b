import 'package:b2b/core/helpers/extensions.dart';
import 'package:b2b/core/theme/textstyles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SuperPosSearchField extends StatelessWidget {
  const SuperPosSearchField({super.key});

  @override
  Widget build(BuildContext context) {
    return TextField(
      textDirection: TextDirection.rtl,
      decoration: InputDecoration(
        hintText: 'ابحث عن منتج...',
        hintStyle: TextStyles.font14.copyWith(
          color: context.cs.onSurfaceVariant,
        ),
        suffixIcon: Icon(Icons.search, color: context.cs.onSurfaceVariant),
        filled: true,
        fillColor: context.cs.surface,
        contentPadding: EdgeInsets.symmetric(horizontal: 14.w, vertical: 12.h),
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
          borderSide: BorderSide(color: context.cs.primary),
        ),
      ),
    );
  }
}
