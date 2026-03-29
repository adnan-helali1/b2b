import 'package:b2b/core/routing/app_router.dart';
import 'package:b2b/core/routing/routes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class B2bApp extends StatelessWidget {
  const B2bApp({super.key});

  @override
  Widget build(BuildContext context) {
    final appRouter = AppRouter();

    return ScreenUtilInit(
      designSize: Size(440, 956),
      splitScreenMode: true,
      minTextAdapt: true,

      child: MaterialApp(
        initialRoute: Routes.superhomeScreen,
        onGenerateRoute: appRouter.generateRoute,
        title: 'B2B App',
        theme: ThemeData(scaffoldBackgroundColor: Colors.white),
        debugShowCheckedModeBanner: false,
      ),
    );
  }
}
