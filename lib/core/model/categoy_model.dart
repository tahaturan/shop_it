class CategoryModel {
  int id;
  String name;
  CategoryModel({
    required this.id,
    required this.name,
  });

  static List<CategoryModel> dummuyCategoy() {
    return [
      CategoryModel(id: 1, name: 'products'),
      CategoryModel(id: 2, name: 'electronics'),
      CategoryModel(id: 3, name: 'jewelery'),
      CategoryModel(id: 4, name: "men's clothing"),
      CategoryModel(id: 5, name: "women's clothing"),
    ];
  }
}
