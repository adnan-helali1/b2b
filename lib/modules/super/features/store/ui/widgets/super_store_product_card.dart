import 'package:b2b/core/helpers/extensions.dart';
import 'package:b2b/core/helpers/spacing.dart';
import 'package:b2b/core/theme/textstyles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SuperStoreProductCard extends StatelessWidget {
  final String imagePath;
  final String name;
  final String category;
  final String unit;
  final int currentStock;
  final int minStock;
  final int maxStock;
  final String statusLabel;
  final Color statusColor;
  final bool showLowStockWarning;

  const SuperStoreProductCard({
    super.key,
    required this.imagePath,
    required this.name,
    required this.category,
    required this.unit,
    required this.currentStock,
    required this.minStock,
    required this.maxStock,
    required this.statusLabel,
    required this.statusColor,
    required this.showLowStockWarning,
  });

  double get _progress {
    if (maxStock <= 0) return 0;
    final value = currentStock / maxStock;
    return value.clamp(0, 1);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(12.r),
      decoration: BoxDecoration(
        color: context.cs.surface,
        borderRadius: BorderRadius.circular(16.r),
        border: Border.all(color: context.appColors.borderColor),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(12.r),
                child: Image.asset(
                  imagePath,
                  width: 72.w,
                  height: 72.w,
                  fit: BoxFit.cover,
                ),
              ),
              horizontalSpace(10.w),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      name,
                      style: TextStyles.font16w700.copyWith(
                        color: context.cs.onSurface,
                      ),
                    ),
                    Text(
                      category,
                      style: TextStyles.font12normal.copyWith(
                        color: context.cs.onSurfaceVariant,
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 4.h),
                decoration: BoxDecoration(
                  color: statusColor.withOpacity(0.12),
                  borderRadius: BorderRadius.circular(14.r),
                  border: Border.all(color: statusColor.withOpacity(0.3)),
                ),
                child: Text(
                  statusLabel,
                  style: TextStyles.font12w600.copyWith(color: statusColor),
                ),
              ),
            ],
          ),
          verticalSpace(12.h),
          Row(
            children: [
              Text(
                'المخزون الحالي',
                style: TextStyles.font14.copyWith(
                  color: context.cs.onSurfaceVariant,
                ),
              ),
              const Spacer(),
              Text(
                '$currentStock $unit',
                style: TextStyles.font16w700.copyWith(
                  color: context.cs.onSurface,
                ),
              ),
            ],
          ),
          verticalSpace(8.h),
          ClipRRect(
            borderRadius: BorderRadius.circular(8.r),
            child: LinearProgressIndicator(
              value: _progress,
              minHeight: 7.h,
              backgroundColor: context.cs.surfaceContainerHighest,
              color: statusColor,
            ),
          ),
          verticalSpace(6.h),
          Row(
            children: [
              Text(
                'الحد الأدنى: $minStock',
                style: TextStyles.font12normal.copyWith(
                  color: context.cs.onSurfaceVariant,
                ),
              ),
              const Spacer(),
              Text(
                'الحد الأقصى: $maxStock',
                style: TextStyles.font12normal.copyWith(
                  color: context.cs.onSurfaceVariant,
                ),
              ),
            ],
          ),
          verticalSpace(10.h),
          Row(
            children: [
              Expanded(
                child: OutlinedButton.icon(
                  onPressed: () {},
                  icon: const Icon(Icons.edit_outlined, size: 18),
                  label: const Text('تعديل'),
                ),
              ),
              horizontalSpace(10.w),
              Expanded(
                child: FilledButton.icon(
                  onPressed: () {},
                  icon: const Icon(Icons.add),
                  label: const Text('طلب المزيد'),
                ),
              ),
            ],
          ),
          if (showLowStockWarning) ...[
            verticalSpace(10.h),
            Container(
              width: double.infinity,
              padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 8.h),
              decoration: BoxDecoration(
                color: context.cs.errorContainer.withOpacity(0.45),
                borderRadius: BorderRadius.circular(12.r),
                border: Border.all(color: context.cs.error.withOpacity(0.35)),
              ),
              child: Row(
                children: [
                  Icon(Icons.warning_amber_rounded, color: context.cs.error),
                  horizontalSpace(6.w),
                  Expanded(
                    child: Text(
                      'المخزون أقل من الحد الأدنى، يُنصح بإعادة الطلب.',
                      style: TextStyles.font12normal.copyWith(
                        color: context.cs.error,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ],
      ),
    );
  }
}
