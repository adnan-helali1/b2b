import 'package:b2b/core/helpers/spacing.dart';
import 'package:b2b/core/theme/app_color_scheme_extention.dart';
import 'package:b2b/core/theme/textstyles.dart';
import 'package:b2b/core/widgets/b2b_app_bar.dart';
import 'package:b2b/modules/supplier/features/home/ui/widgets/stats_row.dart';
import 'package:b2b/modules/supplier/features/home/ui/widgets/supplier_search_bar.dart';
import 'package:flutter/material.dart';

class SupplierHomeScreen extends StatelessWidget {
  const SupplierHomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final cs = Theme.of(context).colorScheme;
    final ext = Theme.of(
      context,
    ).extension<AppColorScheme>()!;

    return Scaffold(
      backgroundColor: cs.surface,
      appBar: B2bAppBar(
        icon: Icons.local_shipping_outlined,
        title: 'شركة اللذيذ',
        subtitle: 'مورد',
      ),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          Text(
            'منتجاتي',
            style: TextStyles.font18Bold.copyWith(
              color: cs.onSurface,
            ),
          ),
          Text(
            'إدارة المنتجات والمخزون',
            style: TextStyles.font14.copyWith(
              color: cs.onSurfaceVariant,
            ),
          ),
          verticalSpace(20),
          StatsRow(),
          verticalSpace(20),
          SupplierSearchBar(),
        ],
      ),
    );
  }
}
