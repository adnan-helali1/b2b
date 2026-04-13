import 'package:b2b/core/widgets/app_Stats_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AppStatsRowItem {
  final IconData icon;
  final Color iconBgColor;
  final Color iconColor;
  final String value;
  final String label;
  final Axis direction;
  final Color? backgroundColor;
  final double? iconSize;

  const AppStatsRowItem({
    required this.icon,
    required this.iconBgColor,
    required this.iconColor,
    required this.value,
    required this.label,
    required this.direction,
    this.backgroundColor,
    this.iconSize,
  });
}

class AppStatsRow extends StatelessWidget {
  final List<AppStatsRowItem> items;
  final double spacing;

  const AppStatsRow({super.key, required this.items, this.spacing = 10});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        for (var i = 0; i < items.length; i++) ...[
          Expanded(
            child: AppStatsCard(
              icon: items[i].icon,
              iconBgColor: items[i].iconBgColor,
              iconColor: items[i].iconColor,
              value: items[i].value,
              label: items[i].label,
              direction: items[i].direction,
              backgroundColor: items[i].backgroundColor,
              iconSize: items[i].iconSize,
            ),
          ),
          if (i != items.length - 1) SizedBox(width: spacing.w),
        ],
      ],
    );
  }
}
