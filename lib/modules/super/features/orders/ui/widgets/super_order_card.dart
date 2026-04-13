import 'package:b2b/core/helpers/extensions.dart';
import 'package:b2b/core/helpers/spacing.dart';
import 'package:b2b/core/theme/textstyles.dart';
import 'package:b2b/modules/super/features/orders/data/super_order_model.dart';
import 'package:b2b/modules/super/features/orders/ui/widgets/super_order_ontap.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'super_order_status_badge.dart';

class SuperOrderCard extends StatelessWidget {
  final OrderModel order;
  final bool isExpanded;
  final VoidCallback onTap;

  const SuperOrderCard({
    super.key,
    required this.order,
    required this.isExpanded,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final cs = context.cs;

    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(16.r),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 250),
        curve: Curves.easeInOut,
        margin: EdgeInsets.only(bottom: 12.h),
        padding: EdgeInsets.all(14.r),
        decoration: BoxDecoration(
          color: cs.surface,
          borderRadius: BorderRadius.circular(16.r),
          border: Border.all(color: context.appColors.borderColor),
          boxShadow: [
            BoxShadow(
              color: cs.shadow.withOpacity(0.04),
              blurRadius: 8,
              offset: const Offset(0, 2),
            ),
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Container(
                  width: 42.w,
                  height: 42.w,
                  decoration: BoxDecoration(
                    color: cs.primary.withOpacity(0.10),
                    borderRadius: BorderRadius.circular(12.r),
                  ),
                  child: Icon(Icons.description_outlined, color: cs.primary),
                ),
                horizontalSpace(10.w),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        order.id,
                        style: TextStyles.font16w700.copyWith(
                          color: cs.onSurface,
                        ),
                      ),

                      verticalSpace(4.h),
                      Text(
                        order.supplier,
                        style: TextStyles.font12w600.copyWith(
                          color: cs.onSurfaceVariant,
                        ),
                      ),
                      verticalSpace(2.h),
                      Text(
                        order.date,
                        style: TextStyles.font12normal.copyWith(
                          color: cs.onSurfaceVariant,
                        ),
                      ),
                    ],
                  ),
                ),
                Column(
                  children: [
                    IconButton(
                      icon: isExpanded
                          ? Icon(Icons.expand_more, color: cs.primary)
                          : Icon(
                              Icons.keyboard_arrow_right_outlined,
                              color: cs.primary,
                            ),
                      onPressed: onTap,
                      padding: EdgeInsets.zero,
                    ),

                    SuperOrderStatusBadge(status: order.status),
                  ],
                ),
              ],
            ),
            verticalSpace(12.h),
            Divider(color: cs.outlineVariant.withOpacity(0.6), height: 1),
            verticalSpace(10.h),
            Row(
              children: [
                Expanded(
                  child: Row(
                    children: [
                      Icon(
                        Icons.inventory_2_outlined,
                        size: 18.sp,
                        color: cs.onSurfaceVariant,
                      ),
                      horizontalSpace(6.w),
                      Text(
                        order.products,
                        style: TextStyles.font12w600.copyWith(
                          color: cs.onSurface,
                        ),
                      ),
                    ],
                  ),
                ),
                Text(
                  '${order.price} ر.س',
                  style: TextStyles.font16w700.copyWith(color: cs.primary),
                ),
              ],
            ),
            if (isExpanded) ...[verticalSpace(10.h), SuperOrderOntap()],
          ],
        ),
      ),
    );
  }
}
