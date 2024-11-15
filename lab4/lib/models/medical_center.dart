import 'dart:convert';
import 'package:flutter/services.dart';

class MedicalCenterModel {
  String name;
  String imagePath;
  String address;
  num rating;
  num reviewCount;
  num distance;
  num distanceTime;

  MedicalCenterModel(
      {required this.name,
      required this.imagePath,
      required this.address,
      required this.rating,
      required this.reviewCount,
      required this.distance,
      required this.distanceTime});

  factory MedicalCenterModel.fromJson(Map<String, dynamic> json) {
    return MedicalCenterModel(
      name: json['title'],
      imagePath: json['image'],
      address: json['location_name'],
      rating: json['review_rate'],
      reviewCount: json['count_reviews'],
      distance: json['distance_km'],
      distanceTime: json['distance_minutes'],
    );
  }

  static Future<List<MedicalCenterModel>> fetchMedicalCenters() async {
    final String response =
        await rootBundle.loadString('assets/data/medical_centers.json');
    final List<dynamic> data = json.decode(response);
    return data.map((json) => MedicalCenterModel.fromJson(json)).toList();
  }
}
