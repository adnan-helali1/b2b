import 'package:b2b/modules/super/features/invoice/data/super_invoice_model.dart';

enum SuperInvoiceFilter { purchases, sales }

class SuperInvoiceState {
  final List<SuperInvoiceModel> allInvoices;
  final List<SuperInvoiceModel> visibleInvoices;
  final SuperInvoiceFilter filter;
  final double salesAmount;
  final double purchasesAmount;
  final double netProfit;
  final double pendingPayments;

  const SuperInvoiceState({
    required this.allInvoices,
    required this.visibleInvoices,
    required this.filter,
    required this.salesAmount,
    required this.purchasesAmount,
    required this.netProfit,
    required this.pendingPayments,
  });

  factory SuperInvoiceState.initial(List<SuperInvoiceModel> invoices) {
    final summary = _calculateSummary(invoices);
    return SuperInvoiceState(
      allInvoices: invoices,
      visibleInvoices: invoices
          .where((e) => e.kind == SuperInvoiceKind.purchases)
          .toList(),
      filter: SuperInvoiceFilter.purchases,
      salesAmount: summary.salesAmount,
      purchasesAmount: summary.purchasesAmount,
      netProfit: summary.netProfit,
      pendingPayments: summary.pendingPayments,
    );
  }

  SuperInvoiceState copyWith({
    List<SuperInvoiceModel>? allInvoices,
    List<SuperInvoiceModel>? visibleInvoices,
    SuperInvoiceFilter? filter,
    double? salesAmount,
    double? purchasesAmount,
    double? netProfit,
    double? pendingPayments,
  }) {
    return SuperInvoiceState(
      allInvoices: allInvoices ?? this.allInvoices,
      visibleInvoices: visibleInvoices ?? this.visibleInvoices,
      filter: filter ?? this.filter,
      salesAmount: salesAmount ?? this.salesAmount,
      purchasesAmount: purchasesAmount ?? this.purchasesAmount,
      netProfit: netProfit ?? this.netProfit,
      pendingPayments: pendingPayments ?? this.pendingPayments,
    );
  }

  static _InvoiceSummary _calculateSummary(List<SuperInvoiceModel> invoices) {
    double salesAmount = 0;
    double purchasesAmount = 0;
    double pendingPayments = 0;

    for (final invoice in invoices) {
      if (invoice.kind == SuperInvoiceKind.sales) {
        salesAmount += invoice.total;
      } else {
        purchasesAmount += invoice.total;
      }

      pendingPayments += invoice.dueAmount;
    }

    return _InvoiceSummary(
      salesAmount: salesAmount,
      purchasesAmount: purchasesAmount,
      netProfit: salesAmount - purchasesAmount,
      pendingPayments: pendingPayments,
    );
  }
}

class _InvoiceSummary {
  final double salesAmount;
  final double purchasesAmount;
  final double netProfit;
  final double pendingPayments;

  const _InvoiceSummary({
    required this.salesAmount,
    required this.purchasesAmount,
    required this.netProfit,
    required this.pendingPayments,
  });
}
