import 'package:b2b/core/helpers/extensions.dart';
import 'package:b2b/core/helpers/spacing.dart';
import 'package:b2b/core/theme/textstyles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SuperHeaderOnScreen extends StatelessWidget {
  const SuperHeaderOnScreen({
    super.key,
    required this.bigLabel,
    required this.smallLabel,
  });
  final String bigLabel;
  final String smallLabel;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          bigLabel,
          style: TextStyles.font22bold.copyWith(color: context.cs.onSurface),
        ),
        verticalSpace(4.h),
        Text(
          smallLabel,
          style: TextStyles.font14.copyWith(color: context.cs.onSurfaceVariant),
        ),
      ],
    );
  }
}
