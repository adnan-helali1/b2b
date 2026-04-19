import 'package:b2b/core/helpers/extensions.dart';
import 'package:b2b/core/theme/textstyles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SuperStoreFilterChip extends StatelessWidget {
  final String label;
  final bool isSelected;
  final VoidCallback onTap;

  const SuperStoreFilterChip({
    super.key,
    required this.label,
    required this.isSelected,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: InkWell(
        borderRadius: BorderRadius.circular(12.r),
        onTap: onTap,
        child: Container(
          alignment: Alignment.center,
          padding: EdgeInsets.symmetric(vertical: 9.h),
          decoration: BoxDecoration(
            color: isSelected ? context.cs.primary : context.cs.surface,
            borderRadius: BorderRadius.circular(12.r),
            border: Border.all(color: context.appColors.borderColor),
          ),
          child: Text(
            label,
            style: TextStyles.font12w600.copyWith(
              color: isSelected ? context.cs.onPrimary : context.cs.onSurface,
            ),
          ),
        ),
      ),
    );
  }
}
