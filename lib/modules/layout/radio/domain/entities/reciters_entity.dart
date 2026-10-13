class RecitersEntity {
  final List<ReciterEntity> reciters;

  RecitersEntity({required this.reciters});
}

class ReciterEntity {
  final int id;
  final String name;
  final String letter;
  final String date;
  final List<MoshafEntity> moshaf;

  ReciterEntity({
    required this.id,
    required this.name,
    required this.letter,
    required this.date,
    required this.moshaf,
  });
}

class MoshafEntity {
  final int id;
  final String name;
  final int rewayaId;
  final String server;
  final int surahTotal;
  final int moshafType;
  final String surahList;

  MoshafEntity({
    required this.id,
    required this.name,
    required this.rewayaId,
    required this.server,
    required this.surahTotal,
    required this.moshafType,
    required this.surahList,
  });
}
