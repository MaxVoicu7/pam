import 'package:get/get.dart';
import '../../data/datasources/local/category_local_data_source.dart';
import '../../data/repositories/category_repository.dart';
import '../../domain/usecases/get_categories.dart';
import '../controllers/category_controller.dart';

class CategoryBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<CategoryLocalDataSource>(
      () => CategoryLocalDataSourceImpl(),
    );

    Get.lazyPut(() => CategoryRepository(
          localDataSource: Get.find(),
        ));

    Get.lazyPut(() => GetCategories(
          Get.find(),
        ));

    Get.lazyPut(() => CategoryController(
          getCategories: Get.find(),
        ));
  }
}
