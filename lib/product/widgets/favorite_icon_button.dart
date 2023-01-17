import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shop_it/core/model/product_model.dart';
import 'package:shop_it/product/constants/project_colors.dart';
import 'package:shop_it/product/state/provider/favorite_list_provider.dart';

class FavoriteIconButton extends ConsumerWidget {
  const FavoriteIconButton({
    Key? key,
    required this.product,
  }) : super(key: key);

  final ProductModel? product;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    bool value = ref.watch(favoriteProductProvider).contains(product);
    return IconButton(
      onPressed: () {
        if (product != null) {
          ref.read(favoriteProductProvider.notifier).addFavorite(product!);
          if (value) {
            ref.read(favoriteProductProvider.notifier).deleteFavoriteProduct(product!);
          }
        }
      },
      icon: Icon(
        value ? Icons.favorite : Icons.favorite_border,
        color: ProjectColors.buttonColor.color(),
      ),
    );
  }
}
