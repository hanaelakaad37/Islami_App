import 'package:islami/modules/layout/timer/domain/repository/timer_repository.dart';

import '../entities/azkar_entity.dart';

class AzkarUseCase {
  final TimerRepository repository;

  AzkarUseCase(this.repository);

  Future<List<AzkarEntity>> call(String category) {
    return repository.getAzkar(category);
  }
}
