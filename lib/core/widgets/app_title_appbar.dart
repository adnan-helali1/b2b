import 'package:b2b/core/helpers/spacing.dart';
import 'package:b2b/core/theme/colors.dart';
import 'package:b2b/core/theme/textstyles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AppTitleAppbar extends StatelessWidget {
  const AppTitleAppbar({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          width: 40.w,
          height: 40.h,
          decoration: const BoxDecoration(
            color: ColorsManegar.backgroundIcon,
            shape: BoxShape.circle,
          ),
          child: const Icon(
            Icons.shopping_cart_outlined,
            color: ColorsManegar.white,
            size: 20,
          ),
        ),
        horizontalSpace(10),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('متجر الأسرة', style: TextStyles.font18BlackBold),
            Text('سوبر ماركت', style: TextStyles.font12Grey),
          ],
        ),
      ],
    );
  }
}
