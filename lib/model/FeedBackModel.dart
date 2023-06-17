enum FeedbackStatus { seen, notSeen }

class FeedBackModel {
  String topic;
  String description;
  String id;
  FeedbackStatus status;
  FeedBackModel(
      {required this.topic,
      required this.id,
      required this.status,
      required this.description});
  factory FeedBackModel.fromJson(Map<String, dynamic> json, String id) {
    final topic = json['topic'];
    final description = json['description'];

    return FeedBackModel(
      topic: json['topic'],
      id: id,
      status: json['status'] == FeedbackStatus.seen.name
          ? FeedbackStatus.seen
          : FeedbackStatus.notSeen,
      description: json['description'],
    );
  }

  Map<String, dynamic> toJson() {
    return {'topic': topic, 'description': description, 'status': status.name};
  }
}
