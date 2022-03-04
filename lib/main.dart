import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:starbucks_redesign/core/init/theme/panache/light_theme.dart';
import 'package:starbucks_redesign/view/auth/login/view/login_view.dart';
import 'package:starbucks_redesign/view/auth/splash/splash_view.dart';

void main() {
  SystemChrome.setSystemUIOverlayStyle(
      const SystemUiOverlayStyle(statusBarColor: Colors.transparent));

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(390, 844),
      minTextAdapt: true,
      builder: () => GetMaterialApp(
        title: 'Starbucks Redesign',
        debugShowCheckedModeBanner: false,
        theme: lightTheme,
        home: SplashView(),
      ),
    );
  }
}
