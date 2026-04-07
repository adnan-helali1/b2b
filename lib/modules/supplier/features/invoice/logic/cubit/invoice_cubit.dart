// lib/modules/invoices/logic/cubit/invoices_cubit.dart
import 'package:b2b/modules/supplier/features/invoice/data/invoice_data.dart';
import 'package:b2b/modules/supplier/features/invoice/data/invoice_model.dart';
import 'package:b2b/modules/supplier/features/invoice/logic/cubit/invoice_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class InvoicesCubit extends Cubit<InvoicesState> {
  InvoicesCubit()
    : super(InvoicesState.initial(invoicesFakeData));

  void changeFilter(InvoiceFilter filter) {
    if (filter == state.filter) return;

    List<InvoiceModel> filtered;
    switch (filter) {
      case InvoiceFilter.all:
        filtered = state.allInvoices;
        break;
      case InvoiceFilter.paid:
        filtered = state.allInvoices
            .where((e) => e.status == InvoiceStatus.paid)
            .toList();
        break;
      case InvoiceFilter.unpaid:
        filtered = state.allInvoices
            .where((e) => e.status == InvoiceStatus.unpaid)
            .toList();
        break;
      case InvoiceFilter.partial:
        filtered = state.allInvoices
            .where((e) => e.status == InvoiceStatus.partial)
            .toList();
        break;
    }

    emit(
      state.copyWith(
        filter: filter,
        visibleInvoices: filtered,
      ),
    );
  }
}
