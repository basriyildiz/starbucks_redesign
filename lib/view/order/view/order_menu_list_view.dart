import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:starbucks_redesign/core/constants/colors.dart';
import 'package:starbucks_redesign/core/extension/padding_extension.dart';
import 'package:starbucks_redesign/view/order/model/order_model.dart';
import 'package:starbucks_redesign/view/order/viewmodel/order_viewmodel.dart';

class OrderMenuListView extends StatelessWidget {
  const OrderMenuListView({
    Key? key,
    required this.menuItems,
  }) : super(key: key);

  final List<OrderModel> menuItems;

  @override
  Widget build(BuildContext context) {
    var controller = Get.find<OrderViewmodel>();
    return SliverAnimatedList(
      initialItemCount: menuItems.length,
      itemBuilder: (context, index, animation) {
        return Visibility(
          visible: menuItems[index]
              .categories
              .contains(controller.selectedCategory.value),
          child: Padding(
            padding: context.paddingLowHorizontal,
            child: SizedBox(
              height: 90.h,
              child: Card(
                elevation: 0,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Container(
                      height: 70.h,
                      width: 70.h,
                      decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          image: DecorationImage(
                              fit: BoxFit.cover,
                              image: AssetImage(menuItems[index].imagePath))),
                    ),
                    Padding(
                      padding: context.paddingLowAll,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            menuItems[index].name,
                            style: Theme.of(context)
                                .textTheme
                                .headline3!
                                .copyWith(color: dark),
                          ),
                          SizedBox(height: 5.h),
                          Text(
                            menuItems[index].price.toString(),
                            style: Theme.of(context)
                                .textTheme
                                .headline5!
                                .copyWith(color: dark),
                          ),
                        ],
                      ),
                    ),
                    Spacer(),
                    Align(
                      alignment: Alignment.bottomRight,
                      child: SizedBox(
                        height: 30.h,
                        child: ElevatedButton(
                          onPressed: () {},
                          child: Text("Ekle"),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
