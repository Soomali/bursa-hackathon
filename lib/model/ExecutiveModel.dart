class ExecutiveModel {
  String tentCityId;
  String name;
  String surname;
  ExecutiveModel(
      {required this.tentCityId, required this.name, required this.surname});
  factory ExecutiveModel.fromJson(Map<String, dynamic> json) {
    return ExecutiveModel(
        tentCityId: json['tentCityId'],
        name: json['name'],
        surname: json['surname']);
  }

  Map<String, dynamic> toJson() {
    return {'tentCityId': tentCityId, 'name': name, 'surname': surname};
  }
}
