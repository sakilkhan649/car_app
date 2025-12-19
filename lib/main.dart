import 'package:car_app/utils/app_colors/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import 'core/routs/routs.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(440, 956),
      minTextAdapt: true,
      splitScreenMode: true,
      child: GetMaterialApp(
        theme: ThemeData(
          scaffoldBackgroundColor: AppColors.black100,
          appBarTheme: AppBarTheme(
            backgroundColor: AppColors.black100,
            elevation: 0,
            scrolledUnderElevation: 0,
          )
        ),
        debugShowCheckedModeBanner: false,
        getPages: Routes.routes,
        initialRoute: Routes.splashScreen,
      ),
    );;
  }
}
