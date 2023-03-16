part of 'theme_bloc.dart';

abstract class ThemeEvent extends Equatable {
  const ThemeEvent();
  Future<ThemeState> applyAsync({ThemeState currentState, ThemeBloc bloc});
}

class DarkModeEvent extends ThemeEvent {
  final bool darkOn;

  DarkModeEvent(this.darkOn);

  @override
  List<Object> get props => null;

  @override
  Future<ThemeState> applyAsync(
      {ThemeState currentState, ThemeBloc bloc}) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();

    try {
      bloc.darkMode = darkOn;
      prefs.setBool('darkModePrefs', darkOn);
      return InThemeState();
    } catch (e) {
      print(e);
    }

    return null;
  }
}
