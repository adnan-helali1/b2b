import 'package:b2b/modules/super/features/home/ui/widgets/NOCOLORsuper_stats_card.dart';
import 'package:b2b/modules/super/features/home/ui/widgets/NOCOLORsuper_suppliers.dart';
import 'package:flutter/material.dart';

class HomeScreenSection2 extends StatelessWidget {
  const HomeScreenSection2({super.key});

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
        orderCard(
          id: 'ORD-001',
          price: '2,450 ر.س',
          date: 'اليوم',
          status: 'قيد المعالجة',
          statusColor: Colors.blue,
        ),
        orderCard(
          id: 'ORD-002',
          price: '1,890 ر.س',
          date: 'أمس',
          status: 'تم الشحن',
          statusColor: Colors.purple,
        ),
        orderCard(
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
        supplierCard(name: 'مزارع الخير', products: '45 منتج', rating: '4.8'),
        supplierCard(
          name: 'الألبان الوطنية',
          products: '32 منتج',
          rating: '4.9',
        ),
        supplierCard(
          name: 'البقالة الممتازة',
          products: '67 منتج',
          rating: '4.6',
        ),
      ],
    );
  }

  /// 🧾 Order Card
}
