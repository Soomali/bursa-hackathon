import 'ProductModel.dart';
import 'RequestStatus.dart';

class RequestModel {
  List<ProductModel> products;
  String? executive_note;
  String? victim_note;
  RequestStatus status;
  RequestModel(
      {required this.products,
      required this.executive_note,
      required this.status,
      required this.victim_note});

  factory RequestModel.fromJson(Map<String, dynamic> json) {
    var productsList = json['products'] as List<dynamic>;
    List<ProductModel> products = productsList
        .map((productJson) => ProductModel.fromJson(productJson))
        .toList();

    return RequestModel(
      products: products,
      executive_note: json['executive_note'],
      status: MyRequestExtension.fromJson(json['status']),
      victim_note: json['victim_note'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'products': products.map((product) => product.toJson()).toList(),
      'executive_note': executive_note,
      'status': status.name,
      'victim_note': victim_note,
    };
  }
}
