import 'package:b2b/modules/supplier/features/home/ui/widgets/supplier_bottom_bar/supplier_bar_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SupplierBottomBar extends StatelessWidget {
  const SupplierBottomBar({super.key});

  @override
  Widget build(BuildContext context) {
    final cs = Theme.of(context).colorScheme;

    final items = [
      Icons.category, // المنتجات
      Icons.inventory_2, // الطلبات
      Icons.person, // الملف الشخصي
    ];

    final labels = ['المنتجات', 'الطلبات', 'الملف الشخصي'];

    return BlocBuilder<SupplierBarCubit, SupplierBarState>(
      builder: (context, state) {
        return Container(
          margin: const EdgeInsets.all(12),
          padding: const EdgeInsets.symmetric(vertical: 10),
          decoration: BoxDecoration(
            color: cs.surface,
            borderRadius: BorderRadius.circular(24),
            boxShadow: [
              BoxShadow(color: cs.shadow, blurRadius: 5),
            ],
          ),
          child: Row(
            mainAxisAlignment:
                MainAxisAlignment.spaceAround,
            children: List.generate(items.length, (index) {
              final isSelected =
                  index == state.currentIndex;

              return GestureDetector(
                onTap: () {
                  context
                      .read<SupplierBarCubit>()
                      .changeTab(index);
                },
                child: TweenAnimationBuilder(
                  duration: const Duration(
                    milliseconds: 300,
                  ),
                  tween: Tween<double>(
                    begin: 1,
                    end: isSelected ? 1.2 : 1,
                  ),
                  builder: (context, scale, child) {
                    return Transform.scale(
                      scale: scale,
                      child: AnimatedContainer(
                        duration: const Duration(
                          milliseconds: 250,
                        ),
                        padding: const EdgeInsets.symmetric(
                          horizontal: 14,
                          vertical: 8,
                        ),
                        decoration: BoxDecoration(
                          color: isSelected
                              ? cs.primary
                              : cs.surface,
                          borderRadius:
                              BorderRadius.circular(16),
                        ),
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Stack(
                              clipBehavior: Clip.none,
                              children: [
                                Icon(
                                  items[index],
                                  color: isSelected
                                      ? cs.surface
                                      : cs.primary,
                                ),

                                /// 🔴 Badge
                                if (index == 1 &&
                                    state.ordersCount > 0)
                                  Positioned(
                                    right: -6,
                                    top: -6,
                                    child: Container(
                                      padding:
                                          const EdgeInsets.all(
                                            4,
                                          ),
                                      decoration:
                                          const BoxDecoration(
                                            color:
                                                Colors.red,
                                            shape: BoxShape
                                                .circle,
                                          ),
                                      child: Text(
                                        state.ordersCount
                                            .toString(),
                                        style:
                                            const TextStyle(
                                              color: Colors
                                                  .white,
                                              fontSize: 10,
                                            ),
                                      ),
                                    ),
                                  ),
                              ],
                            ),
                            const SizedBox(height: 4),
                            Text(
                              labels[index],
                              style: TextStyle(
                                fontSize: 12,
                                color: isSelected
                                    ? cs.surface
                                    : cs.primary,
                              ),
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                ),
              );
            }),
          ),
        );
      },
    );
  }
}
