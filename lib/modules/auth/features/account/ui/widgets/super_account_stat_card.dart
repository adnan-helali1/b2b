import 'package:b2b/core/helpers/extensions.dart';
import 'package:b2b/core/helpers/spacing.dart';
import 'package:b2b/core/theme/textstyles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SuperAccountStatCard extends StatelessWidget {
  final String value;
  final String title;
  final String subtitle;
  final Color backgroundColor;
  final Color valueColor;
  final IconData icon;
  final Color iconColor;

  const SuperAccountStatCard({
    super.key,
    required this.value,
    required this.title,
    required this.subtitle,
    required this.backgroundColor,
    required this.valueColor,
    required this.icon,
    required this.iconColor,
  });

  @override
  Widget build(BuildContext context) {
    final cs = context.cs;

    return Container(
      padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 12.h),
      decoration: BoxDecoration(
        color: backgroundColor,
        borderRadius: BorderRadius.circular(16.r),
        border: Border.all(color: context.appColors.borderColor),
      ),
      child: Column(
        children: [
          Container(
            width: 34.w,
            height: 34.w,
            decoration: BoxDecoration(
              color: iconColor.withOpacity(0.12),
              borderRadius: BorderRadius.circular(12.r),
            ),
            child: Icon(icon, color: iconColor, size: 18.sp),
          ),
          verticalSpace(10.h),
          Text(value, style: TextStyles.font18w700.copyWith(color: valueColor)),
          Text(
            title,
            style: TextStyles.font12w600.copyWith(color: cs.onSurfaceVariant),
            textAlign: TextAlign.center,
          ),
          verticalSpace(4.h),
          Text(
            subtitle,
            style: TextStyles.font12normal.copyWith(color: cs.onSurfaceVariant),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}
