import 'package:b2b/core/helpers/spacing.dart';
import 'package:b2b/core/widgets/b2b_app_bar.dart';
import 'package:b2b/modules/super/features/home/ui/screens/NOCOLORsuper_home_screen_section2.dart';
import 'package:b2b/modules/super/features/home/ui/screens/super_Categries_grid.dart';
import 'package:b2b/modules/super/features/home/ui/widgets/search_field_home_super.dart';
import 'package:b2b/modules/super/features/home/ui/widgets/stats_row.dart';
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
          const SearchFieldHomeSuper(),
          Padding(padding: const EdgeInsets.all(16), child: const StatsRow()),
          const QuickActionsSection(),
          TextsHomeSuper(),
          CategoriesGrid(),
          HomeScreenSection2(),
        ],
      ),
    );
  }
}
