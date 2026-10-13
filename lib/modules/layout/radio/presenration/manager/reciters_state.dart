part of 'reciters_bloc.dart';

sealed class RecitersState extends Equatable {
  const RecitersState();
}

final class RecitersInitial extends RecitersState {
  @override
  List<Object> get props => [];
}

final class RecitersLoading extends RecitersState {
  @override
  List<Object> get props => [];
}

final class RecitersSuccess extends RecitersState {
  final RecitersEntity recitersEntity;
  final String? currentURL;
  final bool isPlaying;
  final bool isMuted;

  const RecitersSuccess({
    required this.recitersEntity,
    required this.currentURL,
    required this.isPlaying,
    required this.isMuted,
  });

  @override
  List<Object> get props => [recitersEntity, ?currentURL, isPlaying, isMuted];
}

final class RecitersError extends RecitersState {
  final String message;

  const RecitersError(this.message);

  @override
  List<Object> get props => [message];
}
