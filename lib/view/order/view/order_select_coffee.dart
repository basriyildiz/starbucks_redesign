import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:starbucks_redesign/core/constants/colors.dart';
import 'package:starbucks_redesign/core/extension/padding_extension.dart';
import 'package:starbucks_redesign/view/order/model/order_coffee_sizes_enum.dart';
import 'package:starbucks_redesign/view/order/model/order_model.dart';
import 'package:starbucks_redesign/view/order/view/order_to_complete.dart';
import 'package:starbucks_redesign/view/order/viewmodel/order_viewmodel.dart';

class OrderSelectCoffeeBottomSheet extends StatelessWidget {
  OrderSelectCoffeeBottomSheet(
      {Key? key,
      required this.index,
      required this.menuItems,
      required this.setState})
      : super(key: key);
  final int index;
  final List<OrderModel> menuItems;
  final setState;
  @override
  Widget build(BuildContext context) {
    var controller = Get.find<OrderViewmodel>();
    return Container(
      height: 180.h,
      child: Padding(
        padding: context.paddingNormalAll,
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                buildMenuItemsCircularImage(index),
                Padding(
                  padding: context.paddingLowAll,
                  child: buildMenuItemInfo(index, context),
                ),
              ],
            ),
            SizedBox(height: 12.h),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                buildGreyContainer(
                    Center(
                      child: buildCoffeAddButton(controller, setState, context),
                    ),
                    150.w),
                buildGreyContainer(
                  buildPopupMenu(
                    context: context,
                    controller: controller,
                    setState: setState,
                  ),
                  130.w,
                ),
                Container(
                  height: 40.h,
                  width: 40.h,
                  decoration: BoxDecoration(
                    color: mainGreen,
                    borderRadius: BorderRadius.circular(4.w),
                  ),
                  child: IconButton(
                      iconSize: 20.h,
                      color: white,
                      onPressed: () {
                        var model = OrderModelForAddToBasket(
                            otherInfo: menuItems[index],
                            itemNo: menuItems[index].itemNo,
                            number: controller.coffeeNumber.value,
                            size: controller.selectedCoffeeSize.value);

                        controller.orders.add(model);

                        Get.to(OrderToComplete());
                      },
                      icon: Icon(Icons.done_rounded)),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Padding buildPopupMenu(
      {required BuildContext context,
      required OrderViewmodel controller,
      required StateSetter setState}) {
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
                setState(() {
                  controller.updateCoffeeSize(CoffeSizes.values[index]);
                });
              },
              child: Text(
                  controller.coffeeSizeString[CoffeSizes.values[index]] ?? ""),
            ),
          );
        },
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

  Row buildCoffeAddButton(
      OrderViewmodel controller, StateSetter setState, BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        buildAddOrRemoveCoffeeButton(false, controller, setState),
        Text(
          controller.coffeeNumber.toString(),
          style: Theme.of(context)
              .textTheme
              .button!
              .copyWith(color: darkGrey, fontWeight: FontWeight.bold),
        ),
        buildAddOrRemoveCoffeeButton(true, controller, setState),
      ],
    );
  }

  IconButton buildAddOrRemoveCoffeeButton(
      bool isAdd, OrderViewmodel controller, setState) {
    return IconButton(
      splashRadius: 1,
      onPressed: () {
        setState(() {
          isAdd
              ? controller.increaseCoffeeNumber()
              : controller.decreaseCoffeeNumber();
        });
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

  Container buildMenuItemsCircularImage(int index) {
    return Container(
      height: 70.h,
      width: 70.h,
      decoration: BoxDecoration(
          shape: BoxShape.circle,
          image: DecorationImage(
              fit: BoxFit.cover,
              image: AssetImage(menuItems[index].imagePath))),
    );
  }

  Column buildMenuItemInfo(int index, BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          menuItems[index].name,
          style: Theme.of(context).textTheme.headline3!.copyWith(color: dark),
        ),
        SizedBox(height: 5.h),
        Text(
          menuItems[index].price.toString(),
          style: Theme.of(context).textTheme.headline5!.copyWith(color: dark),
        ),
      ],
    );
  }
}
