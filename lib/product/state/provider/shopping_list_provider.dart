import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shop_it/core/model/product_model.dart';

// final shoppingCardListProvider = StateProvider<List<ProductModel>>(
//   (ref) {
//     return [];
//   },
// );

class ShoppingCardNotifier extends ChangeNotifier {
  final List<ProductModel> shoppCard = [];

  void addProduct(ProductModel product) {
    shoppCard.add(product);
    notifyListeners();
  }
}

final shoppingCardProvider = ChangeNotifierProvider<ShoppingCardNotifier>(
  (ref) {
    return ShoppingCardNotifier();
  },
);
