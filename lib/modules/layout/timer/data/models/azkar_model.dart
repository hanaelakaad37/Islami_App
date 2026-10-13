import '../../domain/entities/azkar_entity.dart';

class AzkarModel extends AzkarEntity {
  const AzkarModel({required super.category, required super.content});

  factory AzkarModel.fromJson(Map<String, dynamic> json) {
    return AzkarModel(
      category: json['category']?.toString() ?? '',
      content: json['content']?.toString() ?? '',
    );
  }
}
