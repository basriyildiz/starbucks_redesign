import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class NoInternetConnection extends StatelessWidget {
  final String noInternetError = 'Please check your internet connection..';

  const NoInternetConnection({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const CircularProgressIndicator(),
            SizedBox(
              height: 30.h,
            ),
            Text(noInternetError),
          ],
        ),
      ),
    );
  }
}
