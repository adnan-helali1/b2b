import 'package:b2b/core/widgets/b2b_app_bar.dart';
import 'package:b2b/core/widgets/snakBar/app_bottom_nav_bar.dart';
import 'package:b2b/core/widgets/snakBar/app_buttom_nav_cubit.dart';
import 'package:b2b/modules/supplier/features/customers/ui/screens/customers_screen.dart';
import 'package:b2b/modules/supplier/features/home/ui/screens/supplier_home_screen.dart';
import 'package:b2b/modules/supplier/features/invoice/ui/screens/invoice_screen.dart';
import 'package:b2b/modules/supplier/features/orders/ui/screens/orders_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SupplierLayout extends StatelessWidget {
  const SupplierLayout({super.key});

  @override
  Widget build(BuildContext context) {
    final screens = [
      SupplierHomeScreen(),
      OrdersScreen(),
      InvoicesScreen(),
      CustomersScreen(),
    ];

    return BlocBuilder<BottomNavCubit, BottomNavState>(
      builder: (context, state) {
        return Scaffold(
          appBar: B2bAppBar(
            title: 'بوابة المورد',
            subtitle: 'شركة التوريد الوطنية',
            icon: Icons.local_shipping_outlined,
          ),
          body: AnimatedSwitcher(
            duration: const Duration(milliseconds: 300),
            child: screens[state.currentIndex],
          ),
          bottomNavigationBar: AppBottomNavBar(
            items: const [
              AppBottomNavItem(
                label: 'المنتجات',
                icon: Icons.category,
              ),
              AppBottomNavItem(
                label: 'الطلبات',
                icon: Icons.inventory_2,
              ),
              AppBottomNavItem(
                label: 'الفواتير',
                icon: Icons.receipt_long_outlined,
              ),
              AppBottomNavItem(
                label: 'العملاء',
                icon: Icons.person,
              ),
            ],
            badgeIndex: 1,
          ),
        );
      },
    );
  }
}
