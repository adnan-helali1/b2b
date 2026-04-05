import 'package:b2b/core/theme/app_color_scheme_extention.dart';
import 'package:b2b/core/theme/textstyles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SearchFieldHomeSuper extends StatelessWidget {
  const SearchFieldHomeSuper({super.key});

  @override
  Widget build(BuildContext context) {
    final cs = Theme.of(context).colorScheme;
    final ext = Theme.of(context).extension<AppColorScheme>()!;

    return Padding(
      padding: const EdgeInsets.all(8),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 12),
        height: 55.h,
        decoration: BoxDecoration(
          color: cs.surface,
          borderRadius: BorderRadius.circular(25),
          border: Border.all(
            color: ext.borderColor.withOpacity(0.4), // ✅ FIXED
          ),
        ),
        child: Row(
          children: [
            // Notification Icon + Red Dot
            Stack(
              children: [
                IconButton(
                  onPressed: () {},
                  icon: Icon(
                    Icons.notifications_none,
                    color: cs.onSurface, // ✅ FIXED
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

            // Search Field
            Expanded(
              child: TextField(
                decoration: InputDecoration(
                  hintText: 'ابحث عن منتج، فئة أو مورد...',
                  border: InputBorder.none,
                  suffixIcon: Icon(Icons.search, color: cs.onSurfaceVariant),
                  hintStyle: TextStyles.font18w600.copyWith(
                    color: cs.onSurfaceVariant,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
