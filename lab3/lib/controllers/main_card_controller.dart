import 'package:get/get.dart';
import 'package:lab2/models/main_card.dart';

class MainCardController extends GetxController {
  var mainCards = <MainCardModel>[].obs;

  @override
  void onInit() {
    super.onInit();
    loadMainCards();
  }

  void loadMainCards() async {
    try {
      var cards = await MainCardModel.fetchMainCards();
      mainCards.value = cards;
    } catch (e) {
      // ignore: avoid_print
      print('Error loading main cards: $e');
    }
  }
}
