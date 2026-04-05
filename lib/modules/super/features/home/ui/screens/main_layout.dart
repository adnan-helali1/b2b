import 'package:b2b/modules/super/features/home/ui/screens/super_home_screen.dart';
import 'package:b2b/modules/super/shared/snakBar/snak_cubit.dart';
import 'package:b2b/modules/super/shared/snakBar/super_snak_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MainLayout extends StatelessWidget {
  const MainLayout({super.key});

  @override
  Widget build(BuildContext context) {
    final screens = [
      SuperHomeScreen(),
      Placeholder(), // Orders
      Placeholder(), // Inventory
      Placeholder(), // Profile
    ];

    return BlocBuilder<BottomNavCubit, BottomNavState>(
      builder: (context, state) {
        return Scaffold(
          body: AnimatedSwitcher(
            duration: const Duration(milliseconds: 300),
            child: screens[state.currentIndex],
          ),
          bottomNavigationBar: const CustomBottomNavBar(),
        );
      },
    );
  }
}
