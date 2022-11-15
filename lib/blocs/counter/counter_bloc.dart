import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'counter_event.dart';
part 'counter_state.dart';

class CounterBloc extends Bloc<CounterEvent, CounterState> {
  CounterBloc() : super(CounterState.initial()) {
    on<IncreamentCounterEvent>((event, emit) {
      emit(state.copyWith(counter: state.counter + 1));
    });

    on<DecreamentCounterEvent>(_decreamentCounter);
  }

  void _decreamentCounter(
      DecreamentCounterEvent event, Emitter<CounterState> emit) {
    emit(state.copyWith(counter: state.counter - 1));
  }
}
