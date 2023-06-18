import 'package:cloud_firestore/cloud_firestore.dart';

class AnnouncementModel {
  String tentCityId;
  String title;
  String description;
  Timestamp date;
  AnnouncementModel(
      {required this.tentCityId,
      required this.title,
      required this.date,
      required this.description});
  factory AnnouncementModel.fromJson(Map<String, dynamic> json) {
    return AnnouncementModel(
        tentCityId: json['tentCityId'],
        title: json['title'],
        date: json['date'],
        description: json['description']);
  }
  Map<String, dynamic> toJson() {
    return {
      'tentCityId': tentCityId,
      'title': title,
      'date': date,
      'description': description
    };
  }
}
