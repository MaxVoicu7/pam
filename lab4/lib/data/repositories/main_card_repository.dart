import '../datasources/local/main_card_local_data_source.dart';
import '../../domain/entities/main_card.dart';

class MainCardRepository {
  final MainCardLocalDataSource localDataSource;

  MainCardRepository({required this.localDataSource});

  Future<List<MainCard>> getMainCards() async {
    return await localDataSource.getMainCards();
  }
}
