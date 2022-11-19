import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:todo_app/cubits/color/color_cubit.dart';

part 'counter_state.dart';

class CounterCubit extends Cubit<CounterState> {
  int increamentSize = 1;
  final ColorCubit colorCubit;
  late final StreamSubscription colorSubscription;

  CounterCubit({required this.colorCubit}) : super(CounterState.initial()) {
    colorSubscription = colorCubit.stream.listen((ColorState colorState) {
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
        emit(state.copyWith(counter: state.counter - 100));
        increamentSize = -100;
        return;
      }
    });
  }

  void changeCounter() {
    emit(state.copyWith(counter: state.counter + increamentSize));
  }

  @override
  Future<void> close() {
    colorSubscription.cancel();
    return super.close();
  }
}
