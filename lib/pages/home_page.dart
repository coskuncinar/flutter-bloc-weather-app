import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_myweatherapp/bloc/theme/theme_bloc.dart';
import 'package:flutter_myweatherapp/bloc/weather/weather_bloc.dart';
import 'package:flutter_myweatherapp/widgets/home_page_color.dart';

import '../widgets/location_search.dart';
import '../widgets/last_update.dart';
import '../widgets/location_detail.dart';
import '../widgets/weather_detail.dart';
import '../widgets/weather_image.dart';

// ignore: must_be_immutable
class HomePage extends StatelessWidget {
  HomePage({Key? key}) : super(key: key);

  String enterCityName = "Istanbul";
  Completer<void> completer = Completer<void>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Weather App"),
        actions: [
          IconButton(
            onPressed: () async {
              final String? shouldRefresh = await Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const LocationSearchWidget(),
                ),
              );
              if (shouldRefresh != null) {
                context
                    .read<WeatherBloc>()
                    .add(WeatherFetchEvent(cityName: shouldRefresh));
              }
            },
            icon: const Icon(Icons.search),
          ),
        ],
      ),
      body: Center(
        child: BlocBuilder<WeatherBloc, WeatherState>(
          builder: (context, state) {
            if (state is WeatherInitialState) {
              return const Center(
                child: Text("Şehir Seçiniz"),
              );
            } else if (state is WeatherLoadingState) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            } else if (state is WeatherLoadedState) {
              var _weatherStateAbbr =
                  state.weather.consolidatedWeather![0].weatherStateAbbr;

              enterCityName = state.weather.title!;
              context
                  .read<ThemeBloc>()
                  .add(ThemaChangeEvent(weatherStateAbbr: _weatherStateAbbr!));

              completer.complete();
              completer = Completer<void>();

              return BlocBuilder<ThemeBloc, ThemeState>(
                builder: (context, stateThema) {
                  return HomePageColorWidget(
                    childColor: (stateThema as ThemeInitialState).selectedColor,
                    childWidget: RefreshIndicator(
                      onRefresh: () async {
                        completer.future; 
                        context
                            .read<WeatherBloc>()
                            .add(WeatherRefreshEvent(cityName: enterCityName));
                      },
                      child: ListView(
                        children: const [
                          Padding(
                            padding: EdgeInsets.all(8.0),
                            child: Center(
                              child: LocationDetailWidget(),
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.all(8.0),
                            child: Center(
                              child: LastUpdateWidget(),
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.all(8.0),
                            child: Center(
                              child: WeatherImageWidget(),
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.all(8.0),
                            child: Center(
                              child: WeatherDetailWidget(),
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                },
              );
            } else {
              return const Center(
                child: Text('Something went wrong.'),
              );
            }
          },
        ),
      ),
    );
  }
}
