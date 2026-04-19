import 'package:b2b/core/helpers/extensions.dart';
import 'package:b2b/core/helpers/spacing.dart';
import 'package:b2b/core/theme/textstyles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SuperOrderOntap extends StatelessWidget {
  const SuperOrderOntap({super.key});

  @override
  Widget build(BuildContext context) {
    final cs = context.cs;
    return Container(
      width: double.infinity,
      padding: EdgeInsets.all(12.r),
      decoration: BoxDecoration(
        color: cs.surfaceContainerHighest,
        borderRadius: BorderRadius.circular(12.r),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'تفاصيل الطلب',
            style: TextStyles.font18Bold.copyWith(color: cs.onSurface),
          ),
          verticalSpace(8.h),
          _detailesOrder('طماطم جاهزة', '425 ر.س', 'الكمية: 50 قطعة', context),
          Divider(color: cs.onSecondaryFixed.withOpacity(0.6), height: 1),

          _detailesOrder('خيار', '300 ر.س', 'الكمية: 30 قطعة', context),
          Divider(color: cs.onSecondaryFixed.withOpacity(0.6), height: 1),

          _detailesOrder('بطاطس', '150 ر.س', 'الكمية: 20 قطعة', context),
          Divider(color: cs.onSecondaryFixed.withOpacity(0.6), height: 1),

          _detailesOrder('البندورة', '200 ر.س', 'الكمية: 40 قطعة', context),
          Divider(color: cs.onSecondaryFixed.withOpacity(0.6), height: 1),
        ],
      ),
    );
  }
}

Widget _detailesOrder(
  String title,
  String value,
  String value1,
  BuildContext context,
) {
  final cs = context.cs;
  return Row(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: [
      Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: TextStyles.font14w600.copyWith(color: cs.onSurfaceVariant),
          ),
          verticalSpace(7.h),
          Text(
            value1,
            style: TextStyles.font14w600.copyWith(color: cs.onSurface),
          ),
          verticalSpace(7.h),
        ],
      ),

      Text(value, style: TextStyles.font14w600.copyWith(color: cs.onSurface)),
    ],
  );
}
