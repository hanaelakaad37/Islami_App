import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:islami/modules/layout/hadith/domain/entities/hadith_entity.dart';
import 'package:islami/modules/layout/hadith/domain/use_case/get_hadith_use_case.dart';

part 'hadith_event.dart';
part 'hadith_state.dart';

class HadithBloc extends Bloc<HadithEvent, HadithState> {
  final GetHadithsUseCase getHadithsUseCase;

  HadithBloc({required this.getHadithsUseCase}) : super(const HadithState()) {
    on<GetHadithsEvent>(_onGetHadiths);
  }

  Future<void> _onGetHadiths(
    GetHadithsEvent event,
    Emitter<HadithState> emit,
  ) async {
    emit(state.copyWith(status: HadithStatus.loading));
    try {
      final hadiths = await getHadithsUseCase();
      emit(state.copyWith(status: HadithStatus.success, hadiths: hadiths));
    } catch (e) {
      emit(
        state.copyWith(status: HadithStatus.error, errorMessage: e.toString()),
      );
    }
  }
}
