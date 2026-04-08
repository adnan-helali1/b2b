import 'package:b2b/core/theme/textstyles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SupplierButtomAdd extends StatelessWidget {
  const SupplierButtomAdd({super.key});

  @override
  Widget build(BuildContext context) {
    final cs = Theme.of(context).colorScheme;

    return
    // 🔵 ADD BUTTON
    Container(
      height: 48.h,
      padding: const EdgeInsets.symmetric(horizontal: 20),
      decoration: BoxDecoration(
        color: cs.primary,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Center(
        child: Text(
          "إضافة",
          style: TextStyles.font16bold.copyWith(color: cs.onPrimary),
        ),
      ),
    );
  }
}
