import 'package:islami/modules/layout/radio/data/models/radio_model.dart';
import 'package:islami/modules/layout/radio/data/models/reciters_model.dart';

abstract class DataSourceInterface {
  Future<RecitersModel> getReciters();

  Future<RadioModel> getRadio();
}
