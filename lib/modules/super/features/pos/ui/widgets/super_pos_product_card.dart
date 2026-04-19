import 'package:b2b/core/helpers/extensions.dart';
import 'package:b2b/core/helpers/spacing.dart';
import 'package:b2b/core/theme/textstyles.dart';
import 'package:b2b/modules/super/features/pos/data/super_pos_data.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SuperPosProductCard extends StatelessWidget {
  final SuperPosProduct product;
  final int? cartQuantity;
  final VoidCallback? onAdd;

  const SuperPosProductCard({
    super.key,
    required this.product,
    this.cartQuantity,
    this.onAdd,
  });

  @override
  Widget build(BuildContext context) {
    final cs = context.cs;

    return Container(
      clipBehavior: Clip.antiAlias,
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
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          AspectRatio(
            aspectRatio: 1.75,
            child: Stack(
              fit: StackFit.expand,
              children: [
                Image.asset(product.imagePath, fit: BoxFit.cover),
                Positioned(
                  right: 8,
                  top: 8,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      if (cartQuantity != null && cartQuantity! > 0)
                        Container(
                          margin: EdgeInsets.only(bottom: 6.h),
                          padding: EdgeInsets.symmetric(
                            horizontal: 9.w,
                            vertical: 4.h,
                          ),
                          decoration: BoxDecoration(
                            color: cs.primary,
                            borderRadius: BorderRadius.circular(999.r),
                          ),
                          child: Text(
                            'في السلة',
                            style: TextStyles.font12w600.copyWith(
                              color: Colors.white,
                            ),
                          ),
                        ),
                      Container(
                        padding: EdgeInsets.symmetric(
                          horizontal: 9.w,
                          vertical: 4.h,
                        ),
                        decoration: BoxDecoration(
                          color: Colors.black.withOpacity(0.70),
                          borderRadius: BorderRadius.circular(999.r),
                        ),
                        child: Text(
                          product.stockLabel,
                          style: TextStyles.font12w600.copyWith(
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: Padding(
              padding: EdgeInsets.fromLTRB(12.r, 8.r, 12.r, 10.r),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        product.name,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: TextStyles.font14.copyWith(
                          color: cs.onSurface,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                      verticalSpace(2.h),
                      Text(
                        product.category,
                        style: TextStyles.font12normal.copyWith(
                          color: cs.onSurfaceVariant,
                        ),
                      ),
                    ],
                  ),
                  const Spacer(),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Flexible(
                        child: Text(
                          product.price,
                          style: TextStyles.font14.copyWith(
                            color: cs.primary,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                      ),
                      horizontalSpace(8.w),
                      FilledButton(
                        onPressed: onAdd,
                        style: FilledButton.styleFrom(
                          padding: EdgeInsets.symmetric(
                            horizontal: 10.w,
                            vertical: 8.h,
                          ),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12.r),
                          ),
                        ),
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Icon(Icons.add, size: 16.sp),
                            horizontalSpace(4.w),
                            Text(
                              'إضافة',
                              style: TextStyles.font12w600.copyWith(
                                color: cs.onPrimary,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
