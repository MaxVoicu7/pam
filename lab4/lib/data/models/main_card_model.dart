import '../../domain/entities/main_card.dart';

class MainCardModel extends MainCard {
  MainCardModel({
    required super.title,
    required super.subtitle,
    required super.imagePath,
  });

  factory MainCardModel.fromJson(Map<String, dynamic> json) {
    return MainCardModel(
      title: json['title'],
      subtitle: json['description'],
      imagePath: json['image'],
    );
  }
}
