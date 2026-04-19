class SuperInvoiceModel {
  final String id;
  final String partyName;
  final String partyType;
  final DateTime date;
  final double total;
  final double paid;
  final SuperInvoiceKind kind;
  final SuperInvoiceStatus status;

  const SuperInvoiceModel({
    required this.id,
    required this.partyName,
    required this.partyType,
    required this.date,
    required this.total,
    required this.paid,
    required this.kind,
    required this.status,
  });

  double get dueAmount => (total - paid).clamp(0, double.infinity);
}

enum SuperInvoiceKind { purchases, sales }

enum SuperInvoiceStatus { paid, reviewing, delayed }
