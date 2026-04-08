import 'package:b2b/core/widgets/b2b_app_bar.dart';
import 'package:b2b/core/widgets/snakBar/app_bottom_nav_bar.dart';
import 'package:b2b/core/widgets/snakBar/app_buttom_nav_cubit.dart';
import 'package:b2b/modules/supplier/features/home/ui/screens/supplier_home_screen.dart';
import 'package:b2b/modules/supplier/features/home/ui/widgets/supplier_bottom_bar/supplier_bar_cubit.dart';
import 'package:b2b/modules/supplier/features/home/ui/widgets/supplier_bottom_bar/supplier_bottom_bar.dart';
import 'package:b2b/modules/supplier/features/invoice/ui/screens/invoice_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SupplierLayout extends StatelessWidget {
  const SupplierLayout({super.key});

  @override
  Widget build(BuildContext context) {
    final screens = [
      SupplierHomeScreen(),
      const Placeholder(),
      InvoicesScreen(),
      const Placeholder(),
    ];

    return BlocBuilder<BottomNavCubit, BottomNavState>(
      builder: (context, state) {
        return Scaffold(
          body: AnimatedSwitcher(
            duration: const Duration(milliseconds: 300),
            child: screens[state.currentIndex],
          ),
          bottomNavigationBar: AppBottomNavBar(
            label1: 'المنتجات',
            label2: 'الطلبات',
            label3: 'الفواتير',
            label4: 'العملاء',
            icon1: Icon(Icons.category),
            icon2: Icon(Icons.inventory_2),
            icon3: Icon(Icons.receipt_long_outlined),
            icon4: Icon(Icons.person),
          ),
        );
      },
    );
  }
}
