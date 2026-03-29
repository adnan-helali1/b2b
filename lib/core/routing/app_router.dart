import 'package:b2b/core/routing/routes.dart';
import 'package:b2b/modules/super/features/home/ui/screens/super_home_screen.dart';
import 'package:flutter/material.dart';

class AppRouter {
  Route generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case Routes.superhomeScreen:
        return MaterialPageRoute(builder: (_) => const SuperHomeScreen());

      default:
        return MaterialPageRoute(
          builder: (_) =>
              const Scaffold(body: Center(child: Text("Page not found"))),
        );
    }
  }
}
