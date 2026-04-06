import 'package:b2b/core/routing/routes.dart';
import 'package:b2b/modules/auth/ui/screens/create_account.dart';
import 'package:b2b/modules/auth/ui/screens/login_Screen.dart';
import 'package:b2b/modules/super/features/home/ui/screens/main_layout.dart';
import 'package:b2b/core/widgets/snakBar/snak_cubit.dart';
import 'package:b2b/modules/supplier/features/home/ui/widgets/supplier_bottom_bar/supplier_bar_cubit.dart';
import 'package:b2b/modules/supplier/features/supplier_layout.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AppRouter {
  Route generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case Routes.superHomeScreen:
        return MaterialPageRoute(
          builder: (_) => BlocProvider(
            create: (_) => BottomNavCubit(),
            child: const MainLayout(),
          ),
        );

      case Routes.supplierHomeScreen:
        return MaterialPageRoute(
          builder: (_) => BlocProvider(
            create: (_) => SupplierBarCubit(),
            child: const SupplierLayout(),
          ),
        );
      case Routes.loginScreen:
        return MaterialPageRoute(builder: (_) => LoginScreen());
         case Routes.CreateAccount:
        return MaterialPageRoute(builder: (_) => CreateAccount());

      default:
        return MaterialPageRoute(
          builder: (_) =>
              const Scaffold(body: Center(child: Text("Page not found"))),
        );
    }
  }
}
