import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:starbucks_redesign/core/constants/colors.dart';
import 'package:starbucks_redesign/core/network_controller/network_view.dart';
import 'package:starbucks_redesign/core/network_controller/network_viewmodel.dart';
import 'package:starbucks_redesign/view/control/model/navigation_bar_items.dart';
import 'package:starbucks_redesign/view/control/viewmodel/control_viewmodel.dart';

class ControlView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Get.put(NetworkViewModel());
    return Obx(() {
      return (Get.find<NetworkViewModel>().connectionStatus.value == 1 ||
              Get.find<NetworkViewModel>().connectionStatus.value == 2)
          ? GetBuilder<ControlViewmodel>(
              init: ControlViewmodel(),
              builder: (controller) => Scaffold(
                body: controller.getCurrentPage,
                bottomNavigationBar: buildBottomNavBar(controller),
              ),
            )
          : NoInternetConnection();
    });
  }

  Container buildBottomNavBar(ControlViewmodel controller) {
    return Container(
      decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(
                color: appBarShadow.withOpacity(.1),
                spreadRadius: 1,
                blurRadius: 10,
                offset: Offset(0, -5)),
          ],
          borderRadius: const BorderRadius.only(
              topRight: Radius.circular(5), topLeft: Radius.circular(5))),
      child: ClipRRect(
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(30.0),
          topRight: Radius.circular(30.0),
        ),
        child: BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          items: BottomNavigationBarListModel().toWidget(),
          showSelectedLabels: false,
          showUnselectedLabels: false,
          currentIndex: controller.getCurrentIndex,
          onTap: (index) => controller.changeCurrentPage(index),
        ),
      ),
    );
  }
}
