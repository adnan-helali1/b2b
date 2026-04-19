import 'package:b2b/core/helpers/extensions.dart';
import 'package:b2b/core/helpers/spacing.dart';
import 'package:b2b/core/widgets/super_header_on_screen.dart';
import 'package:b2b/modules/super/features/invoice/data/super_invoice_model.dart';
import 'package:b2b/modules/super/features/invoice/logic/cubit/super_invoice_cubit.dart';
import 'package:b2b/modules/super/features/invoice/logic/cubit/super_invoice_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'super_invoice_stat_card.dart';

class SuperInvoiceStatsSection extends StatelessWidget {
  const SuperInvoiceStatsSection({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SuperInvoiceCubit, SuperInvoiceState>(
      builder: (context, state) {
        return Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 12.h),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SuperHeaderOnScreen(
                bigLabel: 'الفواتير',
                smallLabel: 'إدارة فواتير المبيعات والمشتريات',
              ),
              verticalSpace(16.h),
              GridView.count(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                crossAxisCount: 2,
                mainAxisSpacing: 12.h,
                crossAxisSpacing: 12.w,
                childAspectRatio: 1.25,
                children: [
                  SuperInvoiceStatCard(
                    title: 'إجمالي المبيعات',
                    value: '${state.salesAmount.toStringAsFixed(2)} ر.س',
                    subtitle:
                        '${state.allInvoices.where((e) => e.kind == SuperInvoiceKind.sales).length} فاتورة',
                    backgroundColor: context.appColors.success.withOpacity(
                      0.12,
                    ),
                    valueColor: context.appColors.success,
                    iconColor: context.appColors.success,
                    icon: Icons.trending_up_rounded,
                  ),
                  SuperInvoiceStatCard(
                    title: 'إجمالي المشتريات',
                    value: '${state.purchasesAmount.toStringAsFixed(2)} ر.س',
                    subtitle:
                        '${state.allInvoices.where((e) => e.kind == SuperInvoiceKind.purchases).length} فاتورة',
                    backgroundColor: context.cs.errorContainer.withOpacity(
                      0.22,
                    ),
                    valueColor: context.cs.error,
                    iconColor: context.cs.error,
                    icon: Icons.trending_down_rounded,
                  ),
                  SuperInvoiceStatCard(
                    title: 'الربح الصافي',
                    value: '${state.netProfit.toStringAsFixed(2)} ر.س',
                    subtitle: 'بعد خصم المشتريات',
                    backgroundColor: context.cs.primary.withOpacity(0.12),
                    valueColor: context.cs.primary,
                    iconColor: context.cs.primary,
                    icon: Icons.account_balance_wallet_outlined,
                  ),
                  SuperInvoiceStatCard(
                    title: 'مدفوعات معلقة',
                    value: '${state.pendingPayments.toStringAsFixed(2)} ر.س',
                    subtitle: 'تحتاج متابعة',
                    backgroundColor: context.appColors.warning.withOpacity(
                      0.16,
                    ),
                    valueColor: context.appColors.warning,
                    iconColor: context.appColors.warning,
                    icon: Icons.calendar_month_outlined,
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
