import 'package:b2b/core/helpers/spacing.dart';
import 'package:b2b/core/theme/app_color_scheme_extention.dart';
import 'package:b2b/core/theme/textstyles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class StatCard extends StatelessWidget {
  final IconData icon;
  final Color iconColor;
  final Color bgColor;
  final String number;
  final String label;

  const StatCard({
    super.key,
    required this.icon,
    required this.iconColor,
    required this.bgColor,
    required this.number,
    required this.label,
  });

  @override
  Widget build(BuildContext context) {
    final cs = Theme.of(context).colorScheme;
    final ext = Theme.of(
      context,
    ).extension<AppColorScheme>()!;

    return Container(
      padding: const EdgeInsets.symmetric(vertical: 18),
      decoration: BoxDecoration(
        color: ext.cardBackground, // ✅ FIXED
        borderRadius: BorderRadius.circular(22),
        border: Border.all(
          color: ext.borderColor.withOpacity(
            0.4,
          ), // ✅ FIXED
        ),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          // Icon container
          Container(
            padding: const EdgeInsets.all(10),
            decoration: BoxDecoration(
              color: bgColor,
              shape: BoxShape.circle,
            ),
            child: Icon(icon, color: iconColor),
          ),

          const SizedBox(height: 10),

          // Number
          Text(
            number,
            style: TextStyles.font18Bold.copyWith(
              color: cs.onSurface, // ✅ FIXED
            ),
          ),

          verticalSpace(5.h),

          // Label
          Text(
            label,
            textAlign: TextAlign.center,
            style: TextStyles.font12.copyWith(
              color: cs.onSurfaceVariant, // ✅ FIXED
            ),
          ),
        ],
      ),
    );
  }
}
