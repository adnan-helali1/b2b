import 'package:b2b/core/helpers/extensions.dart';
import 'package:b2b/core/theme/textstyles.dart';
import 'package:b2b/core/widgets/super_header_on_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SuperOrderRow extends StatelessWidget {
  const SuperOrderRow({super.key});

  @override
  Widget build(BuildContext context) {
    final cs = context.cs;

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        SuperHeaderOnScreen(
          bigLabel: 'طلباتي',
          smallLabel: 'إدارة ومتابعة الطلبات',
        ),
        FilledButton.icon(
          onPressed: () {},
          style: FilledButton.styleFrom(
            padding: EdgeInsets.symmetric(horizontal: 14.w, vertical: 12.h),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12.r),
            ),
          ),
          icon: const Icon(Icons.add, size: 18),
          label: Text(
            'طلب جديد',
            style: TextStyles.font12w600.copyWith(color: cs.onPrimary),
          ),
        ),
      ],
    );
  }
}
