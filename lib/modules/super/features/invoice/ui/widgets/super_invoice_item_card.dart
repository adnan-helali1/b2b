import 'package:b2b/core/helpers/extensions.dart';
import 'package:b2b/core/helpers/spacing.dart';
import 'package:b2b/core/theme/textstyles.dart';
import 'package:b2b/modules/super/features/invoice/data/super_invoice_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'super_invoice_action_buttons_row.dart';
import 'super_invoice_status_badge.dart';

class SuperInvoiceItemCard extends StatelessWidget {
  final SuperInvoiceModel invoice;

  const SuperInvoiceItemCard({super.key, required this.invoice});

  @override
  Widget build(BuildContext context) {
    final cs = context.cs;

    return Container(
      margin: EdgeInsets.symmetric(horizontal: 16.w, vertical: 6.h),
      padding: EdgeInsets.all(12.r),
      decoration: BoxDecoration(
        color: cs.surface,
        borderRadius: BorderRadius.circular(14.r),
        border: Border.all(color: context.appColors.borderColor),
        boxShadow: [
          BoxShadow(
            color: cs.shadow.withOpacity(0.04),
            blurRadius: 6,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                width: 42.w,
                height: 42.w,
                decoration: BoxDecoration(
                  color: cs.primary.withOpacity(0.10),
                  borderRadius: BorderRadius.circular(12.r),
                ),
                child: Icon(
                  Icons.description_outlined,
                  color: cs.primary,
                  size: 22.sp,
                ),
              ),
              horizontalSpace(10.w),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      invoice.id,
                      style: TextStyles.font16w700.copyWith(
                        color: cs.onSurface,
                      ),
                    ),
                    verticalSpace(4.h),
                    Text(
                      invoice.partyName,
                      style: TextStyles.font12w600.copyWith(
                        color: cs.onSurfaceVariant,
                      ),
                    ),
                    verticalSpace(2.h),
                    Text(
                      _formatDate(invoice.date),
                      style: TextStyles.font12normal.copyWith(
                        color: cs.onSurfaceVariant,
                      ),
                    ),
                  ],
                ),
              ),
              SuperInvoiceStatusBadge(status: invoice.status),
            ],
          ),
          verticalSpace(14.h),
          Divider(color: cs.outlineVariant.withOpacity(0.6), height: 1),
          verticalSpace(10.h),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'الإجمالي',
                style: TextStyles.font12normal.copyWith(
                  color: cs.onSurfaceVariant,
                ),
              ),
              verticalSpace(2.h),
              Text(
                '${invoice.total.toStringAsFixed(2)} ر.س',
                style: TextStyles.font18w700.copyWith(color: cs.onSurface),
              ),
              verticalSpace(10.h),
              Align(
                alignment: Alignment.centerRight,
                child: SuperInvoiceActionButtonsRow(
                  onPreview: () {},
                  onDownload: () {},
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  String _formatDate(DateTime date) {
    final day = date.day.toString().padLeft(2, '0');
    final month = date.month.toString().padLeft(2, '0');
    final year = date.year.toString();
    return '$year-$month-$day';
  }
}
