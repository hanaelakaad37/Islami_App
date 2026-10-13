import 'package:islami/modules/layout/radio/domain/entities/reciters_entity.dart';
import 'package:islami/modules/layout/radio/domain/repository/radio_repository.dart';

import '../../../../../core/network/api_results.dart';

class RecitersUseCase {
  final RadioRepository _radioRepository;

  RecitersUseCase(this._radioRepository);

  Future<ApiResults<RecitersEntity>> call() async {
    return await _radioRepository.getReciters();
  }
}
