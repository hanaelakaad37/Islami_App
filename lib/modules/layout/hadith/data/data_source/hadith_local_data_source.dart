import 'package:flutter/services.dart';
import 'package:islami/modules/layout/hadith/data/data_source/hadith_data_source_interface.dart';
import 'package:islami/modules/layout/hadith/data/models/hadith_model.dart';

class HadithLocalDataSource implements HadithDataSourceInterface {
  @override
  Future<List<HadithModel>> getHadiths() async {
    final List<HadithModel> list = [];
    for (int i = 1; i <= 50; i++) {
      final content = await rootBundle.loadString(
        "assets/files/Hadeeth/h$i.txt",
      );
      list.add(HadithModel.fromRawString(content));
    }
    return list;
  }
}
