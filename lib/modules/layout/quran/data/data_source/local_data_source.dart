import 'package:flutter/services.dart';
import 'package:islami/modules/layout/quran/data/data_source/sura_data_source_interface.dart';
import 'package:islami/modules/layout/quran/data/model/sura_model.dart';

class LocalDataSource implements SuraDataSourceInterface {
  @override
  List<SuraModel> getSuras() {
    return SuraModel.getSuraList();
  }

  @override
  Future<List<String>> getSuraVerses(int suraNumber) async {
    final content = await rootBundle.loadString(
      'assets/files/Suras/$suraNumber.txt',
    );
    final verses = content
        .trim()
        .split('\n')
        .where((s) => s.isNotEmpty)
        .toList();
    return verses;
  }
}
