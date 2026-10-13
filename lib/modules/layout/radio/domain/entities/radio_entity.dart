class RadioEntity {
  final List<Radios> radios;

  RadioEntity({required this.radios});
}

class Radios {
  final int id;

  final String name;
  final String url;
  final String recent_date;

  Radios({
    required this.id,
    required this.name,
    required this.url,
    required this.recent_date,
  });
}
