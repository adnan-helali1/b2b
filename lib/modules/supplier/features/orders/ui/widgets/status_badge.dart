// features/orders/ui/widgets/status_badge.dart

import 'package:b2b/core/theme/app_color_scheme_extention.dart';
import 'package:flutter/material.dart';

import '../../logic/orders_state.dart';

class StatusBadge extends StatelessWidget {
  final OrderStatus status;

  const StatusBadge({super.key, required this.status});

  @override
  Widget build(BuildContext context) {
    final ext = Theme.of(
      context,
    ).extension<AppColorScheme>()!;
    final cs = Theme.of(context).colorScheme;

    late Color color;
    late String text;

    switch (status) {
      case OrderStatus.newOrder:
        color = cs.error;
        text = 'طلب جديد';
        break;
      case OrderStatus.accepted:
        color = ext.success;
        text = 'تم القبول';
        break;
      case OrderStatus.preparing:
        color = ext.warning;
        text = 'قيد التحضير';
        break;
      case OrderStatus.shipped:
        color = ext.info;
        text = 'تم الشحن';
        break;
    }

    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: 10,
        vertical: 6,
      ),
      decoration: BoxDecoration(
        color: color.withOpacity(0.12),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Text(
        text,
        style: Theme.of(context).textTheme.labelMedium
            ?.copyWith(
              color: color,
              fontWeight: FontWeight.w600,
            ),
      ),
    );
  }
}
