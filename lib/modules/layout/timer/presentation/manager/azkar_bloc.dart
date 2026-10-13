import 'package:flutter_bloc/flutter_bloc.dart';

import '../../domain/use_case/azkar_use_case.dart';
import 'azkar_event.dart';
import 'azkar_state.dart';

class AzkarBloc extends Bloc<AzkarEvent, AzkarState> {
  final AzkarUseCase getAzkarUseCase;

  AzkarBloc(this.getAzkarUseCase) : super(AzkarInitial()) {
    on<GetAzkarEvent>((event, emit) async {
      emit(AzkarLoading());
      try {
        final result = await getAzkarUseCase(event.category);
        emit(AzkarSuccess(result));
      } catch (e) {
        emit(AzkarFailure('Something went wrong'));
      }
    });
  }
}
