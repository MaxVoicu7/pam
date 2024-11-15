import '../entities/main_card.dart';
import '../../data/repositories/main_card_repository.dart';

class GetMainCards {
  final MainCardRepository repository;

  GetMainCards(this.repository);

  Future<List<MainCard>> execute() async {
    return await repository.getMainCards();
  }
}
