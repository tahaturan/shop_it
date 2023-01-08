import 'package:flutter/material.dart';
import 'package:shop_it/core/model/categoy_model.dart';
import 'package:shop_it/core/view/home_view.dart';
import 'package:shop_it/product/service/project_dio.dart';

abstract class HomeViewModel extends LoadingState<HomeView> with ProjectDioMixin, TickerProviderStateMixin {
  List<CategoryModel> categoyList = CategoryModel.dummuyCategoy();
  late final TabController tabController;
  @override
  void initState() {
    super.initState();
    tabController = TabController(length: categoyList.length, vsync: this);
  }
}

abstract class LoadingState<T extends StatefulWidget> extends State<T> {
  bool isLoading = false;
  void changeLoading() {
    setState(() {
      isLoading = !isLoading;
    });
  }
}
