import 'package:b2b/core/routing/app_router.dart';
import 'package:b2b/core/routing/routes.dart';
import 'package:b2b/core/theme/dark_theme.dart';
import 'package:b2b/core/theme/light_theme.dart';
import 'package:b2b/core/theme/theme_mode_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class B2bApp extends StatelessWidget {
  const B2bApp({super.key});

  @override
  Widget build(BuildContext context) {
    final appRouter = AppRouter();

    return ScreenUtilInit(
      designSize: const Size(440, 956),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, child) {
        return BlocProvider(
          create: (_) => ThemeModeCubit(),
          child: BlocBuilder<ThemeModeCubit, ThemeMode>(
            builder: (context, mode) {
              return MaterialApp(
                title: 'B2B App',
                debugShowCheckedModeBanner: false,
                initialRoute: Routes.supplierHomeScreen,
                onGenerateRoute: appRouter.generateRoute,
                theme: lightTheme,
                darkTheme: darkTheme,
                themeMode: mode,
              );
            },
          ),
        );
      },
    );
  }
}
