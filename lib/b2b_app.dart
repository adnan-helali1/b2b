import 'package:b2b/core/routing/app_router.dart';
import 'package:b2b/core/routing/routes.dart';
import 'package:b2b/core/theme/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class B2bApp extends StatelessWidget {
  const B2bApp({super.key});

  @override
  Widget build(BuildContext context) {
    final appRouter = AppRouter();
    final baseTextTheme = ThemeData.light().textTheme.apply(
      fontFamily: 'Cairo',
      bodyColor: ColorsManegar.blac,
      displayColor: ColorsManegar.blac,
    );

    return ScreenUtilInit(
      designSize: const Size(440, 956),
      splitScreenMode: true,
      minTextAdapt: true,
      child: MaterialApp(
        initialRoute: Routes.superhomeScreen,
        onGenerateRoute: appRouter.generateRoute,
        title: 'B2B App',
        theme: ThemeData(
          scaffoldBackgroundColor: ColorsManegar.scaffoldColor,
          fontFamily: 'Cairo',
          textTheme: baseTextTheme.copyWith(
            bodyMedium: baseTextTheme.bodyMedium?.copyWith(fontSize: 14),
            titleLarge: baseTextTheme.titleLarge?.copyWith(
              fontWeight: FontWeight.w700,
            ),
          ),
          primaryTextTheme: baseTextTheme,
        ),
        debugShowCheckedModeBanner: false,
      ),
    );
  }
}
