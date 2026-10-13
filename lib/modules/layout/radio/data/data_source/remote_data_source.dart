import 'package:islami/core/network/api_interface.dart';
import 'package:islami/core/network/endpoints.dart';
import 'package:islami/modules/layout/radio/data/data_source/data_source_interface.dart';
import 'package:islami/modules/layout/radio/data/models/radio_model.dart';
import 'package:islami/modules/layout/radio/data/models/reciters_model.dart';

class RemoteDataSource implements DataSourceInterface {
  final ApiInterface _apiInterface;

  RemoteDataSource(this._apiInterface);

  @override
  Future<RecitersModel> getReciters() async {
    final response = await _apiInterface.get(Endpoints.reciters);

    return RecitersModel.fromJson(response.data);
  }

  @override
  Future<RadioModel> getRadio() async {
    final response = await _apiInterface.get(Endpoints.radio);
    return RadioModel.fromJson(response.data);
  }
}
