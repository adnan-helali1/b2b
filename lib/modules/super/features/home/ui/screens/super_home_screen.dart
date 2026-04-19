import 'package:b2b/core/helpers/spacing.dart';
import 'package:b2b/core/widgets/b2b_app_bar.dart';
import 'package:b2b/core/widgets/app_stats_row.dart';
import 'package:b2b/modules/super/features/home/ui/screens/super_home_screen_section2.dart';
import 'package:b2b/modules/super/features/home/ui/screens/super_Categries_grid.dart';
import 'package:b2b/core/widgets/app_search_filed.dart';
import 'package:b2b/modules/super/features/home/ui/widgets/super_fast_section.dart';
import 'package:b2b/modules/super/features/home/ui/widgets/texts_home_super.dart';
import 'package:flutter/material.dart';

class SuperHomeScreen extends StatelessWidget {
  const SuperHomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: B2bAppBar(
        title: 'متجر الأسرة',
        subtitle: 'سوبر ماركت',
        icon: Icons.shopping_cart_outlined,
      ),
      body: ListView(
        children: [
          verticalSpace(20),
          const AppSearchFiled(hintText: 'ابحث عن منتج، فئة أو مورد...'),
          const Padding(
            padding: EdgeInsets.all(16),
            child: AppStatsRow(
              items: [
                AppStatsRowItem(
                  icon: Icons.inventory_2_outlined,
                  iconBgColor: Color(0x1A1E4DD8),
                  iconColor: Color(0xFF1E4DD8),
                  value: '8',
                  label: 'الطلبات\n النشطة',
                  direction: Axis.vertical,
                ),
                AppStatsRowItem(
                  icon: Icons.assignment_turned_in_outlined,
                  iconBgColor: Color(0x332E7D32),
                  iconColor: Color(0xFF2E7D32),
                  value: '701',
                  label: 'المنتجات',
                  direction: Axis.vertical,
                ),
                AppStatsRowItem(
                  icon: Icons.warning_amber_rounded,
                  iconBgColor: Color(0x1FFF9800),
                  iconColor: Color(0xFFFF9800),
                  value: '12',
                  label: 'تنبيهات المخزون',
                  direction: Axis.vertical,
                ),
              ],
            ),
          ),
          const QuickActionsSection(),
          TextsHomeSuper(),
          CategoriesGrid(),
          HomeScreenSection2(),
        ],
      ),
    );
  }
}
