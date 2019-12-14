import 'dart:async';
import 'package:bloc/bloc.dart';
import './bloc.dart';

class CounterBloc extends Bloc<CounterEvent, CounterState> {
  int count = 0;

  @override
  CounterState get initialState => InitialCounterState(count);

  @override
  Stream<CounterState> mapEventToState(
    CounterEvent event,
  ) async* {
    // TODO: Add Logic
    yield Counting();
    if(event is AddCount){
      count++;
      yield Counted(count);
    } else if(event is MinusCount){
      count--;
      yield Counted(count);
    } else if(event is GetCount){
      yield Counted(count);
    }
  }
}
