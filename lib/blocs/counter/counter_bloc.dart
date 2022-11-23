import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:todo_app/blocs/color/color_bloc.dart';

part 'counter_event.dart';
part 'counter_state.dart';

class CounterBloc extends Bloc<CounterEvent, CounterState> {
  int increamentSize = 1;
  final ColorBloc colorBloc;
  late final StreamSubscription colorSubscription;

  CounterBloc({required this.colorBloc}) : super(CounterState.initial()) {
    colorSubscription = colorBloc.stream.listen((ColorState colorState) {
      if (colorState.color == Colors.red) {
        increamentSize = 1;
        return;
      }
      if (colorState.color == Colors.green) {
        increamentSize = 10;
        return;
      }
      if (colorState.color == Colors.blue) {
        increamentSize = 100;
        return;
      }
      if (colorState.color == Colors.black) {
        // emit(state.copyWith(counter: state.counter - 100));
        add(ChangeCounterEvent());
        increamentSize = -100;
        return;
      }
    });

    on<ChangeCounterEvent>((event, emit) {
      emit(state.copyWith(counter: state.counter + increamentSize));
    });
  }

  @override
  Future<void> close() {
    colorSubscription.cancel();
    return super.close();
  }
}
