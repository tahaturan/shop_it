import 'package:badges/badges.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shop_it/core/view/shopping_card_view.dart';

import 'package:shop_it/product/constants/project_duration.dart';
import 'package:shop_it/product/state/provider/shopping_list_provider.dart';

class ShoppingCard extends ConsumerWidget {
  const ShoppingCard({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Badge(
      animationDuration: ProjectDurationEnum.shoppingCard.duration(),
      animationType: BadgeAnimationType.scale,
      showBadge: ref.watch(shoppingCardProvider).isEmpty ? false : true,
      position: BadgePosition.topStart(top: 2, start: -5),
      badgeColor: Colors.green,
      badgeContent: Text(ref.watch(shoppingCardProvider).length.toString(),
          style: Theme.of(context).textTheme.bodySmall?.copyWith(color: Colors.white)),
      child: IconButton(
        onPressed: () {
          Navigator.of(context).push(MaterialPageRoute(
            builder: (context) => const ShoppinCardView(),
          ));
        },
        icon: const Icon(Icons.shopping_cart_outlined),
      ),
    );
  }
}
