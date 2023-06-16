import 'RequestModel.dart';

class VictimModel {
  String id;
  String? phone_number;
  String tent_number;
  String tent_city_number;
  List<RequestModel> requests;
  String name;
  String surname;
  String? birthday;
  String? blood_type;
  String? additional_data;
  VictimModel(
      {required this.phone_number,
      required this.tent_number,
      required this.id,
      required this.tent_city_number,
      required this.requests,
      required this.name,
      required this.surname,
      required this.birthday,
      required this.blood_type,
      required this.additional_data});
  factory VictimModel.fromJson(Map<String, dynamic> json, String id) {
    var requestsJson = json['requests'] as List<dynamic>;
    List<RequestModel> requests = requestsJson
        .map((requestsJson) => RequestModel.fromJson(requestsJson))
        .toList();

    return VictimModel(
        id: id,
        phone_number: json['phoneNumber'],
        tent_number: json['tentNumber'],
        tent_city_number: json['tent_city'],
        requests: requests,
        name: json['name'],
        surname: json['surname'],
        birthday: json['birthday'],
        blood_type: json['blood_type'],
        additional_data: json['additional_data']);
  }
  Map<String, dynamic> toJson() {
    return {
      'phone_number': phone_number,
      'tent_number': tent_number,
      'tent_city_number': tent_city_number,
      'requests': requests.map((request) => request.toJson()).toList(),
      'name': name,
      'surname': surname,
      'birthday': birthday,
      'blood_type': blood_type,
      'additional_data': additional_data
    };
  }
}
