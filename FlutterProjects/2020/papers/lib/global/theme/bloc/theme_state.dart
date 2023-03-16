part of 'theme_bloc.dart';

abstract class ThemeState extends Equatable {
  const ThemeState();

  ThemeState getStateCopy();
}

class ThemeInitial extends ThemeState {
  @override
  List<Object> get props => [];

  @override
  ThemeState getStateCopy() {
    return ThemeInitial();
  }
}

class UnThemeState extends ThemeState {
  @override
  List<Object> get props => null;

  @override
  ThemeState getStateCopy() {
    return UnThemeState();
  }
}

class InThemeState extends ThemeState {
  @override
  ThemeState getStateCopy() {
    return InThemeState();
  }

  @override
  List<Object> get props => null;
}
