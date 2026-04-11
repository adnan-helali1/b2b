import 'package:b2b/core/helpers/extensions.dart';
import 'package:b2b/core/theme/textstyles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SuperOrderStatusBadge extends StatelessWidget {
  final String status;

  const SuperOrderStatusBadge({super.key, required this.status});

  @override
  Widget build(BuildContext context) {
    final config = _badgeConfig(status, context);

    return Container(
      padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 4.h),
      decoration: BoxDecoration(
        color: config.background,
        borderRadius: BorderRadius.circular(999.r),
      ),
      child: Text(
        config.label,
        style: TextStyles.font12w600.copyWith(color: config.foreground),
      ),
    );
  }

  _BadgeConfig _badgeConfig(String status, BuildContext context) {
    switch (status) {
      case 'pending':
        return _BadgeConfig(
          label: 'قيد الانتظار',
          foreground: context.appColors.warning,
          background: context.appColors.warning.withOpacity(0.14),
        );
      case 'shipping':
        return _BadgeConfig(
          label: 'تم الشحن',
          foreground: context.cs.primary,
          background: context.cs.primary.withOpacity(0.12),
        );
      case 'delivered':
        return _BadgeConfig(
          label: 'تم التسليم',
          foreground: context.appColors.success,
          background: context.appColors.success.withOpacity(0.12),
        );
      default:
        return _BadgeConfig(
          label: 'قيد المعالجة',
          foreground: context.cs.onSurface,
          background: context.cs.surfaceContainerHighest,
        );
    }
  }
}

class _BadgeConfig {
  final String label;
  final Color foreground;
  final Color background;

  const _BadgeConfig({
    required this.label,
    required this.foreground,
    required this.background,
  });
}
