import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shop_it/core/model/product_model.dart';

class ShoppingCardNotifier extends StateNotifier<List<ProductModel>> {
  ShoppingCardNotifier() : super([]);

  void addProduct(ProductModel product) {
    state = [...state, product];
  }

  void deleteProduct(ProductModel product) {
    state = state.where((element) => element.id != product.id).toList();
  }

  void deleteList() {
    state = [];
  }
}

final shoppingCardProvider = StateNotifierProvider<ShoppingCardNotifier, List<ProductModel>>((ref) {
  return ShoppingCardNotifier();
});
