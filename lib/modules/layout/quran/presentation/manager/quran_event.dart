part of 'quran_bloc.dart';

sealed class QuranEvent extends Equatable {
  const QuranEvent();

  @override
  List<Object?> get props => [];
}

class GetSurasEvent extends QuranEvent {
  const GetSurasEvent();
}

class SearchSurasEvent extends QuranEvent {
  final String query;

  const SearchSurasEvent(this.query);

  @override
  List<Object?> get props => [query];
}

class GetSuraVersesEvent extends QuranEvent {
  final int suraNumber;

  const GetSuraVersesEvent(this.suraNumber);

  @override
  List<Object?> get props => [suraNumber];
}
