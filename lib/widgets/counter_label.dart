import 'package:state_bloc_example/blocs/counter_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CounterLabel extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final counterBloc = BlocProvider.of<CounterBloc>(context);

    return Container(
      width: double.infinity,
      color: Colors.blue,
      padding: EdgeInsets.all(10),
      child: Column(children: [
 
        TextButton(
          style: TextButton.styleFrom(
            primary: Colors.white,
            backgroundColor: Colors.teal,
            onSurface: Colors.grey,
          ),
          onPressed: (){
            counterBloc.add(CounterEvents.reset);
          }, 
          child: Text('reset')
        )
      ],),
    );
  }
}