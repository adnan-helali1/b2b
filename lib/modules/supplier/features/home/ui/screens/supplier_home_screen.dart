import 'package:b2b/core/helpers/spacing.dart';
import 'package:b2b/core/theme/colors.dart';
import 'package:b2b/core/theme/textstyles.dart';
import 'package:b2b/core/widgets/b2b_app_bar.dart';
import 'package:b2b/modules/supplier/features/home/ui/widgets/supplier_stats_card.dart';
import 'package:flutter/material.dart';

class SupplierHomeScreen extends StatelessWidget {
  const SupplierHomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: B2bAppBar(
        icon: Icons.local_shipping_outlined,
        title: 'شركة اللذيذ',
        subtitle: 'مورد',
      ),
      body: ListView(
        padding: EdgeInsets.all(16),
        children: [
          Text(
            'منتجاتي',
            style: TextStyles.font18BlackBold,
          ),
          Text(
            'إدارة المنتجات والمخزون',
            style: TextStyles.font14grye600,
          ),
          verticalSpace(20),
          Row(
            mainAxisAlignment:
                MainAxisAlignment.spaceAround,
            children: [
              SupplierStatsCard(
                icon: Icons.view_in_ar,
                iconBgColor: ColorsManegar.cardiconBgcolor,
                iconColor: ColorsManegar.backgroundIcon,
                value: '5',
                label: 'إجمالي المنتجات',
              ),
              SupplierStatsCard(
                icon: Icons.trending_up,
                iconBgColor: ColorsManegar.green100,
                iconColor: ColorsManegar.green,
                value: '60k',
                label: 'إجمالي المبيعات ',
              ),
            ],
          ),
        ],
      ),
    );
  }
}
