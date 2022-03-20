import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_myweatherapp/bloc/theme/theme_bloc.dart';
import 'package:flutter_myweatherapp/bloc/weather/weather_bloc.dart';
import 'package:flutter_myweatherapp/service/locator.dart';

import 'pages/home_page.dart';

void main() {
  setupLocator();
  runApp(BlocProvider(
    create: (context) => ThemeBloc(),
    child: const MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ThemeBloc, ThemeState>(
      builder: (context, state) {
        return MaterialApp(
          title: "Weather App",
          debugShowCheckedModeBanner: false,
          theme: (state as ThemeInitialState).selectedTheme,
          home: BlocProvider(
            create: (context) => WeatherBloc()
              ..add(const WeatherFetchEvent(cityName: "Istanbul")),
            child: HomePage(),
          ),
        );
      },
    );
  }
}
