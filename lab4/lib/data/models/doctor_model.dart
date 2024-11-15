import '../../domain/entities/doctor.dart';

class DoctorModel extends Doctor {
  DoctorModel({
    required super.name,
    required super.imagePath,
    required super.speciality,
    required super.center,
    required super.rating,
    required super.reviewCount,
  });

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
}
