import 'package:b2b/core/helpers/extensions.dart';
import 'package:b2b/core/helpers/spacing.dart';
import 'package:b2b/core/theme/textstyles.dart';
import 'package:b2b/core/widgets/app_search_filed.dart';
import 'package:b2b/core/widgets/b2b_app_bar.dart';
import 'package:b2b/core/widgets/super_header_on_screen.dart';
import 'package:b2b/modules/super/features/store/ui/data/super_store_data.dart';
import 'package:b2b/modules/super/features/store/ui/widgets/super_store_filter_chip.dart';
import 'package:b2b/modules/super/features/store/ui/widgets/super_store_product_card.dart';
import 'package:b2b/modules/super/features/store/ui/widgets/super_store_stat_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SuperStoreScreen extends StatefulWidget {
  const SuperStoreScreen({super.key});

  @override
  State<SuperStoreScreen> createState() => _SuperStoreScreenState();
}

enum StockFilter { all, low, normal }

class _SuperStoreScreenState extends State<SuperStoreScreen> {
  StockFilter _activeFilter = StockFilter.all;

  List<StoreItem> get _filteredItems {
    if (_activeFilter == StockFilter.all) return items;
    return items.where((item) => item.status == _activeFilter).toList();
  }

  @override
  Widget build(BuildContext context) {
    final lowCount = items
        .where((item) => item.status == StockFilter.low)
        .length;

    return Scaffold(
      appBar: const B2bAppBar(
        title: 'متجر الأسرة',
        subtitle: 'سوبر ماركت',
        icon: Icons.shopping_cart_outlined,
      ),
      body: Padding(
        padding: EdgeInsets.all(16.r),
        child: Column(
          children: [
            StoreHeader(lowCount: lowCount),
            verticalSpace(14.h),
            Row(
              children: [
                Expanded(
                  child: SuperStoreStatCard(
                    title: 'المنتجات',
                    value: '${items.length}',
                    valueColor: context.cs.onSurface,
                  ),
                ),
                horizontalSpace(8.w),
                Expanded(
                  child: SuperStoreStatCard(
                    title: 'منخفض',
                    value: '$lowCount',
                    valueColor: context.cs.error,
                  ),
                ),
                horizontalSpace(8.w),
                Expanded(
                  child: SuperStoreStatCard(
                    title: 'الكمية',
                    value:
                        '${items.fold<int>(0, (sum, item) => sum + item.stock)}',
                    valueColor: context.appColors.success,
                  ),
                ),
              ],
            ),
            verticalSpace(12.h),
            AppSearchFiled(hintText: 'ابحث عن منتج...'),
            verticalSpace(12.h),
            Row(
              children: [
                SuperStoreFilterChip(
                  label: 'الكل',
                  isSelected: _activeFilter == StockFilter.all,
                  onTap: () => setState(() => _activeFilter = StockFilter.all),
                ),
                horizontalSpace(8.w),
                SuperStoreFilterChip(
                  label: 'مخزون منخفض',
                  isSelected: _activeFilter == StockFilter.low,
                  onTap: () => setState(() => _activeFilter = StockFilter.low),
                ),
                horizontalSpace(8.w),
                SuperStoreFilterChip(
                  label: 'طبيعي',
                  isSelected: _activeFilter == StockFilter.normal,
                  onTap: () =>
                      setState(() => _activeFilter = StockFilter.normal),
                ),
              ],
            ),
            verticalSpace(14.h),
            Expanded(
              child: ListView.separated(
                itemCount: _filteredItems.length,
                separatorBuilder: (_, __) => verticalSpace(10.h),
                itemBuilder: (context, index) {
                  final item = _filteredItems[index];
                  final statusColor = item.status == StockFilter.low
                      ? context.cs.error
                      : context.cs.secondary;

                  return SuperStoreProductCard(
                    imagePath: item.imagePath,
                    name: item.name,
                    category: item.category,
                    unit: item.unit,
                    currentStock: item.stock,
                    minStock: item.minStock,
                    maxStock: item.maxStock,
                    statusLabel: item.status == StockFilter.low
                        ? 'منخفض'
                        : 'طبيعي',
                    statusColor: statusColor,
                    showLowStockWarning: item.status == StockFilter.low,
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class StoreHeader extends StatelessWidget {
  final int lowCount;

  const StoreHeader({required this.lowCount});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: SuperHeaderOnScreen(
            bigLabel: 'إدارة المخزون',
            smallLabel: 'تتبع المنتجات والكميات',
          ),
        ),
        Container(
          padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 5.h),
          decoration: BoxDecoration(
            color: context.cs.error,
            borderRadius: BorderRadius.circular(30.r),
          ),
          child: Text(
            'تنبيه $lowCount',
            style: TextStyles.font12w600.copyWith(color: context.cs.onError),
          ),
        ),
      ],
    );
  }
}
