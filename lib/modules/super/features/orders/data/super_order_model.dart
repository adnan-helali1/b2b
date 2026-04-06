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
