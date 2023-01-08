import 'package:dio/dio.dart';

mixin ProjectDioMixin {
  final service = Dio(BaseOptions(baseUrl: 'https://fakestoreapi.com'));
}
