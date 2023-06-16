import 'package:smart_tent_city_app/model/ProductModel.dart';

class InventoryModel {
  String id;
  List<ProductModel> products;
  String tentCityId;
  InventoryModel(
      {required this.id, required this.products, required this.tentCityId});
  factory InventoryModel.fromJson(Map<String, dynamic> json, String id) {
    final productsList = json['products'] as List<dynamic>;
    final products = productsList
        .cast<Map<String, dynamic>>()
        .map(ProductModel.fromJson)
        .toList();
    return InventoryModel(
        id: id, products: products, tentCityId: json['tentCityId']);
  }
  Map<String, dynamic> toJson() {
    return {
      'products': products.map((e) => e.toJson()).toList(),
      'tentCityId': tentCityId
    };
  }
}
