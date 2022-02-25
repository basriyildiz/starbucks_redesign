import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:starbucks_redesign/view/order/model/order_categories.dart';
import 'package:starbucks_redesign/view/order/model/order_coffee_sizes_enum.dart';
import 'package:starbucks_redesign/view/order/model/order_model.dart';

enum OrderViewModelStatus { LOADING, ERROR, DONE }

class OrderViewmodel extends GetxController {
  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    setLoading();
    readJsonDatabaseFromAssets().then((e) {
      menu = e;
      setDone();
    });
  }

  var status = OrderViewModelStatus.LOADING.obs;
  final BuildContext context;
  var selectedCategory = 0.obs;
  var date = TimeOfDay.now().obs;
  var location = "Kadıköy, Istanbul".obs;
  late List<OrderModel> menu;
  var coffeeNumber = 1.obs;
  var selectedCoffeeSize = CoffeSizes.TALL.obs;
  var isSelected = false.obs;

  var orders = [].obs;

  Map<CoffeSizes, String> coffeeSizeString = {
    CoffeSizes.SHORT: "Short",
    CoffeSizes.TALL: "Tall",
    CoffeSizes.GRANDE: "Grande",
    CoffeSizes.VENTI: "Venti",
  };

  OrderViewmodel(this.context);

  setLoading() {
    status.value = OrderViewModelStatus.LOADING;
    update();
  }

  setDone() {
    status.value = OrderViewModelStatus.DONE;
    update();
  }

  setError() {
    status.value = OrderViewModelStatus.ERROR;
    update();
  }

  OrderViewModelStatus get getStatus => status.value;

  updateOrderDate(var value) {
    date.value = value;
    update();
  }

  updateOrderCategory(int categoryID) {
    selectedCategory.value = categoryID;
    update();
  }

  increaseCoffeeNumber() {
    coffeeNumber.value++;
    update();
  }

  decreaseCoffeeNumber() {
    coffeeNumber.value > 1 ? coffeeNumber.value-- : null;
    update();
  }

  updateCoffeeSize(CoffeSizes coffeSize) {
    selectedCoffeeSize.value = coffeSize;
    update();
  }

  Future<List<OrderModel>> readJsonDatabaseFromAssets() async {
    var readedJson = await DefaultAssetBundle.of(context)
        .loadString("assets/menu/menu.json");

    List<OrderModel> menu = (json.decode(readedJson) as List)
        .map((e) => OrderModel.fromJson(e))
        .toList();

    return menu;
  }
}
