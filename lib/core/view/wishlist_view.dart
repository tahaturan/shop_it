import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shop_it/core/model/product_model.dart';
import 'package:shop_it/product/constants/project_string_constans.dart';
import 'package:shop_it/product/state/provider/favorite_list_provider.dart';
import 'package:shop_it/product/widgets/product_widget.dart';
import 'package:shop_it/product/widgets/wishlist_and_shopcard_widget.dart';

class WishListView extends ConsumerWidget {
  const WishListView({super.key});
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    List<ProductModel> wishList = ref.watch(favoriteProductProvider);
    return Scaffold(
      appBar: WishListAndShoppingCardAppbar(
        title: ProjectStringConstants.wishList,
        onPressed: () {
          ref.read(favoriteProductProvider.notifier).deleteAllList();
        },
      ),
      body: ListView.builder(
        itemCount: wishList.length,
        itemBuilder: (BuildContext context, int index) {
          return Dismissible(
            background: const Icon(Icons.delete_outline_outlined),
            onDismissed: (_) {
              ref.read(favoriteProductProvider.notifier).deleteFavoriteProduct(wishList[index]);
            },
            key: ValueKey(wishList[index].id),
            child: Card(
              child: wishList.isEmpty
                  ? const Center(child: Text(ProjectStringConstants.emptyWishList))
                  : ProductWidget(model: wishList[index]),
            ),
          );
        },
      ),
    );
  }
}
