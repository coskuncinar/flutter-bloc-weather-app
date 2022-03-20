import 'package:flutter_myweatherapp/service/locator.dart';
import 'package:flutter_myweatherapp/service/weather_api_client.dart';

import '../models/weather.dart';

class WeatherRepository {
  WeatherApiClient weatherApiClient = locator<WeatherApiClient>();

  Future<Weather> getWeather(String sehir) async {
    //debugPrint("geldi" + sehir);
    final int sehirID = await weatherApiClient.getLocationID(sehir);
    return await weatherApiClient.getWeather(sehirID);
  }
}
