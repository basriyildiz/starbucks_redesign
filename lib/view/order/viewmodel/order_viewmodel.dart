import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:starbucks_redesign/view/order/model/order_categories.dart';

class OrderViewmodel extends GetxController {
  var selectedCategory = 0.obs;
  var date = TimeOfDay.now().obs;
  var location = "Kadıköy, Istanbul".obs;

  updateOrderDate(var value) {
    date.value = value;
    update();
  }
}
