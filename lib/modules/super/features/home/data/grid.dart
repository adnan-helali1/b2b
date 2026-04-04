import 'package:b2b/modules/super/features/home/data/data.dart';
import 'package:b2b/modules/super/features/home/ui/widgets/super_info_caed.dart';
import 'package:flutter/material.dart';

class CategoriesGrid extends StatelessWidget {
  const CategoriesGrid({super.key});

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      shrinkWrap: true,
      padding: const EdgeInsets.all(12),
      itemCount: categories.length,
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        mainAxisSpacing: 12,
        crossAxisSpacing: 12,
        childAspectRatio: 1.4,
      ),
      itemBuilder: (context, index) {
        final item = categories[index];

        return CategoryCard(
          image: item.image,
          title: item.title,
          count: item.count,
          icon: item.icon,
          bgColor: item.color,
        );
      },
    );
  }
}
