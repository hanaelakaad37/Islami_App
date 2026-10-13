part of 'quran_bloc.dart';

enum QuranStatus { initial, loading, success, error }

class QuranState extends Equatable {
  final QuranStatus status;
  final List<SuraEntity> allSuras;
  final List<SuraEntity> filteredSuras;
  final List<String> verses;
  final String? errorMessage;

  const QuranState({
    this.status = QuranStatus.initial,
    this.allSuras = const [],
    this.filteredSuras = const [],
    this.verses = const [],
    this.errorMessage,
  });

  QuranState copyWith({
    QuranStatus? status,
    List<SuraEntity>? allSuras,
    List<SuraEntity>? filteredSuras,
    List<String>? verses,
    String? errorMessage,
  }) {
    return QuranState(
      status: status ?? this.status,
      allSuras: allSuras ?? this.allSuras,
      filteredSuras: filteredSuras ?? this.filteredSuras,
      verses: verses ?? this.verses,
      errorMessage: errorMessage ?? this.errorMessage,
    );
  }

  @override
  List<Object?> get props => [
    status,
    allSuras,
    filteredSuras,
    verses,
    errorMessage,
  ];
}
