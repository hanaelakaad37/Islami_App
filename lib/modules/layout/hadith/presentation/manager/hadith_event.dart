part of 'hadith_bloc.dart';

sealed class HadithEvent extends Equatable {
  const HadithEvent();

  @override
  List<Object?> get props => [];
}

class GetHadithsEvent extends HadithEvent {
  const GetHadithsEvent();
}
