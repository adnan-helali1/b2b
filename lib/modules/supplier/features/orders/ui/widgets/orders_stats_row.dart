// features/orders/ui/widgets/orders_stats_row.dart

import 'package:b2b/core/theme/app_color_scheme_extention.dart';
import 'package:flutter/material.dart';

import '../../logic/orders_state.dart';
import 'stats_card.dart';

class OrdersStatsRow extends StatelessWidget {
  final List<OrderEntity> orders;

  const OrdersStatsRow({super.key, required this.orders});

  @override
  Widget build(BuildContext context) {
    final cs = Theme.of(context).colorScheme;
    final ext = Theme.of(
      context,
    ).extension<AppColorScheme>()!;

    final newCount = orders
        .where((e) => e.status == OrderStatus.newOrder)
        .length;
    final activeCount = orders
        .where(
          (e) =>
              e.status == OrderStatus.accepted ||
              e.status == OrderStatus.preparing,
        )
        .length;
    final completedCount = orders
        .where((e) => e.status == OrderStatus.shipped)
        .length;

    return Row(
      children: [
        StatsCard(
          value: '$newCount',
          label: 'جديد',
          color: ext.warning,
        ),
        const SizedBox(width: 8),
        StatsCard(
          value: '$activeCount',
          label: 'نشط',
          color: cs.primary,
        ),
        const SizedBox(width: 8),
        StatsCard(
          value: '$completedCount',
          label: 'مكتمل',
          color: ext.success,
        ),
      ],
    );
  }
}
