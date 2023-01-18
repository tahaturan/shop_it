import 'package:flutter/material.dart';
import 'package:shop_it/core/view/product_view.dart';
import 'package:shop_it/core/viewmodel/home_view_model.dart';
import 'package:shop_it/product/constants/project_padding.dart';
import 'package:shop_it/product/constants/project_string_constans.dart';
import 'package:shop_it/product/widgets/category_tabbar.dart';
import 'package:shop_it/product/widgets/home_view_appbar.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends HomeViewModel {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: const HomeViewAppBar(),
      body: Padding(
        padding: ProjectPadding.cardPadding,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            //TODO: Firebase baglantisindan sonra isim ve mailler servisten gelecek
            Text('${ProjectStringConstants.hello}John', style: Theme.of(context).textTheme.titleLarge?.copyWith(color: Colors.black)),
            Text(ProjectStringConstants.whatAreYouLooking, style: Theme.of(context).textTheme.headline3?.copyWith(color: Colors.black)),
            Expanded(flex: 1, child: CategoryTabbar(tabController: tabController, categoyList: categoyList)),
            Expanded(flex: 12, child: _produtTabbarView()),
          ],
        ),
      ),
    );
  }

  TabBarView _produtTabbarView() {
    return TabBarView(
        controller: tabController,
        children: categoyList.map((e) {
          return ProductView(categoryName: e.name);
        }).toList());
  }
}
