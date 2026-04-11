import 'package:b2b/modules/super/features/home/ui/screens/super_home_screen.dart';
import 'package:b2b/core/widgets/snakBar/app_buttom_nav_cubit.dart';
import 'package:b2b/core/widgets/snakBar/app_bottom_nav_bar.dart';
import 'package:b2b/modules/super/features/invoice/ui/screens/super_invoice_screen.dart';
import 'package:b2b/modules/super/features/orders/ui/screens/super_order_screen.dart';
import 'package:b2b/modules/super/features/pos/ui/screens/super_pos_screen.dart';
import 'package:b2b/modules/super/features/store/ui/screens/super_store_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MainLayout extends StatelessWidget {
  const MainLayout({super.key});

  @override
  Widget build(BuildContext context) {
    final screens = [
      SuperHomeScreen(),
      SuperOrderScreen(), // Orders
      const SuperStoreScreen(), // Inventory
      SuperInvoiceScreen(), // Invoices
      const SuperPosScreen(), // POS
    ];

    return BlocBuilder<BottomNavCubit, BottomNavState>(
      builder: (context, state) {
        return Scaffold(
          body: AnimatedSwitcher(
            duration: const Duration(milliseconds: 300),
            child: screens[state.currentIndex],
          ),
          bottomNavigationBar: AppBottomNavBar(
            items: const [
              AppBottomNavItem(label: 'الرئيسية', icon: Icons.home_rounded),
              AppBottomNavItem(label: 'الطلبات', icon: Icons.receipt_long),
              AppBottomNavItem(label: 'المخزون', icon: Icons.inventory_2),
              AppBottomNavItem(
                label: 'الفواتير',
                icon: Icons.receipt_long_outlined,
              ),
              AppBottomNavItem(label: 'نقطة البيع', icon: Icons.attach_money),
            ],
            badgeIndex: 1,
          ),
        );
      },
    );
  }
}
