import 'package:b2b/core/theme/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class TextStyles {
  static final TextStyle font18BlackBold = TextStyle(
    fontSize: 18.sp,
    fontWeight: FontWeight.w700,
    color: ColorsManegar.blac,
    fontFamily: 'cairo',
  );

  static final TextStyle font12Grey = TextStyle(
    fontSize: 12.sp,
    color: ColorsManegar.grey,
    fontFamily: 'cairo',
  );

  static final TextStyle font18greyw600 = TextStyle(
    fontSize: 18.sp,
    fontWeight: FontWeight.w600,
    fontFamily: 'cairo',
    color: ColorsManegar.grey600,
  );

  static final TextStyle font12GreyW600 = TextStyle(
    fontSize: 12.sp,
    fontWeight: FontWeight.w600,
    color: ColorsManegar.grey600,
    fontFamily: 'cairo',
  );
  static final TextStyle font16whiteW700 = TextStyle(
    color: ColorsManegar.white,
    fontSize: 16.sp,
    fontWeight: FontWeight.w700,
    fontFamily: 'cairo',
  );
  static final TextStyle font12whitenormal = TextStyle(
    color: ColorsManegar.white,
    fontSize: 12.sp,
    fontFamily: 'cairo',
  );
}
