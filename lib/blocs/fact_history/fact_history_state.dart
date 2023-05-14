part of 'fact_history_bloc.dart';

enum FactHistoryStatus { initial, loading, success, failure }

class FactHistoryState extends Equatable {
  FactHistoryState({
    this.status = FactHistoryStatus.initial,
    List<CatInfo>? factHistory,
  }) : factHistory = factHistory ?? List.empty();

  final FactHistoryStatus status;
  final List<CatInfo> factHistory;

  FactHistoryState copyWith({
    FactHistoryStatus? status,
    List<CatInfo>? factHistory,
  }) {
    return FactHistoryState(
        status: status ?? this.status,
        factHistory: factHistory ?? this.factHistory);
  }

  @override
  List<Object?> get props => [status, factHistory];
}
