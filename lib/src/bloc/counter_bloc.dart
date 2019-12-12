

import 'dart:async';

class CounterBloc {
  int count = 0;

  final _countController = StreamController<int>.broadcast();

  get counterStream => _countController.stream;

  get addCurrentCounter => _countController.sink.add(count);

  plusOrMinusCounter(int val){
    count += val;

    _countController.sink.add(count);
  }

  dispose(){
    _countController.close();
  }

}

var counterBloc = CounterBloc();