import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

extension PaddingExtension on BuildContext {
  //  All
  EdgeInsets get paddingNormalAll => EdgeInsets.all((20.w).toDouble());
  EdgeInsets get paddingLowAll => EdgeInsets.all((10.w).toDouble());

  //  Horizontal
  EdgeInsets get paddingNormalHorizontal =>
      EdgeInsets.symmetric(horizontal: (20.w).toDouble());
  EdgeInsets get paddingLowHorizontal =>
      EdgeInsets.symmetric(horizontal: (20.w).toDouble());
}
