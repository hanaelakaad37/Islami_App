import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:islami/modules/layout/timer/data/models/azkar_model.dart';

import 'azkar_data_source_interface.dart';

class AzkarLocalDataSource implements AzkarDataSourceInterface {
  @override
  Future<List<AzkarModel>> getAzkar(String category) async {
    final jsonString = await rootBundle.loadString(
      'assets/files/azkar/azkar.json',
    );
    final Map<String, dynamic> data = jsonDecode(jsonString);
    final List<dynamic> azkarList = data[category] ?? [];

    return azkarList
        .whereType<Map<String, dynamic>>()
        .where(
          (item) =>
              item['content'] != null &&
              item['content'].toString().trim().isNotEmpty,
        )
        .map((item) => AzkarModel.fromJson(item))
        .toList();
  }
}
