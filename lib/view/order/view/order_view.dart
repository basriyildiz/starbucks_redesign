import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:starbucks_redesign/core/constants/colors.dart';
import 'package:starbucks_redesign/core/extension/padding_extension.dart';
import 'package:starbucks_redesign/view/order/model/order_categories.dart';
import 'package:starbucks_redesign/view/order/model/order_model.dart';
import 'package:starbucks_redesign/view/order/view/order_menu_list_view.dart';
import 'package:starbucks_redesign/view/order/view/order_category_view.dart';
import 'package:starbucks_redesign/view/order/viewmodel/order_viewmodel.dart';
import 'package:starbucks_redesign/view/widgets/app_bar.dart';
import 'package:starbucks_redesign/view/widgets/custom_buttons.dart';
import 'package:starbucks_redesign/view/widgets/sliver_app_bar.dart';

import 'order_details_view.dart';

class OrderView extends StatelessWidget {
  const OrderView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: white,
      appBar: CustomAppBar(appBarTitle: "Siparişi Yarat"),
      body: GetBuilder<OrderViewmodel>(
          init: OrderViewmodel(context),
          builder: (controller) {
            if (controller.status == OrderViewModelStatus.LOADING) {
              return Center(child: CircularProgressIndicator());
            } else if (controller.status == OrderViewModelStatus.ERROR) {
              return Center(
                child: Text("Error"),
              );
            } else {
              List<OrderModel> menuItems = controller.menu;
              return CustomScrollView(
                physics: BouncingScrollPhysics(),
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
                      isPinned: false, context: context, sliverTitle: "Menu"),
                  SliverAppBar(
                      pinned: true,
                      title: OrderMenuView(),
                      automaticallyImplyLeading: false),
                  OrderMenuListView(menuItems: menuItems),
                ],
              );
            }
          }),
    );
  }
}
