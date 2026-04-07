// lib/modules/invoices/ui/widgets/invoice_list.dart
import 'package:b2b/modules/supplier/features/invoice/logic/cubit/invoice_cubit.dart';
import 'package:b2b/modules/supplier/features/invoice/logic/cubit/invoice_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'invoice_item_card.dart';

class InvoiceList extends StatelessWidget {
  const InvoiceList({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<InvoicesCubit, InvoicesState>(
      builder: (context, state) {
        if (state.visibleInvoices.isEmpty) {
          final cs = Theme.of(context).colorScheme;
          return SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 16,
                vertical: 32,
              ),
              child: Center(
                child: Text(
                  'لا توجد فواتير مطابقة',
                  style: TextStyle(
                    color: cs.onSurface.withOpacity(0.7),
                    fontSize: 13,
                    fontFamily: 'Cairo',
                  ),
                ),
              ),
            ),
          );
        }

        return SliverList.builder(
          itemCount: state.visibleInvoices.length,
          itemBuilder: (context, index) {
            final invoice = state.visibleInvoices[index];
            return InvoiceItemCard(invoice: invoice);
          },
        );
      },
    );
  }
}
