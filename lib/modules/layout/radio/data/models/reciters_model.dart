import 'package:islami/modules/layout/radio/domain/entities/reciters_entity.dart';

class RecitersModel extends RecitersEntity {
  RecitersModel({required super.reciters});

  factory RecitersModel.fromJson(Map<String, dynamic> json) {
    return RecitersModel(
      reciters: (json['reciters'] as List? ?? [])
          .map((e) => ReciterModel.fromJson(e))
          .toList(),
    );
  }
}

class ReciterModel extends ReciterEntity {
  ReciterModel({
    required super.id,
    required super.name,
    required super.letter,
    required super.date,
    required super.moshaf,
  });

  factory ReciterModel.fromJson(Map<String, dynamic> json) {
    return ReciterModel(
      id: json['id'] ?? 0,
      name: json['name'] ?? '',
      letter: json['letter'] ?? '',
      date: json['date'] ?? '',
      moshaf: (json['moshaf'] as List? ?? [])
          .map((e) => MoshafModel.fromJson(e))
          .toList(),
    );
  }
}

class MoshafModel extends MoshafEntity {
  MoshafModel({
    required super.id,
    required super.name,
    required super.rewayaId,
    required super.server,
    required super.surahTotal,
    required super.moshafType,
    required super.surahList,
  });

  factory MoshafModel.fromJson(Map<String, dynamic> json) {
    return MoshafModel(
      id: json['id'] ?? 0,
      name: json['name'] ?? '',
      rewayaId: json['rewaya_id'] ?? 0,
      server: json['server'] ?? '',
      surahTotal: json['surah_total'] ?? 0,
      moshafType: json['moshaf_type'] ?? 0,
      surahList: json['surah_list'] ?? '',
    );
  }
}
