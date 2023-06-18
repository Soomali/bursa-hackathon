import 'package:cloud_firestore/cloud_firestore.dart';

import 'ProductModel.dart';
import 'RequestStatus.dart';

class RequestModel {
  List<ProductModel> products;
  String? executive_note;
  String tent_number;
  String? victim_note;
  String tentCityId;
  RequestStatus status;
  String id;
  String victimId;
  Timestamp date;
  String? executiveId;
  RequestModel(
      {required this.products,
      this.executive_note,
      required this.date,
      required this.tent_number,
      required this.status,
      required this.tentCityId,
      this.executiveId,
      required this.victimId,
      required this.id,
      this.victim_note});

  factory RequestModel.fromJson(Map<String, dynamic> json, String id) {
    var productsList = json['products'] as List<dynamic>;
    List<ProductModel> products = productsList
        .cast<Map<String, dynamic>>()
        .map((productJson) => ProductModel.fromJson(productJson))
        .toList();

    return RequestModel(
      tentCityId: json['tentCityId'],
      products: products,
      date: json['date'],
      tent_number: json['tentNumber'],
      executiveId: json['executiveId'],
      victimId: json['victimId'],
      executive_note: json['executive_note'],
      status: MyRequestExtension.fromJson(json['status']),
      id: id,
      victim_note: json['victim_note'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'tentCityId': tentCityId,
      'date': date,
      'products': products.map((product) => product.toJson()).toList(),
      'executive_note': executive_note,
      'status': status.name,
      'victim_note': victim_note,
      'tentNumber': tent_number,
      'victimId': victimId,
      'executiveId': executiveId
    };
  }

  RequestModel clone() {
    return RequestModel.fromJson(this.toJson(), this.id);
  }
}
