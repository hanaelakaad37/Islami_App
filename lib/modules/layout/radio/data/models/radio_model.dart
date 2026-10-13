import 'package:islami/modules/layout/radio/domain/entities/radio_entity.dart';

class RadioModel extends RadioEntity {
  RadioModel({required super.radios});

  factory RadioModel.fromJson(Map<String, dynamic> json) {
    return RadioModel(
      radios: (json['radios'] as List)
          .map((e) => RadiosModel.fromJson(e))
          .toList(),
    );
  }
}

class RadiosModel extends Radios {
  RadiosModel({
    required super.id,
    required super.name,
    required super.url,
    required super.recent_date,
  });

  factory RadiosModel.fromJson(Map<String, dynamic> json) {
    return RadiosModel(
      id: json['id'],
      name: json['name'],
      url: json['url'],
      recent_date: json['recent_date'],
    );
  }
}
