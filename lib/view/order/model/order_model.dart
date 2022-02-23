import 'dart:convert';

import 'package:starbucks_redesign/view/order/model/order_categories.dart';

List<OrderModel> OrderModelFromJson(String str) =>
    List<OrderModel>.from(json.decode(str).map((x) => OrderModel.fromJson(x)));

String OrderModelToJson(List<OrderModel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class OrderModel {
  late String name;
  late double price;
  late String imagePath;
  late List categories;
  late int itemNo;

  OrderModel({
    required this.name,
    required this.price,
    required this.imagePath,
    required this.categories,
    required this.itemNo,
  });

  factory OrderModel.fromJson(Map<dynamic, dynamic> map) {
    return OrderModel(
      name: map["name"],
      price: map["price"],
      imagePath: map["imagePath"],
      categories: map["categories"],
      itemNo: map["itemNo"],
    );
  }

  toJson() {
    return {
      "name": name,
      "price": price,
      "imagePath": imagePath,
      "categories": categories,
      "itemNo": itemNo,
    };
  }
}
