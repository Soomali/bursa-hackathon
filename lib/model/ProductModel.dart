class ProductModel {
  String type;
  int amount;
  ProductModel({required this.type, required this.amount});
  factory ProductModel.fromJson(Map<String, dynamic> json) {
    final type = json['type'];
    final amount = json['amount'];

    return ProductModel(
      type: json['type'],
      amount: json['amount'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'type': type,
      'amount': amount,
    };
  }
}
