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

    return ScreenUtilInit(
      designSize: const Size(440, 956),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, child) {
        return MaterialApp(
          title: 'B2B App',
          debugShowCheckedModeBanner: false,
          initialRoute: Routes.superhomeScreen,
          onGenerateRoute: appRouter.generateRoute,

          theme: ThemeData(
            scaffoldBackgroundColor: ColorsManegar.scaffoldColor,

            // ✅ أهم سطر
            fontFamily: 'Cairo',
          ),
        );
      },
    );
  }
}
