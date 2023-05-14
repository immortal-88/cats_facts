import 'package:cats_facts/constants/constants.dart';
import 'package:cats_facts/models/cat_info.dart';
import 'package:cats_facts/repositories/cat_repository.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive_flutter/hive_flutter.dart';

part 'cat_info_event.dart';
part 'cat_info_state.dart';

class CatInfoBloc extends Bloc<CatInfoEvent, CatInfoState> {
  CatInfoBloc({required CatRepository catRepository})
      : _box = Hive.box(Constants.catInfoBox),
        _catRepository = catRepository,
        super(CatInfoState()) {
    on<FetchCatInfoEvent>(_mapFetchCatInfoToState);
  }

  final CatRepository _catRepository;
  final Box _box;

  Future<void> _mapFetchCatInfoToState(
      FetchCatInfoEvent event, Emitter<CatInfoState> emit) async {
    emit(state.copyWith(status: CatInfoStatus.loading));
    try {
      final catInfo = await _catRepository.getCatInfo();

      emit(state.copyWith(
          status: CatInfoStatus.success,
          catInfo: CatInfo(
              imageUrl: Constants.catImageUrl,
              description: catInfo.fact,
              createdAt: DateTime.now())));

      _box.add(CatInfo(description: catInfo.fact, createdAt: DateTime.now()));
    } on Exception {
      emit(state.copyWith(status: CatInfoStatus.failure));
    }
  }
}
