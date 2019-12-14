import 'package:equatable/equatable.dart';

abstract class CounterState extends Equatable {
  const CounterState();
}

class InitialCounterState extends CounterState {
  final int count;

  const InitialCounterState(this.count);

  @override
  List<Object> get props => [count];
}

class Counting extends CounterState {
  const Counting();

  @override
  // TODO: implement props
  List<Object> get props => [];
}

class Counted extends CounterState {
  final int count;

  Counted(this.count);

  @override
  // TODO: implement props
  List<Object> get props => [count];

}

