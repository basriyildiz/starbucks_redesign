import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:starbucks_redesign/view/order/model/order_categories.dart';
import 'package:starbucks_redesign/view/order/model/order_model.dart';
import 'package:starbucks_redesign/view/order/viewmodel/order_viewmodel.dart';
import 'package:starbucks_redesign/view/widgets/custom_buttons.dart';

class OrderMenuView extends StatelessWidget {
  const OrderMenuView({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var controller = Get.find<OrderViewmodel>();
    return SizedBox(
      height: 40.h,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: OrderCategories.values.length,
        itemBuilder: (context, index) {
          String title =
              orderCategoriesText[OrderCategories.values[index]] ?? "";
          return Padding(
            padding: EdgeInsets.only(right: 10.w),
            child: controller.selectedCategory.value == index
                ? GreyButton(onTap: () {}, title: title)
                : CustomOutlinedButton(
                    onTap: () {
                      controller.updateOrderCategory(index);
                    },
                    title: title),
          );
        },
      ),
    );
  }
}
