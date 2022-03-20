part of 'theme_bloc.dart';

abstract class ThemeEvent extends Equatable {
  const ThemeEvent();

  @override
  List<Object> get props => [];
}

class ThemaChangeEvent extends ThemeEvent {
  final String weatherStateAbbr;

  const ThemaChangeEvent({
    required this.weatherStateAbbr,
  });

  @override
  List<Object> get props => [weatherStateAbbr];
}
