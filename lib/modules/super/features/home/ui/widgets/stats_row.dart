import 'package:b2b/core/helpers/spacing.dart';
import 'package:b2b/core/theme/app_color_scheme_extention.dart';
import 'package:b2b/modules/super/features/home/ui/widgets/stats_card.dart';
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
          child: StatCard(
            icon: Icons.inventory_2_outlined,
            iconColor: cs.primary,
            bgColor: cs.primary.withOpacity(0.10),
            number: "8",
            label: "الطلبات النشطة",
          ),
        ),

        horizontalSpace(10.w),

        Expanded(
          child: StatCard(
            icon: Icons.assignment_turned_in_outlined,
            iconColor: cs.secondary,
            bgColor: cs.secondary.withOpacity(0.10),
            number: "701",
            label: "المنتجات",
          ),
        ),

        horizontalSpace(10.w),

        Expanded(
          child: StatCard(
            icon: Icons.warning_amber_rounded,
            iconColor: ext.warning,
            bgColor: ext.warning.withOpacity(0.12),
            number: "12",
            label: "تنبيهات المخزون",
          ),
        ),
      ],
    );
  }
}
