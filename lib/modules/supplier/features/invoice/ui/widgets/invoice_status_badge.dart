// lib/modules/invoices/ui/widgets/invoice_status_badge.dart
import 'package:b2b/core/theme/app_color_scheme_extention.dart';
import 'package:b2b/modules/supplier/features/invoice/data/invoice_model.dart';
import 'package:flutter/material.dart';

class InvoiceStatusBadge extends StatelessWidget {
  final InvoiceStatus status;

  const InvoiceStatusBadge({
    super.key,
    required this.status,
  });

  @override
  Widget build(BuildContext context) {
    final cs = Theme.of(context).colorScheme;
    final ext = Theme.of(
      context,
    ).extension<AppColorScheme>()!;

    late final Color bg;
    late final Color fg;
    late final String label;

    switch (status) {
      case InvoiceStatus.paid:
        bg = ext.success;
        fg = cs.onSurface;
        label = 'مدفوعة';
        break;
      case InvoiceStatus.unpaid:
        bg = cs.errorContainer;
        fg = cs.onSurface;
        label = 'غير مدفوعة';
        break;
      case InvoiceStatus.partial:
        bg = cs.secondaryContainer;
        fg = cs.onSurface;
        label = 'جزئية';
        break;
    }

    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: 10,
        vertical: 4,
      ),
      decoration: BoxDecoration(
        color: bg,
        borderRadius: BorderRadius.circular(999),
      ),
      child: Text(
        label,
        style: TextStyle(
          color: fg,
          fontSize: 11,
          fontWeight: FontWeight.w600,
          fontFamily: 'Cairo',
        ),
      ),
    );
  }
}
