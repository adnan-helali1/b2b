// lib/modules/invoices/ui/widgets/invoice_item_card.dart
import 'package:b2b/modules/supplier/features/invoice/data/invoice_model.dart';
import 'package:flutter/material.dart';

import 'invoice_action_buttons_row.dart';
import 'invoice_status_badge.dart';

class InvoiceItemCard extends StatelessWidget {
  final InvoiceModel invoice;

  const InvoiceItemCard({super.key, required this.invoice});

  @override
  Widget build(BuildContext context) {
    final cs = Theme.of(context).colorScheme;

    return Container(
      margin: const EdgeInsets.symmetric(
        horizontal: 16,
        vertical: 6,
      ),
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: cs.surface,
        borderRadius: BorderRadius.circular(14),
        boxShadow: [
          BoxShadow(
            color: cs.shadow.withOpacity(0.04),
            blurRadius: 4,
            offset: const Offset(0, 2),
          ),
        ],
        border: Border.all(
          color: cs.outlineVariant.withOpacity(0.4),
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Header row: ID + status
          Row(
            children: [
              Text(
                invoice.id,
                style: TextStyle(
                  color: cs.onSurface,
                  fontSize: 14,
                  fontWeight: FontWeight.w700,
                  fontFamily: 'Cairo',
                ),
              ),
              const Spacer(),
              InvoiceStatusBadge(status: invoice.status),
            ],
          ),
          const SizedBox(height: 4),
          Text(
            invoice.clientName,
            style: TextStyle(
              color: cs.onSurface,
              fontSize: 13,
              fontWeight: FontWeight.w600,
              fontFamily: 'Cairo',
            ),
          ),
          const SizedBox(height: 4),
          Text(
            'الطلب: ${invoice.orderId} | ${_formatDate(invoice.date)}',
            style: TextStyle(
              color: cs.onSurface.withOpacity(0.7),
              fontSize: 11,
              fontFamily: 'Cairo',
            ),
          ),
          const SizedBox(height: 8),
          Row(
            children: [
              Expanded(
                child: Text(
                  'الإجمالي: ${invoice.total.toStringAsFixed(2)} ر.س',
                  style: TextStyle(
                    color: cs.onSurface.withOpacity(0.8),
                    fontSize: 12,
                    fontFamily: 'Cairo',
                  ),
                ),
              ),
              Expanded(
                child: Text(
                  'المدفوع: ${invoice.paid.toStringAsFixed(2)} ر.س',
                  style: TextStyle(
                    color: cs.onSurface.withOpacity(0.8),
                    fontSize: 12,
                    fontFamily: 'Cairo',
                  ),
                  textAlign: TextAlign.end,
                ),
              ),
            ],
          ),
          if (invoice.status != InvoiceStatus.paid) ...[
            const SizedBox(height: 4),
            Text(
              'المبلغ المستحق: ${invoice.dueAmount?.toStringAsFixed(2) ?? '-'} ر.س',
              style: TextStyle(
                color: cs.error,
                fontSize: 12,
                fontWeight: FontWeight.w600,
                fontFamily: 'Cairo',
              ),
            ),
            if (invoice.dueDate != null)
              Text(
                'تاريخ الاستحقاق: ${_formatDate(invoice.dueDate!)}',
                style: TextStyle(
                  color: cs.onSurface.withOpacity(0.7),
                  fontSize: 11,
                  fontFamily: 'Cairo',
                ),
              ),
          ],
          const SizedBox(height: 8),
          InvoiceActionButtonsRow(
            onDetails: () {},
            onDownload: () {},
          ),
        ],
      ),
    );
  }

  String _formatDate(DateTime date) {
    final d = date.day.toString().padLeft(2, '0');
    final m = date.month.toString().padLeft(2, '0');
    final y = date.year.toString();
    return '$y-$m-$d';
  }
}
