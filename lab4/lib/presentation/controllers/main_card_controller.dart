import 'package:get/get.dart';
import '../../domain/entities/main_card.dart';
import '../../domain/usecases/get_main_cards.dart';

class MainCardController extends GetxController {
  final GetMainCards getMainCards;

  MainCardController({required this.getMainCards});

  var mainCards = <MainCard>[].obs;

  @override
  void onInit() {
    super.onInit();
    loadMainCards();
  }

  void loadMainCards() async {
    try {
      mainCards.value = await getMainCards.execute();
    } catch (e) {
      // ignore: avoid_print
      print("Error loading main cards: $e");
    }
  }
}
