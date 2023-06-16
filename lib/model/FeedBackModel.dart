class FeedBackModel {
  String topic;
  String description;
  FeedBackModel({required this.topic, required this.description});
  factory FeedBackModel.fromJson(Map<String, dynamic> json) {
    final topic = json['topic'];
    final description = json['description'];

    return FeedBackModel(
      topic: json['topic'],
      description: json['description'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'topic': topic,
      'description': description,
    };
  }
}
