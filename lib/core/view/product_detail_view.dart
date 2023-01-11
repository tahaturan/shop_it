// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

import 'package:shop_it/core/model/product_model.dart';
import 'package:shop_it/product/constants/prduct_image_enum.dart';
import 'package:shop_it/product/constants/project_colors.dart';
import 'package:shop_it/product/constants/project_padding.dart';

class ProductDetailView extends StatefulWidget {
  const ProductDetailView({
    Key? key,
    required this.product,
  }) : super(key: key);
  final ProductModel? product;

  @override
  State<ProductDetailView> createState() => _ProductDetailViewState();
}

class _ProductDetailViewState extends State<ProductDetailView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SafeArea(
        child: Padding(
          padding: ProjectPadding.categoyPadding,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Center(child: ProductImageSize.xxlarge.productImage(widget.product, context)),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'USD ${widget.product?.price ?? 0}',
                    style: TextStyle(
                      color: ProjectColors.buttonColor.color(),
                      fontWeight: FontWeight.bold,
                      fontSize: 21,
                    ),
                  ),
                  IconButton(onPressed: () {}, icon: Icon(Icons.favorite_border, color: ProjectColors.buttonColor.color())),
                ],
              ),
              Text(widget.product?.title ?? '', style: Theme.of(context).textTheme.headline4?.copyWith(color: Colors.black)),
              Row(
                crossAxisAlignment: CrossAxisAlignment.end,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  const Icon(Icons.star, color: Colors.amber),
                  Text(
                    widget.product?.rating?.rate.toString() ?? '',
                    style: Theme.of(context).textTheme.bodyLarge?.copyWith(color: Colors.grey, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(width: MediaQuery.of(context).size.width * 0.1),
                  Text(
                    '${widget.product?.rating?.count.toString()} Reviews',
                    style: Theme.of(context).textTheme.bodyLarge?.copyWith(color: Colors.grey, fontWeight: FontWeight.bold),
                  ),
                ],
              ),
              Text(widget.product?.description ?? '', style: Theme.of(context).textTheme.titleMedium, textAlign: TextAlign.justify),
              Row(
                children: [
                  Expanded(
                    child: ElevatedButton(
                      onPressed: () {},
                      child: const Text(
                        "Add To Card",
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
