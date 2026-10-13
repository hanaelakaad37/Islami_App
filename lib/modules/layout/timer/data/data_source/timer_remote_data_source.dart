import 'package:islami/core/network/api_interface.dart';
import 'package:islami/core/network/endpoints.dart';
import 'package:islami/modules/layout/timer/data/data_source/timer_data_source_interface.dart';
import 'package:islami/modules/layout/timer/data/models/timer_model.dart';

class TimerRemoteDataSource implements TimerDataSourceInterface {
  final ApiInterface _apiInterface;

  TimerRemoteDataSource(this._apiInterface);

  @override
  Future<PrayerTimesModel> getPrayTime() async {
    final response = await _apiInterface.get(Endpoints.timer);
    return PrayerTimesModel.fromJson(response.data);
  }
}
