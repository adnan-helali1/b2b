import 'package:b2b/modules/supplier/features/home/ui/screens/supplier_home_screen.dart';
import 'package:b2b/modules/supplier/features/home/ui/widgets/supplier_bottom_bar/supplier_bar_cubit.dart';
import 'package:b2b/modules/supplier/features/home/ui/widgets/supplier_bottom_bar/supplier_bottom_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SupplierLayout extends StatelessWidget {
  const SupplierLayout({super.key});

  @override
  Widget build(BuildContext context) {
    final screens = [
      const SupplierHomeScreen(),
      const Placeholder(), // Orders
      const Placeholder(), // Profile
    ];

    return BlocProvider(
      create: (_) => SupplierBarCubit(),
      child:
          BlocBuilder<SupplierBarCubit, SupplierBarState>(
            builder: (context, state) {
              return Scaffold(
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
