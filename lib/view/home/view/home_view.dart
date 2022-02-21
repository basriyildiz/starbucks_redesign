import 'package:flutter/material.dart';
import 'package:starbucks_redesign/core/extension/padding_extension.dart';
import 'package:starbucks_redesign/view/home/view/user_info.dart';
import 'package:starbucks_redesign/view/widgets/app_bar.dart';

class HomeView extends StatelessWidget {
  const HomeView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(appBarTitle: "Starbucks"),
      body: Padding(
        padding: context.paddingNormalHorizontal,
        child: Column(
          children: [
            HomePageUserInfo(),
          ],
        ),
      ),
    );
  }
}
