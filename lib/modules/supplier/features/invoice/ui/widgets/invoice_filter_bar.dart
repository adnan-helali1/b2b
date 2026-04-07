// lib/modules/invoices/ui/widgets/invoice_filter_bar.dart
import 'package:b2b/modules/supplier/features/invoice/logic/cubit/invoice_cubit.dart';
import 'package:b2b/modules/supplier/features/invoice/logic/cubit/invoice_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class InvoiceFilterBar extends StatelessWidget {
  const InvoiceFilterBar({super.key});

  @override
  Widget build(BuildContext context) {
    final cs = Theme.of(context).colorScheme;

    final filters = [
      InvoiceFilter.all,
      InvoiceFilter.paid,
      InvoiceFilter.unpaid,
      InvoiceFilter.partial,
    ];

    final labels = {
      InvoiceFilter.all: 'الكل',
      InvoiceFilter.paid: 'مدفوعة',
      InvoiceFilter.unpaid: 'غير مدفوعة',
      InvoiceFilter.partial: 'جزئية',
    };

    return BlocBuilder<InvoicesCubit, InvoicesState>(
      builder: (context, state) {
        return SizedBox(
          height: 44,
          child: ListView.separated(
            padding: const EdgeInsets.symmetric(
              horizontal: 16,
            ),
            scrollDirection: Axis.horizontal,
            itemBuilder: (context, index) {
              final filter = filters[index];
              final isSelected = filter == state.filter;

              return GestureDetector(
                onTap: () => context
                    .read<InvoicesCubit>()
                    .changeFilter(filter),
                child: Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 16,
                    vertical: 8,
                  ),
                  decoration: BoxDecoration(
                    color: isSelected
                        ? cs.primary
                        : cs.surface,
                    borderRadius: BorderRadius.circular(20),
                    border: Border.all(
                      color: cs.primary.withOpacity(0.4),
                    ),
                  ),
                  alignment: Alignment.center,
                  child: Text(
                    labels[filter]!,
                    style: TextStyle(
                      color: isSelected
                          ? cs.onPrimary
                          : cs.onSurface,
                      fontWeight: FontWeight.w600,
                      fontSize: 13,
                      fontFamily: 'Cairo',
                    ),
                  ),
                ),
              );
            },
            separatorBuilder: (_, __) =>
                const SizedBox(width: 8),
            itemCount: filters.length,
          ),
        );
      },
    );
  }
}
