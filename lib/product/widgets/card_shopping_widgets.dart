import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shop_it/core/model/product_model.dart';
import 'package:shop_it/product/constants/prduct_image_enum.dart';
import 'package:shop_it/product/constants/project_padding.dart';
import 'package:shop_it/product/state/provider/shopping_list_provider.dart';

class CardShoppingWidgets extends ConsumerWidget {
  const CardShoppingWidgets({
    Key? key,
    required this.product,
  }) : super(key: key);

  final ProductModel product;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Dismissible(
      key: ValueKey(product.id),
      onDismissed: (_) {
        ref.read(shoppingCardProvider.notifier).deleteProduct(product);
      },
      background: const Icon(Icons.delete_outline_outlined),
      child: Card(
        elevation: 5,
        child: Padding(
          padding: ProjectPadding.buttonPadding,
          child: Row(
            children: [
              ProductImageSize.medium.productImage(product, context),
              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(product.title ?? '', style: Theme.of(context).textTheme.titleMedium?.copyWith(color: Colors.black)),
                    const SizedBox(height: 20),
                    Text(
                      'USD ${product.price}',
                      style: Theme.of(context).textTheme.bodyLarge?.copyWith(color: Colors.black, fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
