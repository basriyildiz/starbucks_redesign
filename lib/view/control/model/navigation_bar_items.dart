import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:starbucks_redesign/core/constants/colors.dart';
import 'package:starbucks_redesign/core/constants/icon_path.dart';

class BottomNavigationBarModel {
  final String iconPath;
  final String label;
  BottomNavigationBarModel(this.iconPath, this.label);
}

class BottomNavigationBarListModel {
  late final List<BottomNavigationBarModel> items;

  BottomNavigationBarListModel() {
    var icon = UIcon();
    items = [
      BottomNavigationBarModel(icon.STAR, "Star"),
      BottomNavigationBarModel(icon.CUP, "Cup"),
      BottomNavigationBarModel(icon.CREDIT_CARD, "Credit Card"),
      BottomNavigationBarModel(icon.LOCATION, "Location"),
    ];
  }
  //  TODO UPLOAD NEW ICON WITH BETTER QUALITY
  List<BottomNavigationBarItem> toWidget() {
    return items.map((e) {
      return BottomNavigationBarItem(
          icon: Image.asset(
            e.iconPath,
            color: grey,
            height: 30.h,
            width: 30.w,
          ),
          activeIcon: Image.asset(
            e.iconPath,
            color: mainGreen,
            height: 30.h,
            width: 30.w,
          ),
          label: e.label);
    }).toList();
  }
}
