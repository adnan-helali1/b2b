import 'package:b2b/core/helpers/spacing.dart';
import 'package:b2b/core/theme/app_color_scheme_extention.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AppStatsCard extends StatelessWidget {
  final IconData icon;
  final Color iconBgColor;
  final Color iconColor;
  final String value;
  final String label;
  final Axis direction;
  final Color? backgroundColor;
  final double? iconSize;

  const AppStatsCard({
    super.key,
    required this.icon,
    required this.iconBgColor,
    required this.iconColor,
    required this.value,
    required this.label,
    required this.direction,
    this.backgroundColor,
    this.iconSize,
  });

  @override
  Widget build(BuildContext context) {
    final cs = Theme.of(context).colorScheme;
    final ext = Theme.of(context).extension<AppColorScheme>()!;

    final children = [
      // Icon
      Container(
        padding: const EdgeInsets.all(10),
        decoration: BoxDecoration(
          color: iconBgColor,
          borderRadius: BorderRadius.circular(12),
        ),
        child: Icon(icon, color: iconColor, size: iconSize ?? 30),
      ),

      direction == Axis.horizontal
          ? horizontalSpace(12.w)
          : verticalSpace(12.h),

      // Texts
      Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            value,
            style: Theme.of(context).textTheme.titleLarge!.copyWith(
              fontWeight: FontWeight.bold,
              color: cs.onSurface,
              fontFamily: 'cairo',
            ),
          ),
          verticalSpace(4.h),
          Text(
            label,
            style: Theme.of(context).textTheme.bodySmall!.copyWith(
              color: cs.onSurfaceVariant,
              fontFamily: 'cairo',
            ),
          ),
        ],
      ),
    ];

    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        border: Border.all(color: ext.borderColor),
        color: backgroundColor,
        borderRadius: BorderRadius.circular(16),
      ),
      child: direction == Axis.horizontal
          ? Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: children,
            )
          : Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: children,
            ),
    );
  }
}
