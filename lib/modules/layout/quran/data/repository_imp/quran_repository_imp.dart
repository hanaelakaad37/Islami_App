import 'package:islami/modules/layout/quran/data/data_source/sura_data_source_interface.dart';
import 'package:islami/modules/layout/quran/domain/entities/quran_entity.dart';
import 'package:islami/modules/layout/quran/domain/repository/quran_repository.dart';

class QuranRepositoryImp implements QuranRepository {
  final SuraDataSourceInterface _suraDataSource;

  QuranRepositoryImp(this._suraDataSource);

  @override
  List<SuraEntity> getSuras() {
    return _suraDataSource.getSuras();
  }

  @override
  Future<List<String>> getSuraVerses(int suraNumber) async {
    return await _suraDataSource.getSuraVerses(suraNumber);
  }
}
