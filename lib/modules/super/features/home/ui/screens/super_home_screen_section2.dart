import 'package:b2b/core/helpers/extensions.dart';
import 'package:b2b/core/helpers/spacing.dart';
import 'package:b2b/core/routing/routes.dart';
import 'package:b2b/core/theme/textstyles.dart';
import 'package:b2b/modules/super/features/home/ui/widgets/super_order_card.dart';
import 'package:b2b/modules/super/features/home/ui/widgets/super_suppliers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class HomeScreenSection2 extends StatelessWidget {
  const HomeScreenSection2({super.key});

  @override
  Widget build(BuildContext context) {
    final cs = Theme.of(context).colorScheme;

    return ListView(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      padding: const EdgeInsets.all(16),
      children: [
        /// 🔹 Header - Latest Orders
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'آخر الطلبات',
              style: TextStyles.font18w700.copyWith(color: cs.onSurface),
            ),
            GestureDetector(
              onTap: () {
                context.pushNamed(Routes.superOrderScreen);
              },
              child: Text(
                'عرض الكل',
                style: TextStyles.font14.copyWith(
                  color: cs.primary,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
          ],
        ),

        verticalSpace(12.h),

        /// 🔹 Orders
        orderCard(
          context: context,
          id: 'ORD-001',
          price: '2,450 ر.س',
          date: 'اليوم',
          status: 'قيد المعالجة',
          statusColor: Colors.blue,
        ),
        orderCard(
          context: context,
          id: 'ORD-002',
          price: '1,890 ر.س',
          date: 'أمس',
          status: 'تم الشحن',
          statusColor: Colors.purple,
        ),
        orderCard(
          context: context,
          id: 'ORD-003',
          price: '3,120 ر.س',
          date: 'منذ يومين',
          status: 'تم التسليم',
          statusColor: Colors.green,
        ),

        verticalSpace(20.h),

        /// 🔹 Suppliers Title
        Text(
          'الموردين المميزين',
          style: TextStyles.font18w700.copyWith(color: cs.onSurface),
        ),

        verticalSpace(12.h),

        /// 🔹 Suppliers
        supplierCard(
          context: context,
          name: 'مزارع الخير',
          products: '45 منتج',
          rating: '4.8',
        ),
        supplierCard(
          context: context,
          name: 'شركة الألبان العربية',
          products: '32 منتج',
          rating: '4.9',
        ),
        supplierCard(
          context: context,
          name: 'البقالة الممتازة',
          products: '67 منتج',
          rating: '4.6',
        ),
      ],
    );
  }
}
