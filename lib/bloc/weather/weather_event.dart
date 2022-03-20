part of 'weather_bloc.dart';

abstract class WeatherEvent extends Equatable {
  const WeatherEvent();

  @override
  List<Object> get props => [];
}

class WeatherFetchEvent extends WeatherEvent {
  final String cityName;

  const WeatherFetchEvent({
    required this.cityName,
  });

  @override
  List<Object> get props => [cityName];
}

class WeatherRefreshEvent extends WeatherEvent {
  final String cityName;
  const WeatherRefreshEvent({required this.cityName});
  @override
  List<Object> get props => [cityName];
}
