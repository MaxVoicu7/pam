import 'dart:convert';
import 'package:flutter/services.dart';
import '../../models/main_card_model.dart';

abstract class MainCardLocalDataSource {
  Future<List<MainCardModel>> getMainCards();
}

class MainCardLocalDataSourceImpl implements MainCardLocalDataSource {
  @override
  Future<List<MainCardModel>> getMainCards() async {
    final String response =
        await rootBundle.loadString('assets/data/main_cards.json');
    final List<dynamic> data = json.decode(response);
    return data.map((json) => MainCardModel.fromJson(json)).toList();
  }
}
