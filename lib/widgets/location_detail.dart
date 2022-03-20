import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_myweatherapp/bloc/weather/weather_bloc.dart';

class LocationDetailWidget extends StatelessWidget {
  const LocationDetailWidget({Key? key })
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<WeatherBloc, WeatherState>(
      builder: (context, state) {
        var title = (state as WeatherLoadedState).weather.title;

        return Text(
          title!,
          style: const TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 30,
          ),
        );
      },
    );
  }
}
