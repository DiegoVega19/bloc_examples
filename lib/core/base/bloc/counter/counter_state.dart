part of 'counter_bloc.dart';

@immutable
sealed class CounterState {}


class InitialState extends CounterState {}

final class UpdateState extends CounterState {
  final int counter;
  UpdateState(this.counter);
}