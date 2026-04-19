import 'package:b2b/core/widgets/snakBar/app_buttom_nav_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AppBottomNavItem {
  final String label;
  final IconData icon;

  const AppBottomNavItem({required this.label, required this.icon});
}

class AppBottomNavBar extends StatelessWidget {
  final List<AppBottomNavItem> items;
  final int? badgeIndex;

  AppBottomNavBar({super.key, required this.items, this.badgeIndex});

  @override
  Widget build(BuildContext context) {
    final cs = Theme.of(context).colorScheme;

    return BlocBuilder<BottomNavCubit, BottomNavState>(
      builder: (context, state) {
        return Container(
          padding: EdgeInsets.symmetric(vertical: 9.h, horizontal: 10.w),
          decoration: BoxDecoration(
            color: cs.surface,
            borderRadius: BorderRadius.circular(6.r),
            boxShadow: [BoxShadow(color: cs.shadow, blurRadius: 5)],
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: List.generate(items.length, (index) {
              final isSelected = index == state.currentIndex;
              final item = items[index];

              return GestureDetector(
                onTap: () {
                  context.read<BottomNavCubit>().changeTab(index);
                },
                child: TweenAnimationBuilder(
                  duration: const Duration(milliseconds: 300),
                  tween: Tween<double>(begin: 1, end: isSelected ? 1.2 : 1),
                  builder: (context, scale, child) {
                    return Transform.scale(
                      scale: scale,
                      child: AnimatedContainer(
                        duration: const Duration(milliseconds: 250),
                        padding: EdgeInsets.symmetric(
                          horizontal: 7.w,
                          vertical: 4.h,
                        ),
                        decoration: BoxDecoration(
                          color: isSelected ? cs.primary : cs.surface,
                          borderRadius: BorderRadius.circular(10.r),
                        ),
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Stack(
                              clipBehavior: Clip.none,
                              children: [
                                Icon(
                                  item.icon,
                                  color: isSelected ? cs.surface : cs.primary,
                                ),
                                if (badgeIndex == index &&
                                    state.ordersCount > 0)
                                  Positioned(
                                    right: -6,
                                    top: -6,
                                    child: Container(
                                      padding: const EdgeInsets.all(4),
                                      decoration: const BoxDecoration(
                                        color: Colors.red,
                                        shape: BoxShape.circle,
                                      ),
                                      child: Text(
                                        state.ordersCount.toString(),
                                        style: const TextStyle(
                                          color: Colors.white,
                                          fontSize: 10,
                                        ),
                                      ),
                                    ),
                                  ),
                              ],
                            ),
                            SizedBox(height: 4.h),
                            Text(
                              item.label,
                              style: TextStyle(
                                fontSize: 10.sp,
                                fontWeight: FontWeight.bold,
                                fontFamily: 'cairo',
                                color: isSelected ? cs.surface : cs.primary,
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
