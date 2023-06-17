class AnnouncementModel {
  String tentCityId;
  String title;
  String description;
  AnnouncementModel(
      {required this.tentCityId,
      required this.title,
      required this.description});
  factory AnnouncementModel.fromJson(Map<String, dynamic> json) {
    return AnnouncementModel(
        tentCityId: json['tentCityId'],
        title: json['title'],
        description: json['description']);
  }
  Map<String, dynamic> toJson() {
    return {
      'tentCityId': tentCityId,
      'title': title,
      'description': description
    };
  }
}
