import 'package:smart_tent_city_app/model/movement_model.dart';

import 'RequestModel.dart';

class VictimModel {
  String id;
  String? phone_number;
  String tent_number;
  String tentCityId;
  String name;
  List<MovementModel> movements = [];
  String surname;
  String? birthday;
  String? blood_type;
  String? additional_data;
  VictimModel(
      {this.phone_number,
      required this.tent_number,
      required this.id,
      required this.tentCityId,
      required this.name,
      required this.surname,
      this.birthday,
      this.blood_type,
      this.additional_data});
  factory VictimModel.fromJson(Map<String, dynamic> json, String id) {
    return VictimModel(
        id: id,
        phone_number: json['phoneNumber'],
        tent_number: json['tentNumber'],
        tentCityId: json['tentCityId'],
        name: json['name'],
        surname: json['surname'],
        birthday: json['birthday'],
        blood_type: json['blood_type'],
        additional_data: json['additional_data']);
  }
  Map<String, dynamic> toJson() {
    return {
      'phoneNumber': phone_number,
      'tentNumber': tent_number,
      'tentCityId': tentCityId,
      'name': name,
      'surname': surname,
      'birthday': birthday,
      'blood_type': blood_type,
      'additional_data': additional_data
    };
  }
}
