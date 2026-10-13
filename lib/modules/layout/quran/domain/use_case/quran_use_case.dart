import 'package:islami/modules/layout/quran/domain/entities/quran_entity.dart';
import 'package:islami/modules/layout/quran/domain/repository/quran_repository.dart';

class GetSurasUseCase {
  final QuranRepository _quranRepository;

  GetSurasUseCase(this._quranRepository);

  List<SuraEntity> call() {
    return _quranRepository.getSuras();
  }
}
