import 'package:b2b/core/helpers/spacing.dart';
import 'package:b2b/core/theme/textstyles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

/// 🏪 Supplier Card

Widget supplierCard({
  required BuildContext context,
  required String name,
  required String products,
  required String rating,
}) {
  final cs = Theme.of(context).colorScheme;

  return Container(
    margin: const EdgeInsets.only(bottom: 10),
    padding: const EdgeInsets.all(14),
    decoration: BoxDecoration(
      color: cs.surface, // بدل Colors.white
      borderRadius: BorderRadius.circular(16),
      border: Border.all(color: cs.outline.withOpacity(0.2)),
    ),
    child: Row(
      children: [
        /// Icon
        Container(
          padding: const EdgeInsets.all(10),
          decoration: BoxDecoration(
            color: cs.primary.withOpacity(0.1),
            shape: BoxShape.circle,
          ),
          child: Icon(Icons.view_in_ar_sharp, color: cs.primary),
        ),
        horizontalSpace(12.w),

        /// Name + Products
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                name,
                style: TextStyles.font16w700.copyWith(color: cs.onSurface),
              ),
              verticalSpace(4.h),
              Text(
                products,
                style: TextStyles.font14.copyWith(color: cs.onSurfaceVariant),
              ),
            ],
          ),
        ),

        /// Rating
        Row(
          children: [
            Text(
              rating,
              style: TextStyles.font14.copyWith(color: cs.onSurface),
            ),
            horizontalSpace(4.w),
            Icon(Icons.star, color: cs.tertiary, size: 18),
          ],
        ),
      ],
    ),
  );
}
