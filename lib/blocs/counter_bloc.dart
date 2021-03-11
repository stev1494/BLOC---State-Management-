import 'package:bloc/bloc.dart';


enum CounterEvents { increment, decrement, reset }

class CounterBloc extends Bloc<CounterEvents, int> {
  CounterBloc(int initialState) : super(initialState);


  @override
  Stream<int> mapEventToState(CounterEvents event) async* { 
    int counter = this.state;
    if( event == CounterEvents.increment) {
      counter++;
    } else if( event == CounterEvents.decrement) {
      counter--;
    } else {
      counter = 80;
    }

    yield counter;
  }

}