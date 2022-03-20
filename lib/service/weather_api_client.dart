import 'package:flutter_myweatherapp/models/location.dart';
import 'package:flutter_myweatherapp/models/weather.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class WeatherApiClient {
  static const baseUrl = "https://www.metaweather.com";
  final http.Client httpClient = http.Client();

  Future<int> getLocationID(String sehirAdi) async {
    final searhUrl = baseUrl + "/api/location/search/?query=" + sehirAdi;
    final response = await httpClient.get(Uri.parse(searhUrl));

    if (response.statusCode != 200) {
      throw Exception("Not Response City!");
    }

    //final responseJson = (jsonDecode(response.body)) as List;
    final responseJson = jsonDecode(response.body).cast<Map<String, dynamic>>();
    final city =
        responseJson.map<Location>((json) => Location.fromJson(json)).toList();
    return city[0].woeid!;
  }

  Future<List<Location>> getLocationSearch(String cityName) async {
    final searhUrl = baseUrl + "/api/location/search/?query=" + cityName;
    final response = await httpClient.get(Uri.parse(searhUrl));

    if (response.statusCode != 200) {
      throw Exception("Not Response City!");
    }
     String body = utf8.decode(response.bodyBytes);
  
     

    //final responseJson = (jsonDecode(response.body)) as List;
    final responseJson = jsonDecode(body).cast<Map<String, dynamic>>();
    return responseJson
        .map<Location>((json) => Location.fromJson(json))
        .toList();
  }

  Future<Weather> getWeather(int locationID) async {
    final locationUrl = baseUrl + "/api/location/$locationID";
    final response = await httpClient.get(Uri.parse(locationUrl));
    if (response.statusCode != 200) {
      throw Exception("No Response Location");
    }
    String body = utf8.decode(response.bodyBytes);
    final responseJson = jsonDecode(body);
    return Weather.fromJson(responseJson);
  }
}
