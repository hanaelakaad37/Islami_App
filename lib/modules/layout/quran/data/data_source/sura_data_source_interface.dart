import 'package:islami/modules/layout/quran/data/model/sura_model.dart';

abstract class SuraDataSourceInterface {
  List<SuraModel> getSuras();

  Future<List<String>> getSuraVerses(int suraNumber);
}
