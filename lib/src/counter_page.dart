import 'package:counter_bloc/src/bloc/counter_bloc.dart';
import 'package:counter_bloc/src/reciever_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'bloc/bloc.dart';

class CounterPage extends StatefulWidget {
  @override
  _CounterPageState createState() => _CounterPageState();
}

class _CounterPageState extends State<CounterPage> {
  @override
  Widget build(BuildContext context) {
    final counterBloc = BlocProvider.of<CounterBloc>(context);

    return Scaffold(
        appBar: AppBar(
          title: Text('counter bloc'),
          actions: <Widget>[
            IconButton(
                icon: Icon(Icons.send),
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (_) =>
                              BlocProvider.value(
                                value: BlocProvider.of<CounterBloc>(context),
                                child: RecieverPage(),
                              )));
                }),
          ],
        ),
        body: Container(
          padding: EdgeInsets.symmetric(horizontal: 16.0),
          alignment: Alignment.center,
          child:
          BlocBuilder<CounterBloc, CounterState>(builder: (context, state) {
            if (state is InitialCounterState) {
              return Text('${state.count}',
                textScaleFactor: 2.0,
              );
            } else if (state is Counting) {
              return CircularProgressIndicator();
            } else if (state is Counted) {
              return Text(
                '${state.count}',
                textScaleFactor: 2.0,
              );
            }
          }),
        ),
        floatingActionButton: Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: <Widget>[
            FloatingActionButton(
                heroTag: "btnPlus",
                child: Icon(Icons.add),
                onPressed: () {
                  counterBloc.add(AddCount());
                }),
            SizedBox(
              width: 10,
            ),
            FloatingActionButton(
                heroTag: "btnMinus",
                child: Icon(Icons.remove),
                onPressed: () {
                  counterBloc.add(MinusCount());
                }),
          ],
        ));
  }
}
