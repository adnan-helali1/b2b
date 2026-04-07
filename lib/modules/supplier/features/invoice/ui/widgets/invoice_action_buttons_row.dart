// lib/modules/invoices/ui/widgets/invoice_action_buttons_row.dart
import 'package:flutter/material.dart';

class InvoiceActionButtonsRow extends StatelessWidget {
  final VoidCallback onDetails;
  final VoidCallback onDownload;

  const InvoiceActionButtonsRow({
    super.key,
    required this.onDetails,
    required this.onDownload,
  });

  @override
  Widget build(BuildContext context) {
    final cs = Theme.of(context).colorScheme;

    return Row(
      children: [
        TextButton(
          onPressed: onDetails,
          child: Text(
            'عرض التفاصيل',
            style: TextStyle(
              color: cs.primary,
              fontSize: 12,
              fontWeight: FontWeight.w600,
              fontFamily: 'cairo',
            ),
          ),
        ),
        const SizedBox(width: 8),
        TextButton(
          onPressed: onDownload,
          child: Text(
            'تحميل',
            style: TextStyle(
              color: cs.onSurface.withOpacity(0.8),
              fontSize: 12,
              fontWeight: FontWeight.w500,
              fontFamily: 'Cairo',
            ),
          ),
        ),
      ],
    );
  }
}
