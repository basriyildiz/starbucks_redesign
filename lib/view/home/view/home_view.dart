import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:starbucks_redesign/core/constants/colors.dart';
import 'package:starbucks_redesign/core/constants/image_paths.dart';
import 'package:starbucks_redesign/core/extension/padding_extension.dart';
import 'package:starbucks_redesign/view/home/view/user_info.dart';
import 'package:starbucks_redesign/view/widgets/app_bar.dart';

class HomeView extends StatelessWidget {
  const HomeView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(appBarTitle: "Starbucks"),
      body: CustomScrollView(
        slivers: [
          SliverToBoxAdapter(
            child: Padding(
              padding: context.paddingNormalAll,
              child: HomePageUserInfo(),
            ),
          ),
          SliverToBoxAdapter(
            child: Container(
              height: 35.h,
              width: double.infinity,
              decoration: BoxDecoration(
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(.05),
                    blurRadius: 30,
                    offset: Offset(0, -15),
                  ),
                ],
                color: white,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(40.w),
                  topRight: Radius.circular(40.w),
                ),
              ),
              child: Center(
                child: Container(
                  width: 80.w,
                  height: 6.h,
                  decoration: BoxDecoration(
                      color: buttonGrey,
                      borderRadius: BorderRadius.circular(32)),
                ),
              ),
            ),
          ),
          SliverAppBar(
            pinned: true,
            automaticallyImplyLeading: false,
            title: Row(
              children: [
                SizedBox(width: 10.w),
                Text(
                  "Kampanyalar",
                  style: Theme.of(context)
                      .textTheme
                      .headline4!
                      .copyWith(color: dark),
                ),
              ],
            ),
            //      backgroundColor: Colors.transparent,
          ),
          SliverList(
            delegate: SliverChildBuilderDelegate(
              (BuildContext context, int index) {
                return Container(
                  color: white,
                  //   height: 300.h,
                  child: Column(
                    children: [
                      Image.asset(ImagePaths().campaingImage),
                      Padding(
                        padding: context.paddingNormalAll,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text("Lorem Ipsum",
                                style: Theme.of(context)
                                    .textTheme
                                    .headline4!
                                    .copyWith(color: dark)),
                            Text(
                              "Anim cupidatat excepteur minim elit aute eu laboris consequat eu velit non velit elit. Aliqua aliquip incididunt est quis qui ea nostrud elit enim nisi anim. Et sint veniam quis ipsum non deserunt est consequat magna anim laboris ea. Labore laboris pariatur nostrud culpa et deserunt.",
                              style: Theme.of(context)
                                  .textTheme
                                  .bodyText1!
                                  .copyWith(
                                      color: dark.withOpacity(.7), height: 1.5),
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                );
              },
              childCount: 5,
            ),
          ),
        ],
      ),
    );
  }
}
