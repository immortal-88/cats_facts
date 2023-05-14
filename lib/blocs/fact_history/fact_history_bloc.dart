import 'package:cats_facts/constants/constants.dart';
import 'package:cats_facts/models/cat_info.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive_flutter/hive_flutter.dart';

part 'fact_history_event.dart';
part 'fact_history_state.dart';

class FactHistoryBloc extends Bloc<FactHistoryEvent, FactHistoryState> {
  FactHistoryBloc()
      : _box = Hive.box(Constants.catInfoBox),
        super(FactHistoryState()) {
    on<FetchFactHistoryEvent>(_mapFetchFactHistoryToState);
  }

  final Box _box;

  Future<void> _mapFetchFactHistoryToState(
      FetchFactHistoryEvent event, Emitter<FactHistoryState> emit) async {
    emit(state.copyWith(status: FactHistoryStatus.loading));
    try {
      final facts = _box.values.toList().cast<CatInfo>();

      emit(state.copyWith(
          status: FactHistoryStatus.success, factHistory: facts));
    } on Exception {
      emit(state.copyWith(status: FactHistoryStatus.failure));
    }
  }
}
