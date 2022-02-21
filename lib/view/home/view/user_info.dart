import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:starbucks_redesign/core/constants/colors.dart';
import 'package:starbucks_redesign/core/constants/icon_path.dart';
import 'package:starbucks_redesign/core/constants/image_paths.dart';
import 'package:starbucks_redesign/core/extension/padding_extension.dart';
import 'package:starbucks_redesign/view/widgets/custom_buttons.dart';

class HomePageUserInfo extends StatelessWidget {
  const HomePageUserInfo({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        buildUserMoneyContainer(context),
        SizedBox(height: 40.h),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              child: Stack(
                children: [
                  SizedBox(
                    height: 120.w,
                    width: 120.w,
                    child: RotationTransition(
                      turns: AlwaysStoppedAnimation(225 / 360),
                      child: CircularProgressIndicator(
                        
                        color: grey,
                        value: .75,
                        strokeWidth: 8,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 120.w,
                    width: 120.w,
                    child: RotationTransition(
                      turns: AlwaysStoppedAnimation(225 / 360),
                      child: CircularProgressIndicator(
                        color: darkGreen,
                        value: .50,
                        strokeWidth: 13,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 145.h,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  SizedBox(height: 10.h),
                  Row(
                    children: [
                      buildUserMoneyAndCoffeSmallContainer(context,
                          icon: UIcon().STAR,
                          text: "Yıldız bakiyesi",
                          value: "3"),
                      SizedBox(width: 20.w),
                      buildUserMoneyAndCoffeSmallContainer(context,
                          icon: UIcon().CUP, text: "İkram İçecek", value: "5"),
                    ],
                  ),
                  GreyButton(
                    onTap: () {},
                    title: "Ayrıntılar",
                  ),
                ],
              ),
            ),
          ],
        ),
      ],
    );
  }

  Column buildUserMoneyAndCoffeSmallContainer(BuildContext context,
      {required value, required icon, required text}) {
    return Column(
      children: [
        Row(
          children: [
            Image.asset(
              icon,
              color: icon == UIcon().STAR ? darkGold : darkGreen,
              width: 30.w,
              height: 30.h,
            ),
            SizedBox(width: 5.w),
            Text(
              value,
              style: Theme.of(context).textTheme.headline2,
            )
          ],
        ),
        Text(
          text,
          style: Theme.of(context).textTheme.headline6,
        )
      ],
    );
  }

  Container buildUserMoneyContainer(BuildContext context) {
    return Container(
      height: 140.h,
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage(ImagePaths().logo),
          alignment: Alignment.centerLeft,
        ),
        boxShadow: [
          BoxShadow(
              color: appBarShadow.withOpacity(.25),
              offset: Offset(0, 4),
              blurRadius: 5,
              spreadRadius: 0),
        ],
        color: mainGreen,
        borderRadius: BorderRadius.circular(20.w),
      ),
      child: Padding(
        padding: context.paddingNormalAll,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.end,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Toplam Param",
                  style: Theme.of(context)
                      .textTheme
                      .headline5!
                      .copyWith(color: white),
                ),
                Text("55.32 TL",
                    style: Theme.of(context)
                        .textTheme
                        .headline1!
                        .copyWith(color: white)),
              ],
            ),
            Padding(
              padding: context.paddingLowAll,
              child: Text(
                "Bakiye Ekle  ->",
                style: Theme.of(context)
                    .textTheme
                    .headline6!
                    .copyWith(color: white),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
