import 'package:get/get.dart';
import '../../data/datasources/local/main_card_local_data_source.dart';
import '../../data/repositories/main_card_repository.dart';
import '../../domain/usecases/get_main_cards.dart';
import '../controllers/main_card_controller.dart';

class MainCardBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<MainCardLocalDataSource>(
      () => MainCardLocalDataSourceImpl(),
    );

    Get.lazyPut(() => MainCardRepository(
          localDataSource: Get.find(),
        ));

    Get.lazyPut(() => GetMainCards(
          Get.find(),
        ));

    Get.lazyPut(() => MainCardController(
          getMainCards: Get.find(),
        ));
  }
}
