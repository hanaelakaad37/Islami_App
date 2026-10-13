import 'package:islami/modules/layout/quran/domain/entities/quran_entity.dart';

abstract class QuranRepository {
  List<SuraEntity> getSuras();

  Future<List<String>> getSuraVerses(int suraNumber);
}
