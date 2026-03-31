import 'package:b2b/modules/super/features/home/ui/widgets/stats_card.dart';
import 'package:flutter/material.dart';

class StatsRow extends StatelessWidget {
  const StatsRow({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: const [
        Expanded(
          child: StatCard(
            icon: Icons.inventory_2_outlined,
            iconColor: Color(0xFF5268A5),
            bgColor: Color(0xffE8EBF3),
            number: "8",
            label: "الطلبات النشطة",
          ),
        ),

        SizedBox(width: 10),
        Expanded(
          child: StatCard(
            icon: Icons.assignment_turned_in_outlined,
            iconColor: Colors.blue,
            bgColor: Color(0xFFEAF2FF),
            number: "701",
            label: "المنتجات",
          ),
        ),
        SizedBox(width: 10),
        Expanded(
          child: StatCard(
            icon: Icons.warning_amber_rounded,
            iconColor: Colors.red,
            bgColor: Color(0xFFFFEAEA),
            number: "12",
            label: "تنبيهات المخزون",
          ),
        ),
      ],
    );
  }
}
