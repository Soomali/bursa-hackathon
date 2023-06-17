enum FeedbackStatus { seen, notSeen }

class FeedBackModel {
  String topic;
  String description;
  String tentCityId;
  String victimId;
  String id;
  FeedbackStatus status;
  FeedBackModel(
      {required this.topic,
      required this.id,
      required this.tentCityId,
      required this.victimId,
      required this.status,
      required this.description});
  factory FeedBackModel.fromJson(Map<String, dynamic> json, String id) {
    final topic = json['topic'];
    final description = json['description'];

    return FeedBackModel(
      topic: json['topic'],
      victimId: json['victimId'],
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
      'description': description,
      'status': status.name,
      'tentCityId': tentCityId,
      'victimId': victimId
    };
  }
}
