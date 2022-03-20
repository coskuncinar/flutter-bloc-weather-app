import 'package:flutter_myweatherapp/service/weather_api_client.dart';
import 'package:flutter_myweatherapp/service/weather_repository.dart';
import 'package:get_it/get_it.dart';

GetIt locator = GetIt.instance;
void setupLocator() {
  locator.registerLazySingleton<WeatherRepository>(() => WeatherRepository());
  locator.registerLazySingleton<WeatherApiClient>(() => WeatherApiClient());
}
