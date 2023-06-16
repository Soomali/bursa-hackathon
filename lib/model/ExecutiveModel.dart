class ExecutiveModel {
  String tent_city_number;
  String name;
  String surname;
  ExecutiveModel(
      {required this.tent_city_number,
      required this.name,
      required this.surname});
  factory ExecutiveModel.fromJson(Map<String, dynamic> json) {
    final tent_city_number = json['tent_city_number'];
    final name = json['name'];
    final surname = json['surname'];

    return ExecutiveModel(
        tent_city_number: json['tent_city_number'],
        name: json['name'],
        surname: json['surname']);
  }

  Map<String, dynamic> toJson() {
    return {
      'tent_city_number': tent_city_number,
      'name': name,
      'surname': surname
    };
  }
}
