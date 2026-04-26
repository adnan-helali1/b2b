import 'package:b2b/core/theme/app_color_scheme_extention.dart';
import 'package:b2b/core/theme/app_colors.dart';
import 'package:b2b/core/theme/textstyles.dart';
import 'package:b2b/modules/supplier/features/home/ui/widgets/supplier_search_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AppSearchFiled extends StatelessWidget {
  final bool showAddButton; // 🔥 الجديد
  final String hintText;

  const AppSearchFiled({
    super.key,
    this.showAddButton = false,
    required this.hintText, // default بدون زر
  });

  @override
  Widget build(BuildContext context) {
    final cs = Theme.of(context).colorScheme;
    final ext = Theme.of(context).extension<AppColorScheme>()!;

    return Padding(
      padding: const EdgeInsets.all(8),
      child: Row(
        children: [
          // 🔍 SEARCH CONTAINER
          Expanded(
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 12),
              height: 55.h,
              decoration: BoxDecoration(
                color: AppColors.lightBackground,
                borderRadius: BorderRadius.circular(18),
                border: Border.all(color: ext.borderColor),
              ),
              child: Row(
                children: [
                  // 🔔 Notification
                  Stack(
                    children: [
                      IconButton(
                        onPressed: () {},
                        icon: Icon(
                          Icons.notifications_none,
                          color: AppColors.darkSurface,
                        ),
                      ),
                      Positioned(
                        right: 10,
                        top: 10,
                        child: Container(
                          width: 8,
                          height: 8,
                          decoration: BoxDecoration(
                            color: cs.error,
                            shape: BoxShape.circle,
                          ),
                        ),
                      ),
                    ],
                  ),

                  // 🔍 TextField
                  Expanded(
                    child: TextField(
                      decoration: InputDecoration(
                        hintText: hintText,
                        border: InputBorder.none,
                        suffixIcon: Icon(
                          Icons.search,
                          color: AppColors.darkSurface,
                        ),
                        hintStyle: TextStyles.font18w600.copyWith(
                          color: cs.onSurfaceVariant,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),

          // 🔥 ADD BUTTON (اختياري)
          if (showAddButton) ...[
            SizedBox(width: 10.w),
            const SupplierButtomAdd(),
          ],
        ],
      ),
    );
  }
}
