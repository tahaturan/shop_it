import 'package:flutter/material.dart';
import 'package:shop_it/core/model/product_model.dart';
import 'package:shop_it/core/view/product_detail_view.dart';
import 'package:shop_it/product/constants/prduct_image_enum.dart';
import 'package:shop_it/product/constants/project_padding.dart';

class ProductWidget extends StatelessWidget {
  final ProductModel? model;
  const ProductWidget({
    Key? key,
    required this.model,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.of(context).push(MaterialPageRoute(
          builder: (context) => ProductDetailView(product: model),
        ));
      },
      child: Card(
        color: Colors.white,
        elevation: 5,
        surfaceTintColor: Colors.white,
        child: Padding(
          padding: ProjectPadding.cardPadding,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Center(child: ProductImageSize.medium.productImage(model ?? ProductModel(), context)),
              Text(model?.title ?? '', overflow: TextOverflow.ellipsis, textAlign: TextAlign.left),
              Text('\$${model?.price}', style: Theme.of(context).textTheme.button),
              Row(
                crossAxisAlignment: CrossAxisAlignment.end,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      const Icon(Icons.star, color: Colors.amber),
                      Text(model?.rating?.rate.toString() ?? '', style: Theme.of(context).textTheme.bodyLarge),
                    ],
                  ),
                  Row(
                    children: [Text(model?.rating?.count.toString() ?? ''), const Text(' Reviews')],
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
