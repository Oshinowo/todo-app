part of 'theme_cubit.dart';

enum AppTheme { light, dark }

class ThemeState extends Equatable {
  final AppTheme appTheme;

  const ThemeState({this.appTheme = AppTheme.light});

  factory ThemeState.initial() {
    return const ThemeState();
  }

  ThemeState copyWith({
    AppTheme? appTheme,
  }) {
    return const ThemeState();
  }

  @override
  bool get stringify => true;

  @override
  List<Object> get props => [appTheme];
}
