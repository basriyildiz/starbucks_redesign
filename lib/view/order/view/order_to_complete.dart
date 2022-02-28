import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:starbucks_redesign/core/constants/colors.dart';
import 'package:starbucks_redesign/core/constants/image_paths.dart';
import 'package:starbucks_redesign/core/extension/padding_extension.dart';
import 'package:starbucks_redesign/view/order/model/order_categories.dart';
import 'package:starbucks_redesign/view/order/model/order_model.dart';
import 'package:starbucks_redesign/view/order/view/order_menu_list_view.dart';
import 'package:starbucks_redesign/view/order/view/order_category_view.dart';
import 'package:starbucks_redesign/view/order/view/order_select_coffee.dart';
import 'package:starbucks_redesign/view/order/viewmodel/order_viewmodel.dart';
import 'package:starbucks_redesign/view/widgets/app_bar.dart';
import 'package:starbucks_redesign/view/widgets/custom_buttons.dart';
import 'package:starbucks_redesign/view/widgets/sliver_app_bar.dart';

import 'order_details_view.dart';

class OrderToComplete extends StatelessWidget {
  const OrderToComplete({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    var controller = Get.find<OrderViewmodel>();
    return Scaffold(
      backgroundColor: white,
      appBar: CustomAppBar(
        appBarTitle: "Sipariş Detayı",
        hideLeadingBackButton: false,
      ),
      body: Column(
        children: [
          Expanded(
            child: CustomScrollView(
              physics: const BouncingScrollPhysics(),
              slivers: [
                SliverToBoxAdapter(
                  child: Column(
                    children: [
                      OrderDetailsView(),
                      SizedBox(height: 10.h),
                      Container(height: 10.h, color: backgroundColor)
                    ],
                  ),
                ),
                CustomSliverAppBar(
                    isPinned: true,
                    context: context,
                    sliverTitle: "Sipariş Listesi"),
                SliverAnimatedList(
                  initialItemCount: controller.orders.length,
                  itemBuilder: (context, index, animation) {
                    return Column(
                      children: [
                        index != 0 || index != controller.orders.length - 1
                            ? const Divider()
                            : const SizedBox(),
                        Padding(
                          padding: context.paddingLowHorizontal,
                          child: SizedBox(
                            height: 80.h,
                            child: Card(
                              elevation: 0,
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  buildMenuItemsCircularImage(
                                      controller.orders[index]),
                                  Padding(
                                    padding: context.paddingLowAll,
                                    child: buildMenuItemInfo(
                                        controller.orders[index], context),
                                  ),
                                  Spacer(),
                                  Column(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceAround,
                                    children: [
                                      CircleAvatar(
                                        child: Text(controller
                                            .orders[index].number
                                            .toString()),
                                        radius: 16.w,
                                      ),
                                      Container(
                                        child: Text(
                                          controller.coffeeSizeString[controller
                                                  .orders[index].size] ??
                                              "",
                                          style: Theme.of(context)
                                              .textTheme
                                              .headline3,
                                        ),
                                      ),
                                    ],
                                  )
                                ],
                              ),
                            ),
                          ),
                        ),
                      ],
                    );
                  },
                )
              ],
            ),
          ),
          Padding(
            padding: context.paddingNormalHorizontal,
            child: const Divider(color: buttonGrey, thickness: 0.7),
          ),
          SizedBox(
              height: 55.h,
              child: Padding(
                padding: context.paddingNormalHorizontal,
                child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Tutar",
                        style: Theme.of(context)
                            .textTheme
                            .headline4!
                            .copyWith(color: dark),
                      ),
                      Text(
                        "17.95",
                        style: Theme.of(context)
                            .textTheme
                            .headline4!
                            .copyWith(color: dark),
                      )
                    ]),
              )),
          Container(height: 10.h, color: backgroundColor),
          SizedBox(
            height: 196.h,
            child: Padding(
              padding: context.paddingNormalAll,
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Ödeme Şekli",
                        style: Theme.of(context)
                            .textTheme
                            .headline4!
                            .copyWith(color: dark),
                      ),
                      TextButton(
                        onPressed: () {},
                        child: Text(
                          "Yükleme Yap" + "  ->",
                          style: Theme.of(context)
                              .textTheme
                              .button!
                              .copyWith(color: darkGreen),
                        ),
                      ),
                    ],
                  ),
                  Expanded(
                    child: Row(
                      children: [
                        buildUserMoneyContainer(context),
                        SizedBox(width: 20.w),
                        Expanded(
                          child: Container(
                            decoration: BoxDecoration(
                              boxShadow: [
                                BoxShadow(
                                    color: appBarShadow.withOpacity(.25),
                                    offset: Offset(0, 4),
                                    blurRadius: 5,
                                    spreadRadius: 0),
                              ],
                              color: buttonGrey,
                              borderRadius: BorderRadius.circular(20.w),
                            ),
                            child: Column(
                              children: [Text("DA")],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
          SizedBox(
            height: 45.h,
            width: double.infinity,
            child: ElevatedButton(onPressed: () {}, child: Text("Ödemeyi Yap")),
          ),
        ],
      ),
    );
  }

  Container buildMenuItemsCircularImage(OrderModelForAddToBasket model) {
    return Container(
      height: 70.h,
      width: 70.h,
      decoration: BoxDecoration(
          shape: BoxShape.circle,
          image: DecorationImage(
              fit: BoxFit.cover, image: AssetImage(model.otherInfo.imagePath))),
    );
  }

  Column buildMenuItemInfo(
      OrderModelForAddToBasket model, BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          model.otherInfo.name,
          style: Theme.of(context).textTheme.headline3!.copyWith(color: dark),
        ),
        SizedBox(height: 5.h),
        Text(
          model.otherInfo.price.toString(),
          style: Theme.of(context).textTheme.headline5!.copyWith(color: dark),
        ),
      ],
    );
  }

  Container buildUserMoneyContainer(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage(ImagePaths().logo),
          alignment: Alignment.centerLeft,
        ),
        boxShadow: [
          BoxShadow(
              color: appBarShadow.withOpacity(.25),
              offset: Offset(0, 4),
              blurRadius: 5,
              spreadRadius: 0),
        ],
        color: mainGreen,
        borderRadius: BorderRadius.circular(20.w),
      ),
      child: Padding(
        padding: context.paddingNormalAll,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.end,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Toplam Param",
                  style: Theme.of(context)
                      .textTheme
                      .headline5!
                      .copyWith(color: white),
                ),
                Text("55.32 TL",
                    style: Theme.of(context)
                        .textTheme
                        .headline1!
                        .copyWith(color: white)),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
