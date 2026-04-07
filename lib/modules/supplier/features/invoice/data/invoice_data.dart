// lib/modules/invoices/data/invoices_fake_data.dart
import 'invoice_model.dart';

List<InvoiceModel> invoicesFakeData = <InvoiceModel>[
  InvoiceModel(
    id: 'INV-2026-001',
    clientName: 'سوبرماركت الوطنية',
    orderId: 'ORD-245',
    date: DateTime(2026, 4, 5),
    total: 2450.00,
    paid: 2450.00,
    status: InvoiceStatus.paid,
  ),
  InvoiceModel(
    id: 'INV-2026-002',
    clientName: 'سوبرماركت الخير',
    orderId: 'ORD-246',
    date: DateTime(2026, 4, 4),
    total: 1890.00,
    paid: 1000.00,
    status: InvoiceStatus.partial,
    dueAmount: 890.00,
    dueDate: DateTime(2026, 4, 19),
  ),
  InvoiceModel(
    id: 'INV-2026-003',
    clientName: 'سوبرماركت الهدى',
    orderId: 'ORD-247',
    date: DateTime(2026, 4, 3),
    total: 1770.00,
    paid: 0.00,
    status: InvoiceStatus.unpaid,
    dueAmount: 1770.00,
    dueDate: DateTime(2026, 4, 18),
  ),
];
