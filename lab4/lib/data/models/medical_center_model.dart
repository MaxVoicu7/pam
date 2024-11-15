import '../../domain/entities/medical_center.dart';

class MedicalCenterModel extends MedicalCenter {
  MedicalCenterModel({
    required super.name,
    required super.imagePath,
    required super.address,
    required super.rating,
    required super.reviewCount,
    required super.distance,
    required super.distanceTime,
  });

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
}
