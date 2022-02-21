import 'package:flutter/material.dart';
import 'package:starbucks_redesign/view/widgets/app_bar.dart';

class HomeView extends StatelessWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(appBarTitle: "Starbucks"),
      body: Center(
        child: Text("Done"),
      ),
    );
  }
}
