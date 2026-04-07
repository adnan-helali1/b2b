// lib/modules/invoices/data/invoice_model.dart

class InvoiceModel {
  final String id;
  final String clientName;
  final String orderId;
  final DateTime date;
  final double total;
  final double paid;
  final InvoiceStatus status;
  final double? dueAmount;
  final DateTime? dueDate;

  const InvoiceModel({
    required this.id,
    required this.clientName,
    required this.orderId,
    required this.date,
    required this.total,
    required this.paid,
    required this.status,
    this.dueAmount,
    this.dueDate,
  });
}

enum InvoiceStatus { paid, unpaid, partial }
