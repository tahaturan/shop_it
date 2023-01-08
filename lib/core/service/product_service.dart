import 'dart:io';

import 'package:dio/dio.dart';
import 'package:shop_it/core/model/product_model.dart';

abstract class IProductService {
  IProductService(this.dio);

  final Dio dio;

  Future<List<ProductModel>?> fetchProductItem();
  Future<List<ProductModel>?> fetchSpecificItem(String category);
}

class ProductService extends IProductService {
  ProductService(super.dio);

  @override
  Future<List<ProductModel>?> fetchProductItem() async {
    final response = await dio.get(ProductPath.products.path);

    if (response.statusCode == HttpStatus.ok) {
      final jsonBody = response.data;

      if (jsonBody is List) {
        return jsonBody.map((json) => ProductModel.fromJson(json)).toList();
      }
    }
    return null;
  }

  @override
  Future<List<ProductModel>?> fetchSpecificItem(String category) async {
    final response = await dio.get(ProductPath.category.getSpecificItem(category));

    if (response.statusCode == HttpStatus.ok) {
      final jsonBody = response.data;

      if (jsonBody is List) {
        return jsonBody.map((e) => ProductModel.fromJson(e)).toList();
      }
    }

    return null;
  }
}

enum ProductPath { products, category, categories }

extension ProductPathExtension on ProductPath {
  String get path => '/$name';
  String getSpecificItem(String category) {
    return '/products/$name/$category';
  }
}
