import 'package:b2b/core/theme/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class TextStyles {
  static TextStyle font18BlackBold(BuildContext context) =>
      Theme.of(context).textTheme.titleLarge!.copyWith(
        fontSize: 18.sp,
        fontWeight: FontWeight.w700,
        color: ColorsManegar.blac,
      );

  static TextStyle font12Grey(BuildContext context) =>
      Theme.of(context).textTheme.bodySmall!.copyWith(
        fontSize: 12.sp,
        color: ColorsManegar.grey,
      );

  static TextStyle font18greyw600(BuildContext context) =>
      Theme.of(context).textTheme.bodyLarge!.copyWith(
        fontSize: 18.sp,
        fontWeight: FontWeight.w600,
        color: ColorsManegar.grey600,
      );

  static TextStyle font12GreyW600(BuildContext context) =>
      Theme.of(context).textTheme.bodySmall!.copyWith(
        fontSize: 12.sp,
        fontWeight: FontWeight.w600,
        color: ColorsManegar.grey600,
      );
}
