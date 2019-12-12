import 'package:counter_bloc/src/bloc/counter_bloc.dart';
import 'package:flutter/material.dart';

class RecieverPage extends StatefulWidget {
  @override
  _RecieverPageState createState() => _RecieverPageState();
}

class _RecieverPageState extends State<RecieverPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('read bloc'),
      ),
      body: Center(
        child: StreamBuilder<int>(
          stream: counterBloc.counterStream,
          builder: (context, snapshot) {
            var count = 0;
            if(snapshot.hasData)
              count = snapshot.data;
            else
              counterBloc.addCurrentCounter;

            return Text('${count}', textScaleFactor: 2.0,);
          }
        ),
      ),
    );
  }
}
