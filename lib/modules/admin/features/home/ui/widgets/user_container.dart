import 'package:b2b/core/helpers/spacing.dart';
import 'package:flutter/material.dart';
import 'package:b2b/core/theme/app_colors.dart';
import 'package:b2b/core/theme/textstyles.dart';

class UserContainer extends StatelessWidget {
  final IconData numbericon;
  final Color iconnumbercolor;
  final String text;

  UserContainer({
    super.key,
    required this.iconnumbercolor,
    required this.numbericon,
    required this.text,
  });
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 100,
      height: 100,
      decoration: BoxDecoration(
        color: AppColors.lightSurface,
        borderRadius: BorderRadius.circular(10),
        border: Border.all(
          color: AppColors.neutral60.withOpacity(0.5),
          width: 2,
        ),
      ),
      child: Column(
        children: [
          Icon(numbericon, color: iconnumbercolor, size: 50),
          verticalSpace(10),
          Text(text, style: TextStyles.font12normal),
        ],
      ),
    );
  }
}
