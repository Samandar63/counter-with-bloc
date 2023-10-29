
import 'package:equatable/equatable.dart';

class CounterState extends Equatable {
  
  int? counterValue;
  bool? wasIncremented;

  CounterState({
    this.counterValue,
    this.wasIncremented,
    });
    
      @override
      // TODO: implement props
      List<Object?> get props => [this.counterValue, this.wasIncremented];
}
