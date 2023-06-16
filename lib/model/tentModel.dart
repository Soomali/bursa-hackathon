import 'package:flutter/cupertino.dart';
import 'VictimModel.dart';

import 'RequestModel.dart';

class TentModel {
  List<VictimModel> victim_model;
  String tent_city_id;
  List<RequestModel> requests;
  TentModel(
      {required this.victim_model,
      required this.tent_city_id,
      required this.requests});

  factory TentModel.fromJson(Map<String, dynamic> json) {
    var victim_models_list = json['victim_model'] as List<dynamic>;
    List<VictimModel> victim_model = victim_models_list
        .map((victimJson) => VictimModel.fromJson(victimJson, victimJson['id']))
        .toList();

    var requests_list = json['requests'] as List<dynamic>;
    List<RequestModel> requests = requests_list
        .map((requestJson) => RequestModel.fromJson(requestJson))
        .toList();

    return TentModel(
      victim_model: victim_model,
      tent_city_id: json['tent_city_id'],
      requests: requests,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'victim_model': victim_model.map((victim) => victim.toJson()).toList(),
      'tent_city_id': tent_city_id,
      'requests': requests.map((request) => request.toJson()).toList()
    };
  }
}
