import 'package:b2b/core/helpers/spacing.dart';
import 'package:b2b/core/theme/app_color_scheme_extention.dart';
import 'package:b2b/core/theme/textstyles.dart';
import 'package:b2b/core/widgets/b2b_app_bar.dart';
import 'package:b2b/modules/super/features/home/ui/widgets/search_field_home_super.dart';
import 'package:b2b/modules/super/features/home/ui/widgets/stats_row.dart';
import 'package:b2b/modules/super/features/home/ui/widgets/super_fast_section.dart';
import 'package:b2b/modules/super/features/home/ui/widgets/super_info_caed.dart';
import 'package:flutter/material.dart';

class SuperHomeScreen extends StatelessWidget {
  const SuperHomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final cs = Theme.of(context).colorScheme;
    final ext = Theme.of(context).extension<AppColorScheme>()!;

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
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 2.0, horizontal: 24),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Search by name',
                  style: TextStyles.font16w700.copyWith(
                    color: cs.onSurface, // ✅ FIXED
                  ),
                ),
                Text(
                  'See all',
                  style: TextStyles.font15w700.copyWith(
                    color: cs.primary, // ✅ FIXED
                  ),
                ),
              ],
            ),
          ),
          GridView.builder(
            shrinkWrap: true,
            physics: NeverScrollableScrollPhysics(),
            itemCount: 4,
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              mainAxisSpacing: 12,
              crossAxisSpacing: 12,
              childAspectRatio: 1.6,
            ),
            itemBuilder: (context, index) {
              return CategoryCard(
                title: "منتجات الألبان",
                count: "89 منتج",
                image: "assets/images/dairy.jpg",
                bgColor: const Color(0xFFE3EBF5), // أزرق فاتح
                icon: Icons.local_drink_outlined,
              );
            },
          ),
        ],
      ),
    );
  }
}
