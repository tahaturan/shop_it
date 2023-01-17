import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shop_it/core/model/product_model.dart';

class ShoppingCardNotifier extends StateNotifier<List<ProductModel>> {
  ShoppingCardNotifier() : super([]);

  void addProduct(ProductModel product) {
    state = [...state, product];
  }

  void deleteProduct(ProductModel product) {
    state = [
      for (final item in state)
        if (item.id != product.id) item
    ];
  }
}

final shoppingCardProvider = StateNotifierProvider<ShoppingCardNotifier, List<ProductModel>>((ref) {
  return ShoppingCardNotifier();
});
