import 'package:b2b/core/helpers/extensions.dart';
import 'package:b2b/core/helpers/spacing.dart';
import 'package:b2b/core/theme/textstyles.dart';
import 'package:b2b/core/widgets/b2b_app_bar.dart';
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

  static const _items = [
    _StoreItem(
      name: 'طماطم طازجة',
      category: 'خضروات - مزارع الخير',
      imagePath: 'assets/images/tomato.jfif',
      unit: 'كجم',
      stock: 35,
      minStock: 50,
      maxStock: 200,
      status: StockFilter.low,
    ),
    _StoreItem(
      name: 'زيت زيتون بكر',
      category: 'بقالة - النقاء الممتازة',
      imagePath: 'assets/images/oil.jfif',
      unit: 'لتر',
      stock: 85,
      minStock: 30,
      maxStock: 100,
      status: StockFilter.normal,
    ),
    _StoreItem(
      name: 'أرز بسمتي',
      category: 'حبوب - أرض الخير',
      imagePath: 'assets/images/rise.jfif',
      unit: 'كيس',
      stock: 170,
      minStock: 40,
      maxStock: 250,
      status: StockFilter.normal,
    ),
    _StoreItem(
      name: 'صدر دجاج',
      category: 'لحوم - مزارع المروج',
      imagePath: 'assets/images/chicken.jfif',
      unit: 'كجم',
      stock: 18,
      minStock: 25,
      maxStock: 120,
      status: StockFilter.low,
    ),
  ];

  List<_StoreItem> get _filteredItems {
    if (_activeFilter == StockFilter.all) return _items;
    return _items.where((item) => item.status == _activeFilter).toList();
  }

  @override
  Widget build(BuildContext context) {
    final lowCount = _items
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
            _StoreHeader(lowCount: lowCount),
            verticalSpace(14.h),
            Row(
              children: [
                Expanded(
                  child: SuperStoreStatCard(
                    title: 'المنتجات',
                    value: '${_items.length}',
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
                        '${_items.fold<int>(0, (sum, item) => sum + item.stock)}',
                    valueColor: context.appColors.success,
                  ),
                ),
              ],
            ),
            verticalSpace(12.h),
            const _StoreSearchField(),
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

class _StoreHeader extends StatelessWidget {
  final int lowCount;

  const _StoreHeader({required this.lowCount});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'إدارة المخزون',
                style: TextStyles.font22bold.copyWith(
                  color: context.cs.onSurface,
                ),
              ),
              Text(
                'تتبع المنتجات والكميات',
                style: TextStyles.font14.copyWith(
                  color: context.cs.onSurfaceVariant,
                ),
              ),
            ],
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

class _StoreSearchField extends StatelessWidget {
  const _StoreSearchField();

  @override
  Widget build(BuildContext context) {
    return TextField(
      textDirection: TextDirection.rtl,
      decoration: InputDecoration(
        isDense: true,
        hintText: 'ابحث عن منتج...',
        hintStyle: TextStyles.font14.copyWith(
          color: context.cs.onSurfaceVariant,
        ),
        suffixIcon: Icon(Icons.search, color: context.cs.onSurfaceVariant),
        filled: true,
        fillColor: context.cs.surface,
        contentPadding: EdgeInsets.symmetric(horizontal: 14.w, vertical: 12.h),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(14.r),
          borderSide: BorderSide(color: context.appColors.borderColor),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(14.r),
          borderSide: BorderSide(color: context.appColors.borderColor),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(14.r),
          borderSide: BorderSide(color: context.cs.primary),
        ),
      ),
    );
  }
}

class _StoreItem {
  final String imagePath;
  final String name;
  final String category;
  final String unit;
  final int stock;
  final int minStock;
  final int maxStock;
  final StockFilter status;

  const _StoreItem({
    required this.imagePath,
    required this.name,
    required this.category,
    required this.unit,
    required this.stock,
    required this.minStock,
    required this.maxStock,
    required this.status,
  });
}
