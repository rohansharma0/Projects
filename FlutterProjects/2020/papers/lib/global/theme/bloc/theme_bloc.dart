import 'dart:async';

import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';

part 'theme_event.dart';
part 'theme_state.dart';

class ThemeBloc extends Bloc<ThemeEvent, ThemeState> {
  static final ThemeBloc _themeBlocSingleton = ThemeBloc._internal();

  ThemeBloc._internal();

  factory ThemeBloc() {
    return _themeBlocSingleton;
  }

  bool darkMode = false;

  @override
  ThemeState get initialState => ThemeInitial();

  @override
  Stream<ThemeState> mapEventToState(
    ThemeEvent event,
  ) async* {}
}
