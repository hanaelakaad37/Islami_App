import 'package:islami/modules/layout/hadith/domain/entities/hadith_entity.dart';
import 'package:islami/modules/layout/hadith/domain/repository/hadith_repository.dart';

class GetHadithsUseCase {
  final HadithRepository _hadithRepository;

  GetHadithsUseCase(this._hadithRepository);

  Future<List<HadithEntity>> call() async {
    return await _hadithRepository.getHadiths();
  }
}
