import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:starbucks_redesign/core/constants/colors.dart';
import 'package:starbucks_redesign/core/constants/icon_path.dart';
import 'package:starbucks_redesign/core/extension/padding_extension.dart';
import 'package:starbucks_redesign/view/order/viewmodel/order_viewmodel.dart';

class OrderDetailsView extends StatelessWidget {
  const OrderDetailsView({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var controller = Get.find<OrderViewmodel>();
    return Obx(() {
      return Container(
        height: 240.h,
        color: white,
        child: Padding(
          padding: context.paddingNormalHorizontal,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Gel Al Seçimi  " +
                    controller.selectedCategory.value.toString(),
                style: Theme.of(context)
                    .textTheme
                    .headline4!
                    .copyWith(color: dark),
              ),
              Column(
                children: [
                  buildOrderTimeAndLoacationPicker(
                      context, UIcon().CLOCK_EIGHT, controller),
                  SizedBox(height: 10.h),
                  buildOrderTimeAndLoacationPicker(
                      context, UIcon().REAL_ESTATE, controller),
                ],
              ),
            ],
          ),
        ),
      );
    });
  }

  Material buildOrderTimeAndLoacationPicker(
      BuildContext context, String iconPath, OrderViewmodel controller) {
    return Material(
      color: Colors.transparent,
      child: InkWell(
        onTap: () {
          selectDateAndTime(context, controller);
        },
        splashColor: mainGreen,
        child: Container(
          // height: 75.h,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10.w),
            border: Border.all(
              color: lightGrey,
            ),
          ),
          child: Padding(
            padding: context.paddingNormalAll,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Visibility(
                  visible: iconPath == UIcon().CLOCK_EIGHT,
                  child: Column(
                    children: [
                      Text(
                        "Paketinizi alma zamanı",
                        style: Theme.of(context)
                            .textTheme
                            .bodyText1!
                            .copyWith(color: grey),
                      ),
                      SizedBox(height: 5.h)
                    ],
                  ),
                ),
                Row(
                  children: [
                    Image.asset(
                      iconPath,
                      width: 25.w,
                      height: 25.w,
                      color: lightGrey,
                    ),
                    SizedBox(width: 20.w),
                    Text(
                      UIcon().CLOCK_EIGHT == iconPath
                          ? (controller.date.value.hour.toString() +
                              ":" +
                              (controller.date.value.minute < 10
                                  ? ("0" +
                                      controller.date.value.minute.toString())
                                  : controller.date.value.minute.toString()))
                          : controller.location.value,
                      style: Theme.of(context)
                          .textTheme
                          .headline5!
                          .copyWith(color: dark),
                    ),
                    Spacer(),
                    Text(
                      "Değiştir",
                      style: Theme.of(context)
                          .textTheme
                          .button!
                          .copyWith(color: dark),
                    ),
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  selectDateAndTime(BuildContext context, OrderViewmodel controller) {
    showTimePicker(context: context, initialTime: controller.date.value).then(
        (value) => value != null ? controller.updateOrderDate(value) : null);
  }
}
