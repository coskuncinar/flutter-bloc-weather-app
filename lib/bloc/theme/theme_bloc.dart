 import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

part 'theme_event.dart';
part 'theme_state.dart';

class ThemeBloc extends Bloc<ThemeEvent, ThemeState> {
  ThemeBloc()
      : super(ThemeInitialState(
            selectedTheme: ThemeData.light(), selectedColor: Colors.indigo)) {
    on<ThemeEvent>(_changeTheme);
  }

  void _changeTheme(ThemeEvent event, Emitter<ThemeState> emit) {
    if (event is ThemaChangeEvent) {
      switch (event.weatherStateAbbr) {
        case "sn": 
        case "sl": 
        case "h": 
        case "t": 
        case "hc": 

          emit(ThemeInitialState(
              selectedTheme: ThemeData(primarySwatch: Colors.blueGrey),
              selectedColor: Colors.grey));
          break;

        case "hr":
        case "lr":
        case "s":
          emit(ThemeInitialState(
              selectedTheme: ThemeData(primarySwatch: Colors.indigo),
              selectedColor: Colors.indigo));
          break;

        case "lc":
        case "c":
          emit(ThemeInitialState(
              selectedTheme: ThemeData(primarySwatch: Colors.orange),
              selectedColor: Colors.yellow));
          break;
      }
    }
  }
}
