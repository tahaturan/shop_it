// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:shop_it/core/model/product_model.dart';
import 'package:shop_it/product/constants/project_padding.dart';
import 'package:shop_it/product/constants/project_string_constans.dart';
import 'package:shop_it/product/state/provider/shopping_list_provider.dart';
import 'package:shop_it/product/widgets/card_shopping_widgets.dart';
import 'package:shop_it/product/widgets/wishlist_and_shopcard_widget.dart';

class ShoppinCardView extends ConsumerWidget {
  const ShoppinCardView({super.key});
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    List<ProductModel> cardList = ref.watch(shoppingCardProvider);

    var totalPrice = cardList.fold(0.0, (previousValue, element) => previousValue + (element.price ?? 0));

    return Scaffold(
      appBar: WishListAndShoppingCardAppbar(
        title: ProjectStringConstants.shoppingCard,
        onPressed: () {
          ref.read(shoppingCardProvider.notifier).deleteList();
        },
      ),
      body: SafeArea(
        child: Padding(
          padding: ProjectPadding.buttonPadding,
          child: Column(
            children: [
              Expanded(
                child: ListView.builder(
                  itemCount: cardList.length,
                  itemBuilder: (BuildContext context, int index) {
                    return CardShoppingWidgets(product: cardList[index]);
                  },
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('Total ${cardList.length} Items', style: Theme.of(context).textTheme.headline6?.copyWith(color: Colors.grey)),
                  Text(
                    'USD $totalPrice',
                    style: Theme.of(context).textTheme.bodyLarge?.copyWith(color: Colors.black, fontWeight: FontWeight.bold),
                  ),
                ],
              ),
              Padding(
                padding: ProjectPadding.categoyPadding,
                child: Row(
                  children: [
                    Expanded(
                      child: ElevatedButton(
                          onPressed: () {},
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: const [Text('Proceed to Checkout'), Icon(Icons.arrow_forward)],
                          )),
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
