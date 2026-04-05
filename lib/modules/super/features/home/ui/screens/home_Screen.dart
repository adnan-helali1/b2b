import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final cs = Theme.of(context).colorScheme;

    return ListView(
      shrinkWrap: true,
      physics: NeverScrollableScrollPhysics(),
      padding: const EdgeInsets.all(16),
      children: [
        /// 🔹 Header - Latest Orders
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Text(
              'آخر الطلبات',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            Text('عرض الكل', style: TextStyle(color: cs.primary)),
          ],
        ),

        const SizedBox(height: 12),

        /// 🔹 Orders
        _orderCard(
          id: 'ORD-001',
          price: '2,450 ر.س',
          date: 'اليوم',
          status: 'قيد المعالجة',
          statusColor: Colors.blue,
        ),
        _orderCard(
          id: 'ORD-002',
          price: '1,890 ر.س',
          date: 'أمس',
          status: 'تم الشحن',
          statusColor: Colors.purple,
        ),
        _orderCard(
          id: 'ORD-003',
          price: '3,120 ر.س',
          date: 'منذ يومين',
          status: 'تم التسليم',
          statusColor: Colors.green,
        ),

        const SizedBox(height: 20),

        /// 🔹 Suppliers Title
        const Text(
          'الموردين المميزين',
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
        ),

        const SizedBox(height: 12),

        /// 🔹 Suppliers
        _supplierCard(name: 'مزارع الخير', products: '45 منتج', rating: '4.8'),
        _supplierCard(
          name: 'الألبان الوطنية',
          products: '32 منتج',
          rating: '4.9',
        ),
        _supplierCard(
          name: 'البقالة الممتازة',
          products: '67 منتج',
          rating: '4.6',
        ),
      ],
    );
  }

  /// 🧾 Order Card
  Widget _orderCard({
    required String id,
    required String price,
    required String date,
    required String status,
    required Color statusColor,
  }) {
    return Container(
      margin: const EdgeInsets.only(bottom: 10),
      padding: const EdgeInsets.all(14),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: Colors.grey.shade200),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          /// Left
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(id, style: const TextStyle(fontWeight: FontWeight.bold)),
              const SizedBox(height: 6),
              Text(date, style: const TextStyle(color: Colors.grey)),
            ],
          ),

          /// Center (Status)
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
            decoration: BoxDecoration(
              color: statusColor.withOpacity(0.15),
              borderRadius: BorderRadius.circular(12),
            ),
            child: Text(
              status,
              style: TextStyle(color: statusColor, fontSize: 12),
            ),
          ),

          /// Right (Price)
          Text(price, style: const TextStyle(fontWeight: FontWeight.bold)),
        ],
      ),
    );
  }

  /// 🏪 Supplier Card
  Widget _supplierCard({
    required String name,
    required String products,
    required String rating,
  }) {
    return Container(
      margin: const EdgeInsets.only(bottom: 10),
      padding: const EdgeInsets.all(14),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: Colors.grey.shade200),
      ),
      child: Row(
        children: [
          /// Icon
          Container(
            padding: const EdgeInsets.all(10),
            decoration: BoxDecoration(
              color: Colors.blue.withOpacity(0.1),
              shape: BoxShape.circle,
            ),
            child: const Icon(Icons.view_in_ar_sharp, color: Color(0xff1C3B8A)),
          ),

          const SizedBox(width: 12),

          /// Name + Products
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  name,
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  products,
                  style: const TextStyle(color: Colors.grey, fontSize: 14),
                ),
              ],
            ),
          ),

          /// Rating
          Row(
            children: [
              Text(rating),
              const SizedBox(width: 4),
              const Icon(Icons.star, color: Colors.orange, size: 18),
            ],
          ),
        ],
      ),
    );
  }
}
