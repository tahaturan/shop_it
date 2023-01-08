import 'package:flutter/material.dart';

import 'package:shop_it/core/viewmodel/product_view_model.dart';
import 'package:shop_it/product/widgets/loading_widget.dart';
import 'package:shop_it/product/widgets/product_widget.dart';

class ProductView extends StatefulWidget {
  final String categoryName;
  const ProductView({
    Key? key,
    required this.categoryName,
  }) : super(key: key);

  @override
  State<ProductView> createState() => _ProductViewState();
}

class _ProductViewState extends ProductViewModel {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: isLoading
          ? const LoadingWidget()
          : GridView.builder(
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                mainAxisExtent: 300,
              ),
              itemCount: products.length,
              itemBuilder: (BuildContext context, int index) {
                return ProductWidget(model: products[index]);
              },
            ),
    );
  }
}
