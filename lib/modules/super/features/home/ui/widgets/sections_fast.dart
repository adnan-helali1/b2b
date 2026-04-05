import 'package:b2b/core/helpers/spacing.dart';
import 'package:b2b/core/theme/app_color_scheme_extention.dart';
import 'package:b2b/core/theme/textstyles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class QuickActionItem extends StatelessWidget {
  final IconData icon;
  final String label;

  const QuickActionItem({super.key, required this.icon, required this.label});

  @override
  Widget build(BuildContext context) {
    final cs = Theme.of(context).colorScheme;

    return Container(
      padding: const EdgeInsets.symmetric(vertical: 14),
      decoration: BoxDecoration(
        color: cs.onPrimary.withOpacity(0.15),
        borderRadius: BorderRadius.circular(16),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            icon,
            color: cs.onPrimary, // ✅ FIXED
            size: 26.sp,
          ),

          verticalSpace(8.h),

          Text(
            label,
            style: TextStyles.font12normal.copyWith(
              color: cs.onPrimary, // ✅ FIXED
            ),
          ),
        ],
      ),
    );
  }
}
