import 'package:cloud_firestore/cloud_firestore.dart';

enum FeedbackStatus { seen, notSeen }

class FeedBackModel {
  String topic;
  String description;
  String tentCityId;
  String tent_number;
  String victimId;
  Timestamp date;
  String id;
  FeedbackStatus status;
  FeedBackModel(
      {required this.topic,
      required this.id,
      required this.date,
      required this.tent_number,
      required this.tentCityId,
      required this.victimId,
      required this.status,
      required this.description});
  factory FeedBackModel.fromJson(Map<String, dynamic> json, String id) {
    final topic = json['topic'];
    final description = json['description'];

    return FeedBackModel(
      topic: json['topic'],
      date: json['date'],
      victimId: json['victimId'],
      tent_number: json['tentNumber'],
      tentCityId: json['tentCityId'],
      id: id,
      status: json['status'] == FeedbackStatus.seen.name
          ? FeedbackStatus.seen
          : FeedbackStatus.notSeen,
      description: json['description'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'topic': topic,
      'date': date,
      'description': description,
      'tentNumber': tent_number,
      'status': status.name,
      'tentCityId': tentCityId,
      'victimId': victimId
    };
  }
}
