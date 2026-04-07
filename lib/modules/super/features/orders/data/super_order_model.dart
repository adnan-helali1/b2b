class OrderModel {
  final String id;
  final String status; // pending, shipping, delivered
  final String supplier;
  final String date;
  final String products;
  final String price;

  OrderModel({
    required this.id,
    required this.status,
    required this.supplier,
    required this.date,
    required this.products,
    required this.price,
  });
}

final List<OrderModel> allOrders = [
  OrderModel(
    id: 'ORD-2024-001',
    status: 'pending',
    supplier: 'مزارع الخير',
    date: '2024-03-24',
    products: '5 منتجات',
    price: '2450.00',
  ),
  OrderModel(
    id: 'ORD-2024-002',
    status: 'shipping',
    supplier: 'الألبان الوطنية',
    date: '2024-03-23',
    products: '3 منتجات',
    price: '1890.00',
  ),
  OrderModel(
    id: 'ORD-2024-003',
    status: 'delivered',
    supplier: 'البقالة الممتازة',
    date: '2024-03-22',
    products: '8 منتجات',
    price: '3120.00',
  ),
  OrderModel(
    id: 'ORD-2024-004',
    status: 'pending',
    supplier: 'مزارع الخير',
    date: '2024-03-21',
    products: '4 منتجات',
    price: '1650.00',
  ),
];
