import 'package:b2b/core/helpers/extensions.dart';
import 'package:b2b/core/theme/textstyles.dart';
import 'package:b2b/modules/super/features/invoice/data/super_invoice_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SuperInvoiceStatusBadge extends StatelessWidget {
  final SuperInvoiceStatus status;

  const SuperInvoiceStatusBadge({super.key, required this.status});

  @override
  Widget build(BuildContext context) {
    final config = _configFor(status, context);

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

  _BadgeConfig _configFor(SuperInvoiceStatus status, BuildContext context) {
    switch (status) {
      case SuperInvoiceStatus.paid:
        return _BadgeConfig(
          label: 'مدفوعة',
          foreground: context.appColors.success,
          background: context.appColors.success.withOpacity(0.12),
        );
      case SuperInvoiceStatus.reviewing:
        return _BadgeConfig(
          label: 'قيد المراجعة',
          foreground: context.appColors.warning,
          background: context.appColors.warning.withOpacity(0.14),
        );
      case SuperInvoiceStatus.delayed:
        return _BadgeConfig(
          label: 'متأخرة',
          foreground: context.cs.error,
          background: context.cs.error.withOpacity(0.12),
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
