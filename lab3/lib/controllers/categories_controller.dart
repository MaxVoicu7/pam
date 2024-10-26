import 'package:get/get.dart';
import 'package:lab2/models/category.dart';

class CategoryController extends GetxController {
  var categories = <CategoryModel>[].obs;

  @override
  void onInit() {
    super.onInit();
    loadCategories();
  }

  void loadCategories() async {
    try {
      print("Loading categories...");
      var loadedCategories = await CategoryModel.fetchCategories();
      categories.value = loadedCategories;
      print("Categories loaded: ${categories.length}");
    } catch (e) {
      print("Error loading categories: $e");
    }
  }
}
