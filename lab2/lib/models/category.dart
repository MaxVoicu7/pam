import 'package:flutter/material.dart';

class CategoryModel {
  String name;
  String iconPath;
  Color backgroundColor;

  CategoryModel(
      {required this.name,
      required this.iconPath,
      required this.backgroundColor});

  static List<CategoryModel> getCategories() {
    List<CategoryModel> categories = [];

    categories.add(CategoryModel(
        name: 'Dentistry',
        iconPath: './assets/icons/dentistry.svg',
        backgroundColor: Color(0xffdc9497)));

    categories.add(CategoryModel(
        name: 'Cardiology',
        iconPath: './assets/icons/cardiology.svg',
        backgroundColor: Color(0xff93c19e)));

    categories.add(CategoryModel(
        name: 'Pulmonology',
        iconPath: './assets/icons/pulmonology.svg',
        backgroundColor: Color(0xfff5ad7e)));

    categories.add(CategoryModel(
        name: 'Neurology',
        iconPath: './assets/icons/neurology.svg',
        backgroundColor: Color(0xff4d9b91)));

    categories.add(CategoryModel(
        name: 'General',
        iconPath: './assets/icons/general-health.svg',
        backgroundColor: Color(0xffaca1cd)));

    categories.add(CategoryModel(
        name: 'Gastroenology',
        iconPath: './assets/icons/dentistry.svg',
        backgroundColor: Color(0xff352261)));

    categories.add(CategoryModel(
        name: 'Laboratory',
        iconPath: './assets/icons/laboratory.svg',
        backgroundColor: Color(0xffdeb6b5)));

    categories.add(CategoryModel(
        name: 'Vaccination',
        iconPath: './assets/icons/vaccination.svg',
        backgroundColor: Color(0xff89ccdb)));

    return categories;
  }
}
