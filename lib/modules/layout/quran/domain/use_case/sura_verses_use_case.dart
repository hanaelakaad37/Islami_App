import '../repository/quran_repository.dart';

class GetSuraVersesUseCase {
  final QuranRepository _quranRepository;

  GetSuraVersesUseCase(this._quranRepository);

  Future<List<String>> call(int suraNumber) async {
    return await _quranRepository.getSuraVerses(suraNumber);
  }
}
