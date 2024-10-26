import 'dart:convert';
import 'package:flutter/services.dart';

class MainCardModel {
  final String title;
  final String subtitle;
  final String imagePath;

  MainCardModel({
    required this.title,
    required this.subtitle,
    required this.imagePath,
  });

  factory MainCardModel.fromJson(Map<String, dynamic> json) {
    return MainCardModel(
      title: json['title'],
      subtitle: json['description'],
      imagePath: json['image'],
    );
  }

  static Future<List<MainCardModel>> fetchMainCards() async {
    final String response =
        await rootBundle.loadString('assets/data/main_cards.json');
    final List<dynamic> data = json.decode(response);
    return data.map((json) => MainCardModel.fromJson(json)).toList();
  }
}
