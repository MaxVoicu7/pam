import 'dart:convert';
import 'package:flutter/services.dart';

class CategoryModel {
  String name;
  String iconPath;
  Color backgroundColor;

  CategoryModel(
      {required this.name,
      required this.iconPath,
      required this.backgroundColor});

  factory CategoryModel.fromJson(Map<String, dynamic> json) {
    return CategoryModel(
      name: json['title'],
      iconPath: json['icon'],
      backgroundColor: Color(int.parse(json['color'])),
    );
  }

  static Future<List<CategoryModel>> fetchCategories() async {
    final String response =
        await rootBundle.loadString('assets/data/categories.json');
    final List<dynamic> data = json.decode(response);
    return data.map((json) => CategoryModel.fromJson(json)).toList();
  }
}
