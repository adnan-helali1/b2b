// features/customers/ui/widgets/customer_stats_grid.dart
import 'package:b2b/core/theme/app_color_scheme_extention.dart';
import 'package:flutter/material.dart';

import 'stats_card.dart';

class CustomerStatsGrid extends StatelessWidget {
  final int totalCustomers;
  final double totalSales;
  final double pendingDues;
  final double averageOrder;

  const CustomerStatsGrid({
    super.key,
    required this.totalCustomers,
    required this.totalSales,
    required this.pendingDues,
    required this.averageOrder,
  });

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    final appColors = Theme.of(
      context,
    ).extension<AppColorScheme>();

    return GridView.count(
      crossAxisCount: 2,
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      mainAxisSpacing: 12,
      crossAxisSpacing: 12,
      childAspectRatio: 1.2,
      children: [
        StatsCard(
          title: 'إجمالي العملاء',
          value: '$totalCustomers',
          subtitle:
              'نشط ${totalCustomers > 0 ? (totalCustomers - 2) : 0}',
          icon: Icons.group_rounded,
          backgroundColor:
              appColors?.info ??
              colorScheme.primaryContainer,
          iconColor: colorScheme.primary,
        ),
        StatsCard(
          title: 'إجمالي المبيعات',
          value: _formatCurrency(totalSales),
          subtitle: 'آخر 30 يوم',
          icon: Icons.bar_chart_rounded,
          backgroundColor:
              appColors?.success ??
              colorScheme.secondaryContainer,
          iconColor:
              appColors?.success ?? colorScheme.secondary,
        ),
        StatsCard(
          title: 'مستحقات معلقة',
          value: _formatCurrency(pendingDues),
          subtitle: 'قابلة للتحصيل',
          icon: Icons.warning_amber_rounded,
          backgroundColor:
              appColors?.warning ??
              colorScheme.errorContainer,
          iconColor:
              appColors?.warning ?? colorScheme.error,
        ),
        StatsCard(
          title: 'متوسط الطلب',
          value: _formatCurrency(averageOrder),
          subtitle: 'لكل عميل',
          icon: Icons.receipt_long_rounded,
          backgroundColor:
              appColors?.borderColor ??
              colorScheme.tertiaryContainer,
          iconColor:
              appColors?.cardBackground ??
              colorScheme.tertiary,
        ),
      ],
    );
  }

  String _formatCurrency(double value) {
    if (value >= 1000) {
      final thousands = value / 1000;
      return '${thousands.toStringAsFixed(1)}K ر.س';
    }
    return '${value.toStringAsFixed(0)} ر.س';
  }
}
