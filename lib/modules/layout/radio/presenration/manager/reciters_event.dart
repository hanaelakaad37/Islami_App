part of 'reciters_bloc.dart';

sealed class RecitersEvent extends Equatable {
  const RecitersEvent();

  @override
  List<Object?> get props => [];
}

final class GetRecitersEvent extends RecitersEvent {}

final class PlayReciterEvent extends RecitersEvent {
  final String url;

  const PlayReciterEvent(this.url);

  @override
  List<Object?> get props => [url];
}

final class MuteReciterEvent extends RecitersEvent {}

final class NextSurahEvent extends RecitersEvent {
  final String server;
  final int currentSurah;

  const NextSurahEvent({required this.server, required this.currentSurah});

  @override
  List<Object?> get props => [server, currentSurah];
}

final class PreviousSurahEvent extends RecitersEvent {
  final String server;
  final int currentSurah;

  const PreviousSurahEvent({required this.server, required this.currentSurah});

  @override
  List<Object?> get props => [server, currentSurah];
}
