import 'package:equatable/equatable.dart';

abstract class CounterEvent extends Equatable {
  const CounterEvent();
}

class GetCount extends CounterEvent {
  @override
  // TODO: implement props
  List<Object> get props => [];
}

class AddCount extends CounterEvent {
  @override
  // TODO: implement props
  List<Object> get props => [];
}

class MinusCount extends CounterEvent {
  @override
  // TODO: implement props
  List<Object> get props => [];
}
