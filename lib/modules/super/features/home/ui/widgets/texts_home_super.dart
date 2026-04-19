import 'package:b2b/core/theme/textstyles.dart';
import 'package:flutter/material.dart';
import 'package:b2b/core/helpers/extensions.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class TextsHomeSuper extends StatelessWidget {
  const TextsHomeSuper({super.key});

  @override
  Widget build(BuildContext context) {
    final cs = context.cs;
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 4.h),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            'المنتجات المتاحة',
            style: TextStyles.font16w700.copyWith(color: cs.onSurface),
          ),
          Text(
            'عرض الكل',
            style: TextStyles.font15w700.copyWith(color: cs.primary),
          ),
        ],
      ),
    );
  }
}
