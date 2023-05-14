part of 'cat_info_bloc.dart';

enum CatInfoStatus { initial, loading, success, failure }

class CatInfoState extends Equatable {
  CatInfoState({
    this.status = CatInfoStatus.initial,
    CatInfo? catInfo,
  }) : catInfo = catInfo ?? CatInfo.empty;

  final CatInfoStatus status;
  final CatInfo catInfo;

  CatInfoState copyWith({
    CatInfoStatus? status,
    CatInfo? catInfo,
  }) {
    return CatInfoState(
        status: status ?? this.status, catInfo: catInfo ?? this.catInfo);
  }

  @override
  List<Object?> get props => [status, catInfo];
}
