import 'package:islami/modules/layout/hadith/domain/entities/hadith_entity.dart';

abstract class HadithRepository {
  Future<List<HadithEntity>> getHadiths();
}
