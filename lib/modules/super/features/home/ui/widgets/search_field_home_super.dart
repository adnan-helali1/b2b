import 'package:b2b/core/theme/colors.dart';
import 'package:b2b/core/theme/textstyles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SearchFieldHomeSuper extends StatelessWidget {
  const SearchFieldHomeSuper({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 12),
        height: 55.h,
        decoration: BoxDecoration(
          color: ColorsManegar.white,
          borderRadius: BorderRadius.circular(25),
        ),
        child: Row(
          children: [
            /// 🔔 Notification Icon
            Stack(
              children: [
                IconButton(
                  onPressed: () {},
                  icon: const Icon(Icons.notifications_none),
                ),

                Positioned(
                  right: 10,
                  top: 10,
                  child: Container(
                    width: 8,
                    height: 8,
                    decoration: const BoxDecoration(
                      color: ColorsManegar.red,
                      shape: BoxShape.circle,
                    ),
                  ),
                ),
              ],
            ),

            Expanded(
              child: TextField(
                decoration: InputDecoration(
                  hintText: "ابحث عن منتج، فئة أو مورد...",
                  border: InputBorder.none,
                  suffixIcon: const Icon(Icons.search),
                  hintStyle: TextStyles.font18greyw600,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
