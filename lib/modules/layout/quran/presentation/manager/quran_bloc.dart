import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:islami/modules/layout/quran/domain/entities/quran_entity.dart';
import 'package:islami/modules/layout/quran/domain/use_case/quran_use_case.dart';

import '../../domain/use_case/sura_verses_use_case.dart';

part 'quran_event.dart';
part 'quran_state.dart';

class QuranBloc extends Bloc<QuranEvent, QuranState> {
  final GetSurasUseCase getSurasUseCase;
  final GetSuraVersesUseCase getSuraVersesUseCase;

  QuranBloc({required this.getSurasUseCase, required this.getSuraVersesUseCase})
    : super(const QuranState()) {
    on<GetSurasEvent>(_onGetSuras);
    on<SearchSurasEvent>(_onSearchSuras);
    on<GetSuraVersesEvent>(_onGetSuraVerses);
  }

  void _onGetSuras(GetSurasEvent event, Emitter<QuranState> emit) {
    emit(state.copyWith(status: QuranStatus.loading));
    try {
      final suras = getSurasUseCase();
      emit(
        state.copyWith(
          status: QuranStatus.success,
          allSuras: suras,
          filteredSuras: suras,
        ),
      );
    } catch (e) {
      emit(
        state.copyWith(status: QuranStatus.error, errorMessage: e.toString()),
      );
    }
  }

  void _onSearchSuras(SearchSurasEvent event, Emitter<QuranState> emit) {
    final query = event.query.trim().toLowerCase();
    if (query.isEmpty) {
      emit(state.copyWith(filteredSuras: state.allSuras));
      return;
    }

    final filtered = state.allSuras.where((sura) {
      final nameEn = sura.suraNameEn.toLowerCase();
      final nameAr = sura.suraNameAr;
      final number = sura.suraNumber.toString();

      return nameEn.contains(query) ||
          nameAr.contains(event.query.trim()) ||
          number.contains(query);
    }).toList();

    emit(state.copyWith(filteredSuras: filtered));
  }

  Future<void> _onGetSuraVerses(
    GetSuraVersesEvent event,
    Emitter<QuranState> emit,
  ) async {
    emit(state.copyWith(status: QuranStatus.loading, verses: []));
    try {
      final verses = await getSuraVersesUseCase(event.suraNumber);
      emit(state.copyWith(status: QuranStatus.success, verses: verses));
    } catch (e) {
      emit(
        state.copyWith(status: QuranStatus.error, errorMessage: e.toString()),
      );
    }
  }
}
