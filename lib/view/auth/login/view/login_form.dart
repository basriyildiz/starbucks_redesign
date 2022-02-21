import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:starbucks_redesign/core/constants/colors.dart';
import 'package:starbucks_redesign/view/control/view/control_view.dart';

class LoginForm extends StatelessWidget {
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        Form(
          key: _formKey,
          child: Column(
            children: [
              SizedBox(
                height: 45.h,
                child: TextFormField(
                  decoration: InputDecoration(
                    label: Text(
                      "Email",
                      style: Theme.of(context)
                          .textTheme
                          .bodyText1!
                          .copyWith(color: lightGrey),
                    ),
                  ),
                ),
              ),
              SizedBox(height: 20),
              SizedBox(
                height: 45.h,
                child: TextFormField(
                  decoration: InputDecoration(
                      label: Text(
                    "Password",
                    style: Theme.of(context)
                        .textTheme
                        .bodyText1!
                        .copyWith(color: lightGrey),
                  )),
                ),
              ),
            ],
          ),
        ),
        SizedBox(height: 60.h),
        TextButton(
            onPressed: () {},
            child: Text(
              "Forgot password?",
              style: Theme.of(context)
                  .textTheme
                  .headline6!
                  .copyWith(color: darkGrey, fontWeight: FontWeight.w600),
            )),
        SizedBox(height: 16.h),
        Container(
          width: double.infinity,
          height: 50.h,
          child: ElevatedButton(
            onPressed: () {
              Get.to(ControlView());
            },
            child: Text("Login"),
          ),
        ),
      ],
    );
  }
}
