import 'package:b2b/core/helpers/spacing.dart';
import 'package:b2b/core/theme/colors.dart';
import 'package:b2b/modules/super/features/home/ui/widgets/stats_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class StatsRow extends StatelessWidget {
  const StatsRow({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const Expanded(
          child: StatCard(
            icon: Icons.inventory_2_outlined,
            iconColor: ColorsManegar.darkMove,
            bgColor: ColorsManegar.move,
            number: "8",
            label: "الطلبات النشطة",
          ),
        ),

        horizontalSpace(10.w),
        Expanded(
          child: StatCard(
            icon: Icons.assignment_turned_in_outlined,
            iconColor: ColorsManegar.blue,
            bgColor: ColorsManegar.lightBlue,
            number: "701",
            label: "المنتجات",
          ),
        ),
        horizontalSpace(10.w),
        const Expanded(
          child: StatCard(
            icon: Icons.warning_amber_rounded,
            iconColor: ColorsManegar.red,
            bgColor: ColorsManegar.lightRed,
            number: "12",
            label: "تنبيهات المخزون",
          ),
        ),
      ],
    );
  }
}
