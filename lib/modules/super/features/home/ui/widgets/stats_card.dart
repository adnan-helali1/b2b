import 'package:b2b/core/helpers/spacing.dart';
import 'package:b2b/core/theme/colors.dart';
import 'package:b2b/core/theme/textstyles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class StatCard extends StatelessWidget {
  final IconData icon;
  final Color iconColor;
  final Color bgColor;
  final String number;
  final String label;

  const StatCard({
    super.key,
    required this.icon,
    required this.iconColor,
    required this.bgColor,
    required this.number,
    required this.label,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 18),
      decoration: BoxDecoration(
        color: ColorsManegar.white,
        borderRadius: BorderRadius.circular(22),
        border: Border.all(color: ColorsManegar.grey200),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          /// Icon
          Container(
            padding: const EdgeInsets.all(10),
            decoration: BoxDecoration(color: bgColor, shape: BoxShape.circle),
            child: Icon(icon, color: iconColor),
          ),

          const SizedBox(height: 10),

          /// Number
          Text(number, style: TextStyles.font18BlackBold),

          verticalSpace(5.h),

          /// Label
          Text(
            label,
            textAlign: TextAlign.center,
            style: TextStyles.font12GreyW600,
          ),
        ],
      ),
    );
  }
}
