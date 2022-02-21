import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

extension PaddingExtension on BuildContext {
  EdgeInsets get paddingNormalHorizontal =>
      EdgeInsets.symmetric(horizontal: (20.w).toDouble());
}
