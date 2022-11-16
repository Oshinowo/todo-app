import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'theme_state.dart';

class ThemeCubit extends Cubit<ThemeState> {
  ThemeCubit() : super(ThemeState.initial());

  void onChangeAppState(int radInt) {
    if (radInt % 2 == 0) {
      emit(state.copyWith(appTheme: AppTheme.light));
      return;
    }
    emit(state.copyWith(appTheme: AppTheme.dark));
  }
}
