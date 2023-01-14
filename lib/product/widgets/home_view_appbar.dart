import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shop_it/product/constants/prduct_image_enum.dart';
import 'package:shop_it/product/packages/shopping_card.dart';

class HomeViewAppBar extends ConsumerWidget with PreferredSizeWidget {
  const HomeViewAppBar({
    Key? key,
  }) : super(key: key);
  final String _title = 'ShopIT';

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return AppBar(
      leading: ProjectImageEnum.profileAvatar.image(),
      title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [ProjectImageEnum.logo.image(), Text(_title)]),
      actions: [
        IconButton(onPressed: () {}, icon: const Icon(Icons.search)),
        const ShoppingCard(),
      ],
      surfaceTintColor: Colors.lightBlue,
      leadingWidth: 75,
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
