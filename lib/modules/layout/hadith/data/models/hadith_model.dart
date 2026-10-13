import 'package:islami/modules/layout/hadith/domain/entities/hadith_entity.dart';

class HadithModel extends HadithEntity {
  HadithModel({required super.title, required super.content});

  factory HadithModel.fromRawString(String rawContent) {
    final parts = rawContent.split('\n');

    return HadithModel(
      title: parts.first.trim(),
      content: parts.skip(1).join('\n').trim(),
    );
  }
}
