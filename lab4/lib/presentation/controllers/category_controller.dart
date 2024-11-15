import 'package:get/get.dart';
import '../../domain/entities/category.dart';
import '../../domain/usecases/get_categories.dart';

class CategoryController extends GetxController {
  final GetCategories getCategories;

  CategoryController({required this.getCategories});

  var categories = <Category>[].obs;

  @override
  void onInit() {
    super.onInit();
    loadCategories();
  }

  void loadCategories() async {
    try {
      categories.value = await getCategories.execute();
    } catch (e) {
      // ignore: avoid_print
      print("Error loading categories: $e");
    }
  }
}
