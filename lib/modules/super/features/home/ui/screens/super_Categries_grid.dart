import 'package:b2b/modules/super/features/home/data/data.dart';
import 'package:b2b/modules/super/features/home/ui/widgets/super_category_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CategoriesGrid extends StatelessWidget {
  const CategoriesGrid({super.key});

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 8.h),
      itemCount: categories.length,
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        mainAxisSpacing: 12,
        crossAxisSpacing: 12,
        mainAxisExtent: 205,
      ),
      itemBuilder: (context, index) {
        final item = categories[index];

        return CategoryCard(
          title: item.title,
          count: item.count,
          imagePath: item.imagePath,
          icon: item.icon,
          bgColor: item.color,
        );
      },
    );
  }
}
