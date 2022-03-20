import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_myweatherapp/bloc/weather/weather_bloc.dart';
import 'package:flutter_myweatherapp/utils/constants_helper.dart';

class WeatherImageWidget extends StatelessWidget {
  const WeatherImageWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<WeatherBloc, WeatherState>(
      builder: (context, state) {
        return Column(
          children: <Widget>[
            Text(
              (state as WeatherLoadedState)
                      .weather
                      .consolidatedWeather![0]
                      .theTemp!
                      .toStringAsFixed(ConstantsHelper.globalDigit) +
                  //.floor().toString() +

                  " ℃",
              style: const TextStyle(fontSize: 50, fontWeight: FontWeight.bold),
            ),
            Image.network(
              "https://www.metaweather.com/static/img/weather/png/" +
                  (state).weather.consolidatedWeather![0].weatherStateAbbr! +
                  ".png",
              width: 140,
              height: 140,
            )
          ],
        );
      },
    );
  }
}
