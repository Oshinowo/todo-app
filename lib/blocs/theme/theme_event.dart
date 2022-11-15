part of 'theme_bloc.dart';

abstract class ThemeEvent extends Equatable {
  const ThemeEvent();

  @override
  List<Object> get props => [];
}

class ChangeThemeEvent extends ThemeEvent {
  final int radInt;

  const ChangeThemeEvent(this.radInt);

  @override
  String toString() => 'ChangeThemeEvent(radInt: $radInt)';

  @override
  List<Object> get props => [radInt];
}
