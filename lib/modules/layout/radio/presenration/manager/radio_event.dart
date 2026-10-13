part of 'radio_bloc.dart';

sealed class RadioEvent extends Equatable {
  const RadioEvent();
}

class GetRadioEvent extends RadioEvent {
  @override
  List<Object?> get props => [];
}

class PlayAudioEvent extends RadioEvent {
  final String url;

  const PlayAudioEvent({required this.url});

  @override
  List<Object?> get props => [url];
}

class StopAudioEvent extends RadioEvent {
  @override
  List<Object?> get props => [];
}

final class ToggleMuteEvent extends RadioEvent {
  const ToggleMuteEvent();

  @override
  List<Object?> get props => [];
}
