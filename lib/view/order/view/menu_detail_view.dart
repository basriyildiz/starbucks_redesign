import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:starbucks_redesign/core/constants/colors.dart';
import 'package:starbucks_redesign/view/order/model/order_coffee_sizes_enum.dart';
import 'package:starbucks_redesign/view/order/model/order_model.dart';
import 'package:starbucks_redesign/view/order/view/order_to_complete.dart';
import 'package:starbucks_redesign/view/order/viewmodel/order_viewmodel.dart';
import 'package:starbucks_redesign/view/widgets/app_bar.dart';
import 'package:starbucks_redesign/core/extension/padding_extension.dart';

class MenuDetailsView extends StatelessWidget {
  MenuDetailsView({Key? key, required this.index}) : super(key: key);
  final int index;

  @override
  Widget build(BuildContext context) {
    var controller = Get.find<OrderViewmodel>();
    var menuOrderModel = controller.menu[index];
    return Scaffold(
      appBar: CustomAppBar(
          appBarTitle: "Ürün Detayı", hideLeadingBackButton: false),
      body: Column(
        children: [
          SizedBox(height: 40.h),
          Image.asset(
            menuOrderModel.imagePath,
            height: 200.h,
            fit: BoxFit.contain,
          ),
          SizedBox(height: 20.h),
          Expanded(
            child: Padding(
              padding: context.paddingNormalAll,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    menuOrderModel.name,
                    style: Theme.of(context)
                        .textTheme
                        .headline3!
                        .copyWith(color: dark),
                  ),
                  SizedBox(height: 10.h),
                  Expanded(
                    child: SingleChildScrollView(
                      child: Text(
                        menuOrderModel.description,
                        style: Theme.of(context).textTheme.bodyText1!.copyWith(
                            color: dark.withOpacity(.5), height: 1.75),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          Container(
            height: 260.h,
            decoration: BoxDecoration(
              color: white,
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(.05),
                  blurRadius: 30,
                  offset: const Offset(0, -30),
                ),
              ],
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(40.w),
                topRight: Radius.circular(40.w),
              ),
            ),
            padding: context.paddingNormalAll,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(),
                Text(
                  menuOrderModel.price.toString() + " " + "TL",
                  style: Theme.of(context)
                      .textTheme
                      .headline1!
                      .copyWith(color: dark),
                ),
                Obx(() {
                  return Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      buildGreyContainer(
                          buildCoffeAddButton(controller, context), 150.w),
                      buildGreyContainer(
                        buildPopupMenu(
                          context: context,
                          controller: controller,
                        ),
                        150.w,
                      )
                    ],
                  );
                }),
                SizedBox(
                  width: double.infinity,
                  height: 55.h,
                  child: ElevatedButton(
                    onPressed: () {
                      var model = OrderModelForAddToBasket(
                          otherInfo: menuOrderModel,
                          itemNo: menuOrderModel.itemNo,
                          number: controller.coffeeNumber.value,
                          size: controller.selectedCoffeeSize.value);

                      controller.orders.add(model);

                      Get.to(OrderToComplete());
                    },
                    child: Text("Satın Al"),
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }

  Padding buildPopupMenu({
    required BuildContext context,
    required OrderViewmodel controller,
  }) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: PopupMenuButton(
        child: Row(
          children: [
            Text(
              controller
                      .coffeeSizeString[controller.selectedCoffeeSize.value] ??
                  "",
              style: Theme.of(context).textTheme.button!.copyWith(
                    color: darkGrey,
                    fontWeight: FontWeight.bold,
                  ),
            ),
            Spacer(),
            Icon(
              Icons.keyboard_arrow_down_rounded,
              color: darkGrey,
            ),
          ],
        ),
        itemBuilder: (context) {
          return List.generate(
            CoffeSizes.values.length,
            (index) => PopupMenuItem(
              onTap: () {
                controller.updateCoffeeSize(CoffeSizes.values[index]);
              },
              child: Text(
                  controller.coffeeSizeString[CoffeSizes.values[index]] ?? ""),
            ),
          );
        },
      ),
    );
  }

  Row buildCoffeAddButton(OrderViewmodel controller, BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        buildAddOrRemoveCoffeeButton(false, controller),
        Text(
          controller.coffeeNumber.toString(),
          style: Theme.of(context)
              .textTheme
              .button!
              .copyWith(color: darkGrey, fontWeight: FontWeight.bold),
        ),
        buildAddOrRemoveCoffeeButton(true, controller),
      ],
    );
  }

  IconButton buildAddOrRemoveCoffeeButton(
      bool isAdd, OrderViewmodel controller) {
    return IconButton(
      splashRadius: 1,
      onPressed: () {
        isAdd
            ? controller.increaseCoffeeNumber()
            : controller.decreaseCoffeeNumber();
      },
      icon: Center(
        child: Icon(
          isAdd ? Icons.add_rounded : Icons.remove_rounded,
          color: darkGrey,
          size: 20.h,
        ),
      ),
    );
  }

  Container buildGreyContainer(Widget child, [double? width]) {
    return Container(
      height: 40.h,
      width: width,
      decoration: BoxDecoration(
          color: buttonGrey, borderRadius: BorderRadius.circular(4.w)),
      child: child,
    );
  }
}
