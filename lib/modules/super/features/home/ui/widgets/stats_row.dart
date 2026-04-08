import 'package:b2b/core/helpers/spacing.dart';
import 'package:b2b/core/theme/app_color_scheme_extention.dart';

import 'package:b2b/core/widgets/app_Stats_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class StatsRow extends StatelessWidget {
  const StatsRow({super.key});

  @override
  Widget build(BuildContext context) {
    final cs = Theme.of(context).colorScheme;
    final ext = Theme.of(context).extension<AppColorScheme>()!;

    return Row(
      children: [
        Expanded(
          child: AppStatsCard(
            iconSize: 26,

            direction: Axis.vertical,
            icon: Icons.inventory_2_outlined,
            iconColor: cs.primary,
            iconBgColor: cs.primary.withOpacity(0.10),
            value: "8",
            label: "الطلبات\n النشطة",
            backgroundColor: cs.surface,
          ),
        ),

        horizontalSpace(10.w),

        Expanded(
          child: AppStatsCard(
            iconSize: 26,

            direction: Axis.vertical,
            backgroundColor: cs.surface,
            icon: Icons.assignment_turned_in_outlined,
            iconColor: cs.secondary,
            iconBgColor: cs.secondary.withOpacity(0.20),
            value: "701",
            label: "المنتجات",
          ),
        ),

        horizontalSpace(10.w),

        Expanded(
          child: AppStatsCard(
            direction: Axis.vertical,
            backgroundColor: cs.surface,
            iconSize: 26,
            icon: Icons.warning_amber_rounded,
            iconColor: ext.warning,
            iconBgColor: ext.warning.withOpacity(0.12),
            value: "12",
            label: "تنبيهات المخزون",
          ),
        ),
      ],
    );
  }
}
