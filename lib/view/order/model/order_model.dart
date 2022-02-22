import 'package:starbucks_redesign/view/order/model/order_categories.dart';

class OrderModel {
  late String name;
  late double price;
  late String imagePath;
  late OrderCategories categories;

  OrderModel({
    required this.name,
    required this.price,
    required this.imagePath,
    required this.categories,
  });

  OrderModel.fromJson(Map<dynamic, dynamic> map) {
    name = map["name"];
    price = map["price"];
    imagePath = map["price"];
    categories = map["categories"];
  }

  toJson() {
    return {
      "name": name,
      "price": price,
      "imagePath": imagePath,
      "categories": categories,
    };
  }
}
