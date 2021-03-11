import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:state_bloc_example/widgets/counter_label.dart';
import '../blocs/counter_bloc.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  final CounterBloc _counterBloc = CounterBloc(80);

  @override
  void dispose() {
    _counterBloc.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider.value(
      value: _counterBloc,
      child: Scaffold(
        body: Container(
          height: double.infinity,
          width: double.infinity,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
            BlocBuilder<CounterBloc, int>(
            builder: (_, state){
              return Text("Counter is $state");
            },
            ),
            CounterLabel()
          ],),
        ),
        floatingActionButton: Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            FloatingActionButton(
              heroTag: 'increment',
              onPressed: (){
                _counterBloc.add(CounterEvents.increment);
              },
              child: Icon(Icons.add)
            ),
            FloatingActionButton(
              heroTag: 'decrement',
              onPressed: (){
                _counterBloc.add(CounterEvents.decrement);
              },
              child: Icon(Icons.remove)
            ),
            FloatingActionButton(
              heroTag: 'reset',
              onPressed: (){
                _counterBloc.add(CounterEvents.reset);
              }, 
              child: Icon(Icons.restore)
            )
        ],),
      ),
    );
  }
}