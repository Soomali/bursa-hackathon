import 'package:flutter/material.dart';
import 'package:smart_tent_city_app/model/ProductModel.dart';

class CartModel {
  ProductModel productModel;
  int amount;
  CartModel(this.amount, this.productModel);
}

class CartChangeNotifier extends ChangeNotifier {
  List<CartModel> cart = [];
  void increment(ProductModel productModel) {
    int index = cart.indexWhere(
        (element) => element.productModel.type == productModel.type);
    if (index != -1) {
      cart[index].amount += 1;
    } else {
      this.cart.add(CartModel(1, productModel));
    }
    notifyListeners();
  }

  int amountOf(ProductModel productModel) {
    int index = cart.indexWhere(
        (element) => element.productModel.type == productModel.type);
    return index == -1 ? 0 : cart[index].amount;
  }

  void decrement(ProductModel productModel) {
    int index = cart.indexWhere(
        (element) => element.productModel.type == productModel.type);
    if (index == -1) {
      return;
    }
    cart[index].amount -= 1;
    if (cart[index].amount == 0) {
      cart.removeAt(index);
    }
    notifyListeners();
  }
}
