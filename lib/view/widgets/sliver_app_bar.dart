import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:starbucks_redesign/core/constants/colors.dart';

class CustomSliverAppBar extends SliverAppBar {
  CustomSliverAppBar(
      {Key? key,
      required this.context,
      required this.sliverTitle,
      this.isPinned = true})
      : super(
          key: key,
          pinned: isPinned,
          automaticallyImplyLeading: false,
          title: Row(
            children: [
              SizedBox(width: 10.w),
              Text(
                sliverTitle,
                style: Theme.of(context)
                    .textTheme
                    .headline4!
                    .copyWith(color: dark),
              ),
            ],
          ),
        );
  final bool isPinned;
  final String sliverTitle;
  final BuildContext context;
}
