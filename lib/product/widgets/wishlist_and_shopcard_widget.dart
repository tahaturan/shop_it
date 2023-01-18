// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class WishListAndShoppingCardAppbar extends ConsumerWidget with PreferredSizeWidget {
  const WishListAndShoppingCardAppbar({
    Key? key,
    required this.title,
    this.onPressed,
  }) : super(key: key);
  final String title;

  final VoidCallback? onPressed;
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return AppBar(
      title: Text(title, style: Theme.of(context).textTheme.headline4?.copyWith(color: Colors.black)),
      actions: [
        IconButton(
          onPressed: onPressed,
          icon: const Icon(Icons.delete_outline_outlined),
        ),
      ],
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
