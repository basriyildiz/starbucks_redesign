import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:starbucks_redesign/core/constants/colors.dart';
import 'package:starbucks_redesign/core/extension/padding_extension.dart';
import 'package:starbucks_redesign/view/order/viewmodel/order_viewmodel.dart';
import 'package:starbucks_redesign/view/widgets/app_bar.dart';
import 'package:starbucks_redesign/view/widgets/sliver_app_bar.dart';

import 'order_details_view.dart';

class OrderView extends StatelessWidget {
  const OrderView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(appBarTitle: "Siparişi Yarat"),
      body: GetBuilder<OrderViewmodel>(
          init: OrderViewmodel(),
          builder: (controller) {
            return CustomScrollView(
              physics: BouncingScrollPhysics(),
              slivers: [
                SliverToBoxAdapter(
                  child: Column(
                    children: [
                      OrderDetailsView(),
                      SizedBox(height: 10.h),
                    ],
                  ),
                ),
                CustomSliverAppBar(context: context, sliverTitle: "Menu"),
              ],
            );
          }),
    );
  }
}
