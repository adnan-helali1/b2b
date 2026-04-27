import 'package:b2b/core/routing/routes.dart';
import 'package:b2b/modules/admin/features/home/ui/screen/admin_categories_screen.dart';
import 'package:b2b/modules/admin/features/home/ui/screen/admin_home_screen.dart';
import 'package:b2b/modules/auth/features/login/ui/screens/create_account.dart';
import 'package:b2b/modules/auth/features/login/ui/screens/login_Screen.dart';
import 'package:b2b/modules/super/features/main_layout.dart';
import 'package:b2b/core/widgets/snakBar/app_buttom_nav_cubit.dart';
import 'package:b2b/modules/super/features/orders/ui/screens/super_order_screen.dart';
import 'package:b2b/modules/super/features/orders/ui/screens/super_new_order_screen.dart';
import 'package:b2b/modules/auth/features/account/ui/screens/super_account_screen.dart';
import 'package:b2b/modules/super/features/pos/ui/screens/super_pos_screen.dart';
import 'package:b2b/modules/super/features/pos/ui/screens/super_pos_cart_screen.dart';
import 'package:b2b/modules/super/features/store/ui/screens/super_store_screen.dart';
import 'package:b2b/modules/supplier/features/supplier_layout.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:b2b/modules/admin/features/home/ui/screen/admin_user_screen.dart';
import 'package:b2b/modules/super/features/invoice/ui/screens/super_invoice_screen.dart';

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
            create: (_) => BottomNavCubit(),
            child: const SupplierLayout(),
          ),
        );
      case Routes.createAccountScreen:
        return MaterialPageRoute(builder: (_) => CreateAccount());
      case Routes.superStoreScreen:
        return MaterialPageRoute(builder: (_) => SuperStoreScreen());
      case Routes.loginScreen:
        return MaterialPageRoute(builder: (_) => LoginScreen());
      case Routes.adminUserScreen:
        return MaterialPageRoute(builder: (_) => AdminUserScreen());
      case Routes.adminHomeScreen:
        return MaterialPageRoute(builder: (_) => AdminHomeScreen());
      case Routes.admincategoriesscreen:
        return MaterialPageRoute(builder: (_) => AdminCategoriesScreen());
      case Routes.superOrderScreen:
        return MaterialPageRoute(builder: (_) => SuperOrderScreen());
      case Routes.superNewOrderScreen:
        return MaterialPageRoute(builder: (_) => const SuperNewOrderScreen());
      case Routes.superInvoiceScreen:
        return MaterialPageRoute(builder: (_) => const SuperInvoiceScreen());
      case Routes.superPosScreen:
        return MaterialPageRoute(builder: (_) => const SuperPosScreen());
      case Routes.superPosCartScreen:
        return MaterialPageRoute(builder: (_) => const SuperPosCartScreen());
      case Routes.superAccountScreen:
        return MaterialPageRoute(builder: (_) => const SuperAccountScreen());

      default:
        return MaterialPageRoute(
          builder: (_) =>
              const Scaffold(body: Center(child: Text("Page not found"))),
        );
    }
  }
}
