import 'package:islami/core/network/api_results.dart';
import 'package:islami/modules/layout/radio/domain/entities/radio_entity.dart';
import 'package:islami/modules/layout/radio/domain/repository/radio_repository.dart';

class RadioUseCase {
  final RadioRepository _radioRepository;

  RadioUseCase(this._radioRepository);

  Future<ApiResults<RadioEntity>> call() async {
    return await _radioRepository.getRadio();
  }
}
