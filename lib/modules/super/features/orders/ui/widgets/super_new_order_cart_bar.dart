import 'package:b2b/core/helpers/extensions.dart';
import 'package:b2b/core/helpers/spacing.dart';
import 'package:b2b/core/theme/textstyles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SuperNewOrderCartBar extends StatelessWidget {
  final int itemsCount;
  final double totalAmount;
  final VoidCallback onTap;

  const SuperNewOrderCartBar({
    super.key,
    required this.itemsCount,
    required this.totalAmount,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final cs = context.cs;

    return SafeArea(
      top: false,
      child: Padding(
        padding: EdgeInsets.fromLTRB(16.w, 0, 16.w, 12.h),
        child: InkWell(
          onTap: onTap,
          borderRadius: BorderRadius.circular(18.r),
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: 14.w, vertical: 14.h),
            decoration: BoxDecoration(
              color: cs.primary,
              borderRadius: BorderRadius.circular(18.r),
            ),
            child: Row(
              children: [
                Container(
                  width: 38.w,
                  height: 38.w,
                  decoration: BoxDecoration(
                    color: cs.onPrimary.withOpacity(0.12),
                    borderRadius: BorderRadius.circular(12.r),
                  ),
                  child: Icon(
                    Icons.shopping_cart_outlined,
                    color: cs.onPrimary,
                  ),
                ),
                horizontalSpace(10.w),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      'عرض السلة',
                      style: TextStyles.font12w600.copyWith(
                        color: cs.onPrimary,
                      ),
                    ),
                    Text(
                      '$itemsCount منتج',
                      style: TextStyles.font12normal.copyWith(
                        color: cs.onPrimary.withOpacity(0.85),
                      ),
                    ),
                  ],
                ),
                const Spacer(),
                Text(
                  '${totalAmount.toStringAsFixed(2)} ر.س',
                  style: TextStyles.font18w700.copyWith(color: cs.onPrimary),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
