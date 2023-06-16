class ProductModel {
  String type;
  String category;
  int amount;
  ProductModel(
      {required this.type, required this.amount, required this.category});
  factory ProductModel.fromJson(Map<String, dynamic> json) {
    return ProductModel(
        type: json['type'], amount: json['amount'], category: json['category']);
  }

  Map<String, dynamic> toJson() {
    return {
      'type': type,
      'category': category,
      'amount': amount,
    };
  }
}
