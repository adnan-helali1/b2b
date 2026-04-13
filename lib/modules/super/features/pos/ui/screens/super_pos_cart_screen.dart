import 'package:b2b/core/helpers/extensions.dart';
import 'package:b2b/core/helpers/spacing.dart';
import 'package:b2b/core/theme/textstyles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SuperPosCartScreen extends StatefulWidget {
  const SuperPosCartScreen({super.key});

  @override
  State<SuperPosCartScreen> createState() => _SuperPosCartScreenState();
}

class _SuperPosCartScreenState extends State<SuperPosCartScreen> {
  final List<_CartItemData> _items = const [
    _CartItemData(
      name: 'طماطم طازجة',
      supplier: 'مزارع الخير',
      price: '85.00 ر.س',
      unitPrice: '8.5 ر.س / كغ',
      quantity: 10,
      imagePath: 'assets/images/tomato.jfif',
    ),
    _CartItemData(
      name: 'حليب كامل الدسم',
      supplier: 'الألبان الوطنية',
      price: '250.00 ر.س',
      unitPrice: '12.5 ر.س / لتر',
      quantity: 20,
      imagePath: 'assets/images/oil.jfif',
    ),
  ];

  late List<_CartItemData> items = _items
      .map(
        (item) => _CartItemData(
          name: item.name,
          supplier: item.supplier,
          price: item.price,
          unitPrice: item.unitPrice,
          quantity: item.quantity,
          imagePath: item.imagePath,
        ),
      )
      .toList();

  int get totalItems => items.fold<int>(0, (sum, item) => sum + item.quantity);

  double get totalAmount => items.fold<double>(0, (sum, item) {
    final value = double.tryParse(
      item.price.replaceAll(RegExp(r'[^0-9.]'), ''),
    );
    return sum + (value ?? 0);
  });

  @override
  Widget build(BuildContext context) {
    final cs = context.cs;

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: cs.surface,
        elevation: 0,
        leading: IconButton(
          onPressed: () => context.pop(),
          icon: Icon(Icons.arrow_back_ios_new_rounded, color: cs.onSurface),
        ),
        title: Text(
          'السلة (${items.length})',
          style: TextStyles.font18Bold.copyWith(color: cs.onSurface),
        ),
      ),
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.all(16.r),
          child: Column(
            children: [
              Expanded(
                child: Container(
                  width: double.infinity,
                  padding: EdgeInsets.all(12.r),
                  decoration: BoxDecoration(
                    color: cs.surface,
                    borderRadius: BorderRadius.circular(18.r),
                    border: Border.all(color: context.appColors.borderColor),
                  ),
                  child: Column(
                    children: [
                      Padding(
                        padding: EdgeInsets.symmetric(
                          horizontal: 4.w,
                          vertical: 4.h,
                        ),
                        child: const SizedBox.shrink(),
                      ),
                      verticalSpace(8.h),
                      Expanded(
                        child: ListView.separated(
                          padding: EdgeInsets.zero,
                          itemCount: items.length + 1,
                          separatorBuilder: (_, index) =>
                              index == items.length - 1
                              ? verticalSpace(10.h)
                              : verticalSpace(8.h),
                          itemBuilder: (context, index) {
                            if (index == items.length) {
                              return _SummaryCard(
                                productCount: items.length,
                                totalQuantity: totalItems,
                                totalAmount: totalAmount,
                              );
                            }

                            final item = items[index];
                            return _CartItemCard(
                              item: item,
                              onDecrease: item.quantity > 1
                                  ? () {
                                      setState(() {
                                        items[index] = item.copyWith(
                                          quantity: item.quantity - 1,
                                        );
                                      });
                                    }
                                  : null,
                              onIncrease: () {
                                setState(() {
                                  items[index] = item.copyWith(
                                    quantity: item.quantity + 1,
                                  );
                                });
                              },
                              onDelete: () {
                                setState(() {
                                  items.removeAt(index);
                                });
                              },
                            );
                          },
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              verticalSpace(12.h),
              SizedBox(
                width: double.infinity,
                height: 54.h,
                child: FilledButton.icon(
                  onPressed: items.isEmpty ? null : () {},
                  icon: const Icon(Icons.check_circle_outline_rounded),
                  label: Text(
                    'إرسال الطلب (${totalAmount.toStringAsFixed(2)} ر.س)',
                    style: TextStyles.font14.copyWith(
                      color: cs.onPrimary,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  style: FilledButton.styleFrom(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(14.r),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _CartItemData {
  final String name;
  final String supplier;
  final String price;
  final String unitPrice;
  final int quantity;
  final String imagePath;

  const _CartItemData({
    required this.name,
    required this.supplier,
    required this.price,
    required this.unitPrice,
    required this.quantity,
    required this.imagePath,
  });

  _CartItemData copyWith({
    String? name,
    String? supplier,
    String? price,
    String? unitPrice,
    int? quantity,
    String? imagePath,
  }) {
    return _CartItemData(
      name: name ?? this.name,
      supplier: supplier ?? this.supplier,
      price: price ?? this.price,
      unitPrice: unitPrice ?? this.unitPrice,
      quantity: quantity ?? this.quantity,
      imagePath: imagePath ?? this.imagePath,
    );
  }
}

class _CartItemCard extends StatelessWidget {
  final _CartItemData item;
  final VoidCallback? onDecrease;
  final VoidCallback onIncrease;
  final VoidCallback onDelete;

  const _CartItemCard({
    required this.item,
    required this.onDecrease,
    required this.onIncrease,
    required this.onDelete,
  });

  @override
  Widget build(BuildContext context) {
    final cs = context.cs;

    return Container(
      padding: EdgeInsets.all(10.r),
      decoration: BoxDecoration(
        color: cs.surface,
        borderRadius: BorderRadius.circular(16.r),
        border: Border.all(color: context.appColors.borderColor),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(12.r),
            child: Image.asset(
              item.imagePath,
              width: 66.w,
              height: 66.w,
              fit: BoxFit.cover,
            ),
          ),
          horizontalSpace(12.w),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            item.name,
                            style: TextStyles.font14.copyWith(
                              color: cs.onSurface,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                          verticalSpace(2.h),
                          Text(
                            item.supplier,
                            style: TextStyles.font12normal.copyWith(
                              color: cs.onSurfaceVariant,
                            ),
                          ),
                        ],
                      ),
                    ),
                    IconButton(
                      onPressed: onDelete,
                      icon: Icon(
                        Icons.delete_outline_rounded,
                        color: cs.error,
                        size: 20.sp,
                      ),
                      visualDensity: VisualDensity.compact,
                      padding: EdgeInsets.zero,
                      constraints: const BoxConstraints(),
                    ),
                  ],
                ),
                verticalSpace(10.h),
                Row(
                  children: [
                    _QuantityButton(
                      icon: Icons.remove,
                      backgroundColor: cs.primary.withOpacity(0.10),
                      foregroundColor: cs.primary,
                      onTap: onDecrease,
                    ),
                    horizontalSpace(8.w),
                    Text(
                      '${item.quantity}',
                      style: TextStyles.font14.copyWith(
                        color: cs.onSurface,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    horizontalSpace(8.w),
                    _QuantityButton(
                      icon: Icons.add,
                      backgroundColor: cs.primary,
                      foregroundColor: cs.onPrimary,
                      onTap: onIncrease,
                    ),
                    const Spacer(),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Text(
                          item.price,
                          style: TextStyles.font14.copyWith(
                            color: cs.primary,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                        verticalSpace(2.h),
                        Text(
                          item.unitPrice,
                          style: TextStyles.font12normal.copyWith(
                            color: cs.onSurfaceVariant,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _QuantityButton extends StatelessWidget {
  final IconData icon;
  final Color backgroundColor;
  final Color foregroundColor;
  final VoidCallback? onTap;

  const _QuantityButton({
    required this.icon,
    required this.backgroundColor,
    required this.foregroundColor,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Material(
      color: backgroundColor,
      borderRadius: BorderRadius.circular(12.r),
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(12.r),
        child: SizedBox(
          width: 32.w,
          height: 32.w,
          child: Icon(icon, size: 18.sp, color: foregroundColor),
        ),
      ),
    );
  }
}

class _SummaryCard extends StatelessWidget {
  final int productCount;
  final int totalQuantity;
  final double totalAmount;

  const _SummaryCard({
    required this.productCount,
    required this.totalQuantity,
    required this.totalAmount,
  });

  @override
  Widget build(BuildContext context) {
    final cs = context.cs;

    return Container(
      padding: EdgeInsets.all(12.r),
      decoration: BoxDecoration(
        color: cs.surface,
        borderRadius: BorderRadius.circular(16.r),
        border: Border.all(color: context.appColors.borderColor),
      ),
      child: Column(
        children: [
          _SummaryRow(label: 'عدد المنتجات', value: productCount.toString()),
          verticalSpace(8.h),
          _SummaryRow(label: 'إجمالي الكمية', value: totalQuantity.toString()),
          verticalSpace(12.h),
          Divider(color: context.appColors.borderColor, height: 1),
          verticalSpace(12.h),
          Row(
            children: [
              Text(
                'الإجمالي',
                style: TextStyles.font14.copyWith(
                  color: cs.onSurface,
                  fontWeight: FontWeight.w700,
                ),
              ),
              const Spacer(),
              Text(
                '${totalAmount.toStringAsFixed(2)} ر.س',
                style: TextStyles.font18Bold.copyWith(color: cs.primary),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class _SummaryRow extends StatelessWidget {
  final String label;
  final String value;

  const _SummaryRow({required this.label, required this.value});

  @override
  Widget build(BuildContext context) {
    final cs = context.cs;

    return Row(
      children: [
        Text(
          label,
          style: TextStyles.font12normal.copyWith(color: cs.onSurfaceVariant),
        ),
        const Spacer(),
        Text(value, style: TextStyles.font12w600.copyWith(color: cs.onSurface)),
      ],
    );
  }
}
