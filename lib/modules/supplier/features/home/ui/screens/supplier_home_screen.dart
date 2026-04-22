import 'package:b2b/core/helpers/spacing.dart';
import 'package:b2b/core/theme/textstyles.dart';
import 'package:b2b/core/widgets/app_search_filed.dart';
import 'package:b2b/core/widgets/app_stats_row.dart';
import 'package:b2b/modules/supplier/features/products/logic/products_cubit.dart';
import 'package:b2b/modules/supplier/features/products/ui/widgets/category_filter_bar.dart';
import 'package:b2b/modules/supplier/features/products/ui/widgets/product_item_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SupplierHomeScreen extends StatelessWidget {
  const SupplierHomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final cs = Theme.of(context).colorScheme;

    return SafeArea(
      child: Scaffold(
        body: BlocProvider(
          create: (_) => ProductsCubit(),
          child: ListView(
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
              AppStatsRow(
                items: const [
                  AppStatsRowItem(
                    icon: Icons.view_in_ar,
                    iconBgColor: Color(0x1A1E4DD8),
                    iconColor: Color(0xFF1E4DD8),
                    value: '5',
                    label: 'إجمالي المنتجات',
                    direction: Axis.horizontal,
                  ),
                  AppStatsRowItem(
                    icon: Icons.trending_up,
                    iconBgColor: Color(0x1F2E7D32),
                    iconColor: Color(0xFF2E7D32),
                    value: '60k',
                    label: 'إجمالي المبيعات',
                    direction: Axis.horizontal,
                  ),
                ],
              ),

              verticalSpace(20),
              AppSearchFiled(
                showAddButton: true,
                hintText: 'ابحث عن منتج...',
              ),
              verticalSpace(20),

              const CategoryFilterBar(),

              verticalSpace(12),

              BlocBuilder<ProductsCubit, ProductsState>(
                builder: (context, state) {
                  return Column(
                    children: state.filtered
                        .map(
                          (e) =>
                              ProductItemCard(product: e),
                        )
                        .toList(),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
