import 'package:flutter/material.dart';
import 'package:shop_it/core/model/product_model.dart';
import 'package:shop_it/core/service/product_service.dart';
import 'package:shop_it/core/view/search_view.dart';
import 'package:shop_it/core/viewmodel/home_view_model.dart';
import 'package:shop_it/product/service/project_dio.dart';

abstract class SearchViewModel extends LoadingState<SearchWiew> with ProjectDioMixin {
  late final TextEditingController controller;
  late final IProductService productService;

  List<ProductModel> products = [];
  @override
  void initState() {
    super.initState();
    productService = ProductService(service);
    controller = TextEditingController();
    fetchProduct();
  }

  Future<void> fetchProduct() async {
    changeLoading();
    products = await productService.fetchProductItem() ?? [];
    changeLoading();
  }
}
