part of 'theme_bloc.dart';

abstract class ThemeState extends Equatable {
  const ThemeState();

  @override
  List<Object> get props => [];
}

class ThemeInitialState extends ThemeState {
  final ThemeData selectedTheme;
  final MaterialColor selectedColor;

  const ThemeInitialState(
      {required this.selectedTheme, required this.selectedColor});

  @override
  List<Object> get props => [selectedTheme, selectedColor];
}
