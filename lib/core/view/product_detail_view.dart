// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shop_it/core/model/product_model.dart';
import 'package:shop_it/product/constants/prduct_image_enum.dart';
import 'package:shop_it/product/constants/project_colors.dart';
import 'package:shop_it/product/constants/project_padding.dart';
import 'package:shop_it/product/packages/shopping_card.dart';
import 'package:shop_it/product/state/provider/shopping_list_provider.dart';
import 'package:shop_it/product/widgets/favorite_icon_button.dart';

class ProductDetailView extends ConsumerWidget {
  const ProductDetailView({
    super.key,
    required this.product,
  });
  final ProductModel? product;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // ignore: no_leading_underscores_for_local_identifiers
    void _addCard() {
      if (product != null) {
        ref.read(shoppingCardProvider.notifier).addProduct(product!);
      }
    }

    // ignore: no_leading_underscores_for_local_identifiers, prefer_const_declarations
    final String _addToCard = '';

    return Scaffold(
      appBar: AppBar(
        actions: const [
          ShoppingCard(),
        ],
      ),
      body: SingleChildScrollView(
        child: SafeArea(
          child: Padding(
            padding: ProjectPadding.categoyPadding,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Center(child: ProductImageSize.xxlarge.productImage(product, context)),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'USD ${product?.price ?? 0}',
                      style: TextStyle(
                        color: ProjectColors.buttonColor.color(),
                        fontWeight: FontWeight.bold,
                        fontSize: 21,
                      ),
                    ),
                    FavoriteIconButton(product: product),
                  ],
                ),
                Text(product?.title ?? '', style: Theme.of(context).textTheme.headline4?.copyWith(color: Colors.black)),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    const Icon(Icons.star, color: Colors.amber),
                    Text(
                      product?.rating?.rate.toString() ?? '',
                      style: Theme.of(context).textTheme.bodyLarge?.copyWith(color: Colors.grey, fontWeight: FontWeight.bold),
                    ),
                    SizedBox(width: MediaQuery.of(context).size.width * 0.1),
                    Text(
                      '${product?.rating?.count.toString()} Reviews',
                      style: Theme.of(context).textTheme.bodyLarge?.copyWith(color: Colors.grey, fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
                Text(product?.description ?? '', style: Theme.of(context).textTheme.titleMedium, textAlign: TextAlign.justify),
                SizedBox(height: MediaQuery.of(context).size.height * 0.07),
                Row(
                  children: [
                    Expanded(
                      child: ElevatedButton(
                        onPressed: _addCard,
                        child: Text(
                          _addToCard,
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
