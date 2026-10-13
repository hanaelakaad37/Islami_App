import 'package:islami/modules/layout/hadith/data/models/hadith_model.dart';

abstract class HadithDataSourceInterface {
  Future<List<HadithModel>> getHadiths();
}
