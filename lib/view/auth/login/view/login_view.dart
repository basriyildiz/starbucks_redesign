import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:starbucks_redesign/core/constants/colors.dart';
import 'package:starbucks_redesign/core/constants/image_paths.dart';
import 'package:starbucks_redesign/core/extension/padding_extension.dart';
import 'package:starbucks_redesign/view/auth/login/view/login_form.dart';

class LoginView extends StatelessWidget {
  const LoginView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    TextTheme textTheme = Theme.of(context).textTheme;
    return Scaffold(
      resizeToAvoidBottomInset: false,
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
        child: Padding(
          padding: context.paddingNormalHorizontal,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 128.h),
              Image.asset(ImagePaths().starbucksText),
              SizedBox(height: 50.h),
              Text("Welcome back!",
                  style: textTheme.headline1!.copyWith(color: dark)),
              SizedBox(height: 25.h),
              Container(
                width: 316.w,
                child: Text(
                  "Lorem ipsum dolor sit amet, consectetur adipiscing elit sed do eiusmod tempor",
                  style: textTheme.bodyText1!.copyWith(color: darkGrey),
                ),
              ),
              SizedBox(height: 45.h),
              LoginForm()
            ],
          ),
        ),
      ),
    );
  }
}
