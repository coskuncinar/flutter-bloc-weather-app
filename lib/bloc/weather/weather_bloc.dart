import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import '../../models/weather.dart';
import '../../service/locator.dart';
import '../../service/weather_repository.dart';

part 'weather_event.dart';
part 'weather_state.dart';

class WeatherBloc extends Bloc<WeatherEvent, WeatherState> {
  final WeatherRepository repo = locator.get<WeatherRepository>();

  WeatherBloc() : super(WeatherInitialState()) {
    on<WeatherFetchEvent>(_onFetchWeather);
    on<WeatherRefreshEvent>(_onRefreshWeather); 
  }

  void _onFetchWeather(
      WeatherFetchEvent event, Emitter<WeatherState> emit) async {
    emit(WeatherLoadingState());
    try {
      final Weather weather = await repo.getWeather(event.cityName);
      emit(WeatherLoadedState(weather: weather));
    } catch (_) {
      emit(WeatherErrorState());
    }
  }

  void _onRefreshWeather(
      WeatherRefreshEvent event, Emitter<WeatherState> emit) async {
    try {
      final Weather weather = await repo.getWeather(event.cityName);
      emit(WeatherLoadedState(weather: weather));
    } catch (_) {
      emit(state);
    }
  }
}
