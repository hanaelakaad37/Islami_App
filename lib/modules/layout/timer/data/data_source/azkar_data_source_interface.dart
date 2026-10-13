import '../models/azkar_model.dart';

abstract class AzkarDataSourceInterface {
  Future<List<AzkarModel>> getAzkar(String category);
}
