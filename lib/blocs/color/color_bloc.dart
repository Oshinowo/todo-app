import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

part 'color_event.dart';
part 'color_state.dart';

class ColorBloc extends Bloc<ColorEvent, ColorState> {
  ColorBloc() : super(ColorState.initial()) {
    on<ChangeColorEvent>(_onChangeColor);
  }

  void _onChangeColor(ChangeColorEvent event, Emitter<ColorState> emit) {
    if (state.color == Colors.red) {
      emit(state.copyWith(color: Colors.green));
      return;
    }
    if (state.color == Colors.green) {
      emit(state.copyWith(color: Colors.blue));
      return;
    }
    if (state.color == Colors.blue) {
      emit(state.copyWith(color: Colors.black));
      return;
    }
    if (state.color == Colors.black) {
      emit(state.copyWith(color: Colors.red));
      return;
    }
  }
}
