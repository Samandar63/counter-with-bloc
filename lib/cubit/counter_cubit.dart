import 'package:bloc/bloc.dart';
import 'package:counter_app_bloc/cubit/counter_state.dart';


class CounterCubit extends Cubit<CounterState> {
  
  CounterCubit() : super(CounterState(counterValue: 0));

  // Functions
  void increment() => emit(CounterState(counterValue: state.counterValue! + 1, wasIncremented: true));
  void decrement() => emit(CounterState(counterValue: state.counterValue! - 1, wasIncremented: false));
}
