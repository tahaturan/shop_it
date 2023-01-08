import 'package:flutter/material.dart';
import 'package:shop_it/core/model/categoy_model.dart';

class CategoryTabbar extends StatelessWidget {
  const CategoryTabbar({
    Key? key,
    required this.tabController,
    required this.categoyList,
  }) : super(key: key);

  final TabController tabController;
  final List<CategoryModel> categoyList;

  @override
  Widget build(BuildContext context) {
    return TabBar(
      isScrollable: true,
      labelStyle: Theme.of(context).textTheme.headline6,
      indicatorColor: Colors.amber,
      unselectedLabelStyle: Theme.of(context).textTheme.subtitle2,
      unselectedLabelColor: Colors.grey,
      labelColor: Colors.black,
      controller: tabController,
      tabs: categoyList.map((e) => Tab(text: e.name)).toList(),
    );
  }
}
