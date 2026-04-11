import 'package:b2b/modules/super/features/invoice/data/super_invoice_data.dart';
import 'package:b2b/modules/super/features/invoice/data/super_invoice_model.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'super_invoice_state.dart';

class SuperInvoiceCubit extends Cubit<SuperInvoiceState> {
  SuperInvoiceCubit() : super(SuperInvoiceState.initial(superInvoicesFakeData));

  void changeFilter(SuperInvoiceFilter filter) {
    if (filter == state.filter) return;

    final filtered = state.allInvoices.where((invoice) {
      switch (filter) {
        case SuperInvoiceFilter.purchases:
          return invoice.kind == SuperInvoiceKind.purchases;
        case SuperInvoiceFilter.sales:
          return invoice.kind == SuperInvoiceKind.sales;
      }
    }).toList();

    emit(state.copyWith(filter: filter, visibleInvoices: filtered));
  }
}
