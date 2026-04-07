// lib/modules/invoices/logic/cubit/invoices_state.dart
import 'package:b2b/modules/supplier/features/invoice/data/invoice_model.dart';
import 'package:equatable/equatable.dart';

enum InvoiceFilter { all, paid, unpaid, partial }

class InvoicesState extends Equatable {
  final List<InvoiceModel> allInvoices;
  final List<InvoiceModel> visibleInvoices;
  final InvoiceFilter filter;

  final double totalAmount;
  final double collectedAmount;
  final double pendingAmount;
  final double collectionRate; // 0..1

  const InvoicesState({
    required this.allInvoices,
    required this.visibleInvoices,
    required this.filter,
    required this.totalAmount,
    required this.collectedAmount,
    required this.pendingAmount,
    required this.collectionRate,
  });

  factory InvoicesState.initial(
    List<InvoiceModel> invoices,
  ) {
    final totals = _calculateTotals(invoices);
    return InvoicesState(
      allInvoices: invoices,
      visibleInvoices: invoices,
      filter: InvoiceFilter.all,
      totalAmount: totals.total,
      collectedAmount: totals.collected,
      pendingAmount: totals.pending,
      collectionRate: totals.total == 0
          ? 0
          : totals.collected / totals.total,
    );
  }

  @override
  List<Object?> get props => [
    allInvoices,
    visibleInvoices,
    filter,
    totalAmount,
    collectedAmount,
    pendingAmount,
    collectionRate,
  ];

  InvoicesState copyWith({
    List<InvoiceModel>? allInvoices,
    List<InvoiceModel>? visibleInvoices,
    InvoiceFilter? filter,
    double? totalAmount,
    double? collectedAmount,
    double? pendingAmount,
    double? collectionRate,
  }) {
    return InvoicesState(
      allInvoices: allInvoices ?? this.allInvoices,
      visibleInvoices:
          visibleInvoices ?? this.visibleInvoices,
      filter: filter ?? this.filter,
      totalAmount: totalAmount ?? this.totalAmount,
      collectedAmount:
          collectedAmount ?? this.collectedAmount,
      pendingAmount: pendingAmount ?? this.pendingAmount,
      collectionRate: collectionRate ?? this.collectionRate,
    );
  }

  static _Totals _calculateTotals(
    List<InvoiceModel> invoices,
  ) {
    double total = 0;
    double collected = 0;
    double pending = 0;

    for (final inv in invoices) {
      total += inv.total;
      collected += inv.paid;
      pending += (inv.total - inv.paid);
    }

    return _Totals(
      total: total,
      collected: collected,
      pending: pending,
    );
  }
}

class _Totals {
  final double total;
  final double collected;
  final double pending;

  const _Totals({
    required this.total,
    required this.collected,
    required this.pending,
  });
}
