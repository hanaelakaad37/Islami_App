import 'package:equatable/equatable.dart';

abstract class AzkarEvent extends Equatable {
  const AzkarEvent();

  @override
  List<Object?> get props => [];
}

class GetAzkarEvent extends AzkarEvent {
  final String category;

  const GetAzkarEvent(this.category);

  @override
  List<Object?> get props => [category];
}
