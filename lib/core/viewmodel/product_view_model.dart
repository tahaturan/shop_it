import 'package:shop_it/core/model/product_model.dart';
import 'package:shop_it/core/service/product_service.dart';
import 'package:shop_it/core/view/product_view.dart';
import 'package:shop_it/core/viewmodel/home_view_model.dart';
import 'package:shop_it/product/service/project_dio.dart';

abstract class ProductViewModel extends LoadingState<ProductView> with ProjectDioMixin {
  late final IProductService productService;

  List<ProductModel> products = [];

  void checkCategoryName() {
    if (widget.categoryName == ProductPath.products.name) {
      fetchProduct();
    } else {
      fetchProductWidtCategory();
    }
  }

  @override
  void initState() {
    super.initState();
    productService = ProductService(service);
    checkCategoryName();
  }

  Future<void> fetchProduct() async {
    changeLoading();
    products = await productService.fetchProductItem() ?? [];
    changeLoading();
  }

  Future<void> fetchProductWidtCategory() async {
    changeLoading();
    products = await productService.fetchSpecificItem(widget.categoryName) ?? [];
    changeLoading();
  }
}
