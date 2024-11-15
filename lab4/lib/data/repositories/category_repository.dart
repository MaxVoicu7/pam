import '../datasources/local/category_local_data_source.dart';
import '../../domain/entities/category.dart';

class CategoryRepository {
  final CategoryLocalDataSource localDataSource;

  CategoryRepository({required this.localDataSource});

  Future<List<Category>> getCategories() async {
    return await localDataSource.getCategories();
  }
}
