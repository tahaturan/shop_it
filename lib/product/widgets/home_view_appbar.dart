import 'package:flutter/material.dart';
import 'package:shop_it/product/constants/prduct_image_enum.dart';

class HomeViewAppBar extends StatelessWidget with PreferredSizeWidget {
  const HomeViewAppBar({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      leading: ProjectImageEnum.profileAvatar.image(),
      title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [ProjectImageEnum.logo.image(), const Text('ShopIT')]),
      actions: [
        IconButton(onPressed: () {}, icon: const Icon(Icons.search)),
        IconButton(onPressed: () {}, icon: const Icon(Icons.shopping_cart_outlined)),
      ],
      surfaceTintColor: Colors.lightBlue,
      leadingWidth: 75,
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
