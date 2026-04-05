import 'package:b2b/core/theme/app_color_scheme_extention.dart';
import 'package:b2b/modules/supplier/features/home/ui/widgets/supplier_stats_card.dart';
import 'package:flutter/material.dart';

class StatsRow extends StatelessWidget {
  const StatsRow({super.key});

  @override
  Widget build(BuildContext context) {
    final cs = Theme.of(context).colorScheme;
    final ext = Theme.of(
      context,
    ).extension<AppColorScheme>()!;
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        SupplierStatsCard(
          icon: Icons.view_in_ar,
          iconBgColor: cs.primary.withOpacity(0.10),
          iconColor: cs.primary,
          value: '5',
          label: 'إجمالي المنتجات',
        ),
        SupplierStatsCard(
          icon: Icons.trending_up,
          iconBgColor: ext.success.withOpacity(0.12),
          iconColor: ext.success,
          value: '60k',
          label: 'إجمالي المبيعات',
        ),
      ],
    );
  }
}
