import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:starbucks_redesign/core/constants/colors.dart';
import 'package:starbucks_redesign/core/constants/icon_path.dart';

class CustomAppBar extends AppBar {
  CustomAppBar({
    this.hideLeadingBackButton = true,
    Key? key,
    required this.appBarTitle,
  }) : super(
            key: key,
            automaticallyImplyLeading: !hideLeadingBackButton,
            title: Text(appBarTitle),
            actions: [
              InkWell(
                  borderRadius: BorderRadius.circular(50.w),
                  onTap: () {},
                  child: Image.asset(UIcon().BELL, color: darkGreen)),
              InkWell(
                  borderRadius: BorderRadius.circular(50.w),
                  onTap: () {},
                  child: Image.asset(UIcon().SETTING, color: darkGreen)),
            ]);
  final String appBarTitle;
  final bool hideLeadingBackButton;
}
