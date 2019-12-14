import 'package:counter_bloc/src/bloc/bloc.dart';
import 'package:counter_bloc/src/bloc/counter_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class RecieverPage extends StatefulWidget {
  @override
  _RecieverPageState createState() => _RecieverPageState();
}

class _RecieverPageState extends State<RecieverPage> {
  @override
  void didChangeDependencies() {
    // TODO: implement didChangeDependencies
    super.didChangeDependencies();
    BlocProvider.of<CounterBloc>(context)..add(GetCount());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('read bloc'),
      ),
      body: Container(
        padding: EdgeInsets.symmetric(horizontal: 16.0),
        alignment: Alignment.center,
        child: BlocBuilder<CounterBloc, CounterState>(
          builder: (context, state){
            if(state is Counted){
              return Text('${state.count}', textScaleFactor: 2.0,);
            }
          },
        ),
      ),
    );
  }
}
