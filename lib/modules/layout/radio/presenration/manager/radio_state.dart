part of 'radio_bloc.dart';

sealed class RadioState extends Equatable {
  const RadioState();
}

final class RadioInitial extends RadioState {
  @override
  List<Object> get props => [];
}

final class RadioLoading extends RadioState {
  @override
  List<Object> get props => [];
}

final class RadioSuccess extends RadioState {
  final RadioEntity radioEntity;
  final String? currentURL;
  final bool isPlaying;
  final bool isMuted;

  const RadioSuccess({
    required this.radioEntity,
    required this.currentURL,
    required this.isPlaying,
    required this.isMuted,
  });

  @override
  List<Object?> get props => [radioEntity, currentURL, isPlaying, isMuted];
}

final class RadioError extends RadioState {
  final String message;

  const RadioError(this.message);

  @override
  List<Object> get props => [message];
}
