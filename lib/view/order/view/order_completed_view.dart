import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:starbucks_redesign/core/constants/colors.dart';
import 'package:starbucks_redesign/core/constants/icon_path.dart';
import 'package:starbucks_redesign/core/constants/image_paths.dart';
import 'package:starbucks_redesign/core/extension/padding_extension.dart';
import 'package:starbucks_redesign/view/order/viewmodel/order_viewmodel.dart';
import 'package:starbucks_redesign/view/widgets/app_bar.dart';

class OrderCompletedView extends StatelessWidget {
  OrderCompletedView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var controller = Get.find<OrderViewmodel>();
    return Scaffold(
      appBar: CustomAppBar(appBarTitle: "Sipariş Tamamlandı"),
      body: Column(
        children: [
          SizedBox(
            height: 280.h,
            child: Column(
              children: [
                SizedBox(height: 40.h),
                Image.asset(ImagePaths().success),
                Padding(
                  padding: context.paddingNormalAll,
                  child: Text("Bizden sipariş verdiğiniz için teşekkürler!",
                      style: Theme.of(context)
                          .textTheme
                          .headline2!
                          .copyWith(color: dark),
                      textAlign: TextAlign.center),
                ),
              ],
            ),
          ),
          Expanded(
              child: Container(
            padding: context.paddingNormalAll,
            color: white,
            child: Column(
              children: [
                buildPromotionAlert(context, controller),
                SizedBox(height: 20.h),
                buildStarStatusContainer(context),
                Spacer(),
                SizedBox(
                  width: double.infinity,
                  height: 55.h,
                  child: ElevatedButton(
                    onPressed: () {},
                    child: Text("Kapat"),
                  ),
                ),
              ],
            ),
          )),
        ],
      ),
    );
  }

  Container buildPromotionAlert(
      BuildContext context, OrderViewmodel controller) {
    return Container(
      height: 150.h,
      width: double.infinity,
      decoration: BoxDecoration(
        border: Border.all(color: buttonGrey),
        borderRadius: BorderRadius.circular(8.w),
      ),
      child: Padding(
        padding: context.paddingNormalAll,
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Tebrikler",
                  style: Theme.of(context)
                      .textTheme
                      .headline4!
                      .copyWith(color: dark),
                ),
                Container(
                  decoration: BoxDecoration(
                    color: darkGreen,
                    borderRadius: BorderRadius.circular(4.w),
                  ),
                  child: Padding(
                    padding: EdgeInsets.all(4.w),
                    child: Row(
                      children: [
                        Text(
                          "+ " + "2",
                          style: Theme.of(context)
                              .textTheme
                              .headline4!
                              .copyWith(color: white),
                        ),
                        SizedBox(width: 4.w),
                        Image.asset(UIcon().STAR, color: darkGold)
                      ],
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: 8.h),
            Expanded(
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Image.asset(controller.orders[0].otherInfo.imagePath),
                  Padding(
                    padding: context.paddingLowAll,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("Bizden 2 puan kazandın",
                            style: Theme.of(context)
                                .textTheme
                                .headline5!
                                .copyWith(color: dark)),
                        Text("Hazelnut Coffee",
                            style: Theme.of(context)
                                .textTheme
                                .headline4!
                                .copyWith(color: dark)),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Container buildStarStatusContainer(BuildContext context) {
    return Container(
      padding: context.paddingNormalHorizontal,
      height: 100.h,
      width: double.infinity,
      decoration: BoxDecoration(
        color: buttonGrey,
        borderRadius: BorderRadius.circular(4.w),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Best sellers to best sellers increased",
            style: Theme.of(context).textTheme.bodyText1!.copyWith(color: dark),
          ),
          SizedBox(height: 15.h),
          Row(
            children: [
              SizedBox(
                width: 110.w,
                height: 6.h,
                child: const LinearProgressIndicator(
                  value: .2,
                  color: darkGreen,
                  backgroundColor: white,
                ),
              ),
              SizedBox(width: 15.w),
              Image.asset(
                UIcon().STAR,
                color: darkGreen,
              ),
              SizedBox(width: 5.w),
              Text(
                "7/10",
                style: Theme.of(context)
                    .textTheme
                    .headline3!
                    .copyWith(color: darkGreen),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
