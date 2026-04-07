// lib/modules/invoices/ui/widgets/invoices_stats_section.dart
import 'package:b2b/core/theme/app_color_scheme_extention.dart';
import 'package:b2b/modules/supplier/features/invoice/data/invoice_model.dart';
import 'package:b2b/modules/supplier/features/invoice/logic/cubit/invoice_cubit.dart';
import 'package:b2b/modules/supplier/features/invoice/logic/cubit/invoice_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'invoice_stat_card.dart';

class InvoicesStatsSection extends StatelessWidget {
  const InvoicesStatsSection({super.key});

  @override
  Widget build(BuildContext context) {
    final cs = Theme.of(context).colorScheme;
    final ext = Theme.of(
      context,
    ).extension<AppColorScheme>()!;

    return BlocBuilder<InvoicesCubit, InvoicesState>(
      builder: (context, state) {
        final totalCount = state.allInvoices.length;
        final paidCount = state.allInvoices
            .where((e) => e.status == InvoiceStatus.paid)
            .length;
        final pendingCount = state.allInvoices
            .where((e) => e.status != InvoiceStatus.paid)
            .length;

        return Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 16,
            vertical: 12,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'الفواتير',
                style: TextStyle(
                  color: cs.onSurface,
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  fontFamily: 'Cairo',
                ),
              ),
              const SizedBox(height: 4),
              Text(
                'إدارة فواتير العملاء والمدفوعات',
                style: TextStyle(
                  color: cs.onSurface,

                  fontSize: 13,
                  fontFamily: 'Cairo',
                ),
              ),
              const SizedBox(height: 16),
              GridView(
                shrinkWrap: true,
                physics:
                    const NeverScrollableScrollPhysics(),
                gridDelegate:
                    const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      mainAxisSpacing: 12,
                      crossAxisSpacing: 12,
                      childAspectRatio: 1.6,
                    ),
                children: [
                  InvoiceStatCard(
                    title: 'إجمالي الفواتير',
                    value:
                        '${state.totalAmount.toStringAsFixed(2)} ر.س',
                    subtitle: 'فاتورة $totalCount',
                    backgroundColor: cs.surfaceContainer,
                    valueColor: cs.primary,
                    border: cs.primary,
                  ),
                  InvoiceStatCard(
                    title: 'المبالغ المحصلة',
                    value:
                        '${state.collectedAmount.toStringAsFixed(2)} ر.س',
                    subtitle: 'فاتورة $paidCount مدفوعة',
                    backgroundColor:
                        cs.surfaceContainerHigh,
                    valueColor: ext.success,
                    border: ext.success,
                  ),
                  InvoiceStatCard(
                    title: 'المبالغ المعلقة',
                    value:
                        '${state.pendingAmount.toStringAsFixed(2)} ر.س',
                    subtitle: 'فاتورة $pendingCount',
                    backgroundColor: cs.surfaceContainerLow,
                    valueColor: cs.error,
                    border: cs.error,
                  ),
                  InvoiceStatCard(
                    title: 'نسبة التحصيل',
                    value:
                        '${(state.collectionRate * 100).toStringAsFixed(0)}%',
                    subtitle: 'من إجمالي الفواتير',
                    backgroundColor:
                        cs.surfaceContainerHighest,
                    valueColor: Colors.purple,
                    border: Colors.purple,
                  ),
                ],
              ),
            ],
          ),
        );
      },
    );
  }
}
