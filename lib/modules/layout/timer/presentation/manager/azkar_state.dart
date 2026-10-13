import 'package:equatable/equatable.dart';

import '../../domain/entities/azkar_entity.dart';

abstract class AzkarState extends Equatable {
  const AzkarState();

  @override
  List<Object?> get props => [];
}

class AzkarInitial extends AzkarState {}

class AzkarLoading extends AzkarState {}

class AzkarSuccess extends AzkarState {
  final List<AzkarEntity> azkar;

  const AzkarSuccess(this.azkar);

  @override
  List<Object?> get props => [azkar];
}

class AzkarFailure extends AzkarState {
  final String message;

  const AzkarFailure(this.message);

  @override
  List<Object?> get props => [message];
}
