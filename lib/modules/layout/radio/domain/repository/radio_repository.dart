import 'package:islami/modules/layout/radio/domain/entities/radio_entity.dart';
import 'package:islami/modules/layout/radio/domain/entities/reciters_entity.dart';

import '../../../../../core/network/api_results.dart';

abstract class RadioRepository {
  Future<ApiResults<RecitersEntity>> getReciters();

  Future<ApiResults<RadioEntity>> getRadio();
}
