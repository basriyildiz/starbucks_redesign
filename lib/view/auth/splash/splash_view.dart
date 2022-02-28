import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:starbucks_redesign/core/constants/colors.dart';
import 'package:starbucks_redesign/core/constants/image_paths.dart';
import 'package:starbucks_redesign/view/auth/login/view/login_view.dart';
import 'package:starbucks_redesign/view/control/view/control_view.dart';

class SplashView extends StatefulWidget {
  const SplashView({Key? key}) : super(key: key);

  @override
  State<SplashView> createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Future.delayed(Duration(seconds: 2)).then((value) => Get.to(LoginView()));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: darkGreen,
      body: Container(
        height: double.infinity,
        width: double.infinity,
        decoration: BoxDecoration(
          image: DecorationImage(
            fit: BoxFit.cover,
            image: AssetImage(
              ImagePaths().splashBackgorund,
            ),
          ),
        ),
        child: Image.asset(ImagePaths().logoWithText),
      ),
    );
  }
}
