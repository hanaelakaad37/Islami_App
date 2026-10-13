import 'package:islami/modules/layout/hadith/data/data_source/hadith_data_source_interface.dart';
import 'package:islami/modules/layout/hadith/domain/entities/hadith_entity.dart';
import 'package:islami/modules/layout/hadith/domain/repository/hadith_repository.dart';

class HadithRepositoryImp implements HadithRepository {
  final HadithDataSourceInterface _dataSource;

  HadithRepositoryImp(this._dataSource);

  @override
  Future<List<HadithEntity>> getHadiths() async {
    return await _dataSource.getHadiths();
  }
}
