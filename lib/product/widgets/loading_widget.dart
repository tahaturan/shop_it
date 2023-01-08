import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:shop_it/product/constants/lottie_items.dart';

class LoadingWidget extends StatelessWidget {
  const LoadingWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(child: Lottie.asset(LottieItems.loading.lottiePath));
  }
}
