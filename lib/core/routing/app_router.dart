import 'package:b2b/core/routing/routes.dart';
import 'package:b2b/modules/auth/ui/screens/login_Screen.dart';
import 'package:b2b/modules/super/features/home/ui/screens/super_home_screen.dart';
import 'package:b2b/modules/supplier/features/home/ui/screens/supplier_home_screen.dart';
import 'package:flutter/material.dart';

class AppRouter {
  Route generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case Routes.superHomeScreen:
        return MaterialPageRoute(
          builder: (_) => const SuperHomeScreen(),
        );
      case Routes.supplierHomeScreen:
        return MaterialPageRoute(
          builder: (_) => const SupplierHomeScreen(),
        );
      case Routes.loginScreen:
        return MaterialPageRoute(
          builder: (_) => LoginScreen(),
        );

      default:
        return MaterialPageRoute(
          builder: (_) => const Scaffold(
            body: Center(child: Text("Page not found")),
          ),
        );
    }
  }
}
