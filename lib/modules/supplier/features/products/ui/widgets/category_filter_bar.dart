import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../logic/products_cubit.dart';

class CategoryFilterBar extends StatelessWidget {
  const CategoryFilterBar({super.key});

  @override
  Widget build(BuildContext context) {
    final cs = Theme.of(context).colorScheme;

    final categories = [
      "الكل",
      "خضروات",
      "بقالة",
      "لحوم",
      "ألبان",
    ];

    return BlocBuilder<ProductsCubit, ProductsState>(
      builder: (context, state) {
        return SizedBox(
          height: 45,
          child: ListView.separated(
            scrollDirection: Axis.horizontal,
            padding: const EdgeInsets.symmetric(
              horizontal: 12,
            ),
            itemBuilder: (context, index) {
              final cat = categories[index];
              final isSelected =
                  cat == state.selectedCategory;

              return GestureDetector(
                onTap: () => context
                    .read<ProductsCubit>()
                    .filter(cat),
                child: Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 20,
                  ),
                  decoration: BoxDecoration(
                    color: isSelected
                        ? cs.primary
                        : cs.surface,
                    borderRadius: BorderRadius.circular(12),
                    border: Border.all(
                      color: cs.primary.withOpacity(0.4),
                    ),
                  ),
                  alignment: Alignment.center,
                  child: Text(
                    cat,
                    style: TextStyle(
                      color: isSelected
                          ? cs.onPrimary
                          : cs.onSurface,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              );
            },
            separatorBuilder: (_, __) =>
                const SizedBox(width: 8),
            itemCount: categories.length,
          ),
        );
      },
    );
  }
}
