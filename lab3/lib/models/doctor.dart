import 'dart:convert';
import 'package:flutter/services.dart';

class DoctorModel {
  String name;
  String imagePath;
  String speciality;
  String center;
  num rating;
  num reviewCount;

  DoctorModel(
      {required this.name,
      required this.imagePath,
      required this.speciality,
      required this.center,
      required this.rating,
      required this.reviewCount});

  factory DoctorModel.fromJson(Map<String, dynamic> json) {
    return DoctorModel(
      name: json['full_name'],
      imagePath: json['image'],
      speciality: json['type_of_doctor'],
      center: json['location_of_center'],
      rating: json['review_rate'],
      reviewCount: json['reviews_count'],
    );
  }

  static Future<List<DoctorModel>> fetchDoctors() async {
    final String response =
        await rootBundle.loadString('assets/data/doctors.json');
    final List<dynamic> data = json.decode(response);
    return data.map((json) => DoctorModel.fromJson(json)).toList();
  }
}
