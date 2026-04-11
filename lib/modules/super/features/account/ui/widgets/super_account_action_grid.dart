import 'package:b2b/core/helpers/extensions.dart';
import 'package:b2b/core/helpers/spacing.dart';
import 'package:b2b/core/theme/textstyles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SuperAccountActionGrid extends StatelessWidget {
  const SuperAccountActionGrid({super.key});

  @override
  Widget build(BuildContext context) {
    final cs = context.cs;

    return Row(
      children: [
        Expanded(
          child: _ActionTile(
            icon: Icons.note_add_outlined,
            title: 'طلب جديد',
            color: cs.primary,
            onTap: () {},
          ),
        ),
        horizontalSpace(10.w),
        Expanded(
          child: _ActionTile(
            icon: Icons.bar_chart_outlined,
            title: 'التقارير',
            color: context.appColors.success,
            onTap: () {},
          ),
        ),
      ],
    );
  }
}

class _ActionTile extends StatelessWidget {
  final IconData icon;
  final String title;
  final Color color;
  final VoidCallback onTap;

  const _ActionTile({
    required this.icon,
    required this.title,
    required this.color,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final cs = context.cs;

    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(14.r),
      child: Container(
        padding: EdgeInsets.symmetric(vertical: 16.h),
        decoration: BoxDecoration(
          color: cs.surface,
          borderRadius: BorderRadius.circular(14.r),
          border: Border.all(color: context.appColors.borderColor),
        ),
        child: Column(
          children: [
            Icon(icon, color: color),
            verticalSpace(6.h),
            Text(
              title,
              style: TextStyles.font12w600.copyWith(color: cs.onSurface),
            ),
          ],
        ),
      ),
    );
  }
}
