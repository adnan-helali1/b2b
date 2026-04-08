import 'package:b2b/modules/super/features/home/ui/screens/super_home_screen.dart';
import 'package:b2b/core/widgets/snakBar/app_buttom_nav_cubit.dart';
import 'package:b2b/core/widgets/snakBar/app_bottom_nav_bar.dart';
import 'package:b2b/modules/super/features/orders/ui/screens/super_order_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MainLayout extends StatelessWidget {
  const MainLayout({super.key});

  @override
  Widget build(BuildContext context) {
    final screens = [
      SuperHomeScreen(),
      SuperOrderScreen(), // Orders
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
          bottomNavigationBar: AppBottomNavBar(
            label1: 'الرئيسية',
            label2: 'الطلبات',
            label3: 'المخزون',
            label4: 'الحساب',
            icon1: Icon(Icons.home_rounded),
            icon2: Icon(Icons.receipt_long),
            icon3: Icon(Icons.inventory_2),
            icon4: Icon(Icons.person),
          ),
        );
      },
    );
  }
}
