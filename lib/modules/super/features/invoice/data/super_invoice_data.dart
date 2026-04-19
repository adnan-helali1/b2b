import 'super_invoice_model.dart';

final superInvoicesFakeData = <SuperInvoiceModel>[
  SuperInvoiceModel(
    id: 'PI-2026-001',
    partyName: 'مزارع الخير',
    partyType: 'مورد',
    date: DateTime(2026, 4, 5),
    total: 2450.00,
    paid: 2450.00,
    kind: SuperInvoiceKind.purchases,
    status: SuperInvoiceStatus.paid,
  ),
  SuperInvoiceModel(
    id: 'PI-2026-002',
    partyName: 'الألبان الوطنية',
    partyType: 'مورد',
    date: DateTime(2026, 4, 4),
    total: 1890.00,
    paid: 0.00,
    kind: SuperInvoiceKind.purchases,
    status: SuperInvoiceStatus.reviewing,
  ),
  SuperInvoiceModel(
    id: 'PI-2026-003',
    partyName: 'البقالة الممتازة',
    partyType: 'مورد',
    date: DateTime(2026, 4, 3),
    total: 3120.00,
    paid: 0.00,
    kind: SuperInvoiceKind.purchases,
    status: SuperInvoiceStatus.delayed,
  ),
  SuperInvoiceModel(
    id: 'SI-2026-001',
    partyName: 'العميل المباشر',
    partyType: 'عميل',
    date: DateTime(2026, 4, 5),
    total: 873.50,
    paid: 873.50,
    kind: SuperInvoiceKind.sales,
    status: SuperInvoiceStatus.paid,
  ),
];
