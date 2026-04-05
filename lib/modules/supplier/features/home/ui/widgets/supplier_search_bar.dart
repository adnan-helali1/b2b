import 'package:b2b/core/theme/app_color_scheme_extention.dart';
import 'package:b2b/core/theme/textstyles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SupplierSearchBar extends StatelessWidget {
  const SupplierSearchBar({super.key});

  @override
  Widget build(BuildContext context) {
    final cs = Theme.of(context).colorScheme;
    final ext = Theme.of(
      context,
    ).extension<AppColorScheme>()!;

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 4.0),
      child: Row(
        children: [
          // 🔍 SEARCH FIELD
          Expanded(
            child: Container(
              height: 48.h,
              padding: const EdgeInsets.symmetric(
                horizontal: 14,
              ),
              decoration: BoxDecoration(
                color: cs.surface,
                borderRadius: BorderRadius.circular(12),
                border: Border.all(color: ext.borderColor),
              ),
              child: Row(
                children: [
                  Icon(
                    Icons.search,
                    color: cs.onSurfaceVariant,
                  ),
                  const SizedBox(width: 8),
                  Expanded(
                    child: TextField(
                      decoration: InputDecoration(
                        hintText: "ابحث عن منتج...",
                        border: InputBorder.none,
                        hintStyle: TextStyles.font14
                            .copyWith(
                              color: cs.onSurfaceVariant,
                            ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),

          const SizedBox(width: 12),

          // 🔵 ADD BUTTON
          Container(
            height: 48.h,
            padding: const EdgeInsets.symmetric(
              horizontal: 20,
            ),
            decoration: BoxDecoration(
              color: cs.primary,
              borderRadius: BorderRadius.circular(12),
            ),
            child: Center(
              child: Text(
                "إضافة",
                style: TextStyles.font16bold.copyWith(
                  color: cs.onPrimary,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
