part of 'fact_history_bloc.dart';

class FactHistoryEvent extends Equatable {
  const FactHistoryEvent();

  @override
  List<Object> get props => [];
}

class FetchFactHistoryEvent extends FactHistoryEvent {
  const FetchFactHistoryEvent();
}
