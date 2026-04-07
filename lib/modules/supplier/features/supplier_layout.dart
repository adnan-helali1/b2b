import 'package:b2b/core/widgets/b2b_app_bar.dart';
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

    return BlocProvider(
      create: (_) => SupplierBarCubit(),
      child:
          BlocBuilder<SupplierBarCubit, SupplierBarState>(
            builder: (context, state) {
              return Scaffold(
                appBar: B2bAppBar(
                  icon: Icons.local_shipping_outlined,
                  title: 'شركة اللذيذ',
                  subtitle: 'مورد',
                ),
                body: AnimatedSwitcher(
                  duration: const Duration(
                    milliseconds: 250,
                  ),
                  child: screens[state.currentIndex],
                ),
                bottomNavigationBar:
                    const SupplierBottomBar(),
              );
            },
          ),
    );
  }
}
