import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shop_it/core/model/product_model.dart';

class FavoriteProductNotifier extends StateNotifier<List<ProductModel>> {
  FavoriteProductNotifier() : super([]);

  void addFavorite(ProductModel product) {
    state = [...state, product];
  }

  void deleteFavoriteProduct(ProductModel product) {
    state = state.where((element) => element.id != product.id).toList();
  }

  void deleteAllList() {
    state = [];
  }
}

final favoriteProductProvider = StateNotifierProvider<FavoriteProductNotifier, List<ProductModel>>((ref) {
  return FavoriteProductNotifier();
});
