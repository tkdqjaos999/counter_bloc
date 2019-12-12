import 'package:counter_bloc/src/bloc/counter_bloc.dart';
import 'package:counter_bloc/src/reciever_page.dart';
import 'package:flutter/material.dart';

class CounterPage extends StatefulWidget {
  @override
  _CounterPageState createState() => _CounterPageState();
}

class _CounterPageState extends State<CounterPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('counter bloc'),
          actions: <Widget>[
            IconButton(
                icon: Icon(Icons.send),
                onPressed: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => RecieverPage()));
                }),
          ],
        ),
        body: Center(
          child: StreamBuilder<int>(
              stream: counterBloc.counterStream,
              builder: (context, snapshot) {
                var count = 0;
                if (snapshot.hasData) count = snapshot.data;

                return Text(
                  '${count}',
                  textScaleFactor: 2.0,
                );
              }),
        ),
        floatingActionButton: Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: <Widget>[
            FloatingActionButton(
                heroTag: "btnPlus",
                child: Icon(Icons.add),
                onPressed: () {
                  counterBloc.plusOrMinusCounter(1);
                }),
            SizedBox(
              width: 10,
            ),
            FloatingActionButton(
                heroTag: "btnMinus",
                child: Icon(Icons.remove),
                onPressed: () {
                  counterBloc.plusOrMinusCounter(-1);
                }),
          ],
        ));
  }
}
