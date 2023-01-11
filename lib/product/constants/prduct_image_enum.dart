import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:shop_it/core/model/product_model.dart';
import 'package:shop_it/product/constants/lottie_items.dart';

enum ProductImageSize { small, medium, large, xlarge, xxlarge }

extension ImageSizeExtension on ProductImageSize {
  double _imageSize() {
    switch (this) {
      case ProductImageSize.medium:
        return 175.0;
      case ProductImageSize.large:
        return 220.0;
      case ProductImageSize.xlarge:
        return 250.0;
      case ProductImageSize.small:
        return 150.0;
      case ProductImageSize.xxlarge:
        return 350;
    }
  }

  Widget productImage(ProductModel? model, BuildContext context) {
    return CachedNetworkImage(
      imageUrl: model?.image ?? '',
      placeholder: (context, url) {
        return Lottie.asset(LottieItems.imageLoading.lottiePath);
      },
      errorWidget: (context, url, error) => const Icon(Icons.error),
      width: _imageSize(),
      height: _imageSize(),
    );
  }
}

enum ProjectImageEnum { profileAvatar, logo }

extension ProjectImageExtension on ProjectImageEnum {
  String _path() {
    switch (this) {
      case ProjectImageEnum.profileAvatar:
        return 'profile_avatar';
      case ProjectImageEnum.logo:
        return 'logo';
    }
  }

  Image image({double? width = 40, double? height = 40}) {
    return Image.asset('assets/images/${_path()}.png', width: width, height: height);
  }
}
