import '../entities/category.dart';
import '../../data/repositories/category_repository.dart';

class GetCategories {
  final CategoryRepository repository;

  GetCategories(this.repository);

  Future<List<Category>> execute() async {
    return await repository.getCategories();
  }
}
