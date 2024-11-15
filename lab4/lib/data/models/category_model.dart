import 'package:flutter/material.dart';
import '../../domain/entities/category.dart';

class CategoryModel extends Category {
  CategoryModel({
    required super.name,
    required super.iconPath,
    required super.backgroundColor,
  });

  factory CategoryModel.fromJson(Map<String, dynamic> json) {
    return CategoryModel(
      name: json['title'],
      iconPath: json['icon'],
      backgroundColor: Color(int.parse(json['color'])),
    );
  }
}
