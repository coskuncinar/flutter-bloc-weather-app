import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_myweatherapp/bloc/weather/weather_bloc.dart';
import 'package:flutter_myweatherapp/utils/constants_helper.dart';

class WeatherDetailWidget extends StatelessWidget {
  const WeatherDetailWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<WeatherBloc, WeatherState>(
      builder: (context, state) {
         var wet =
            (state as WeatherLoadedState).weather;
        var bugun =            wet.consolidatedWeather![0];
           
        return SizedBox(
          // decoration: BoxDecoration(
          //   color: Colors.grey.shade100,
          //   border: Border.all(
          //     color: Colors.grey.shade300,
          //     width: 1,
          //     style: BorderStyle.solid,
          //   ),
          //   borderRadius: const BorderRadius.all(
          //     Radius.circular(10),
          //   ),
          // ),
          height: 150,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Text(
                    "Max Heat : " +
                        bugun.maxTemp!
                            .toStringAsFixed(ConstantsHelper.globalDigit) +
                        " °C",
                    style: const TextStyle(fontSize: 15),
                  ),
                  Text(
                    "Min Heat : " +
                        bugun.minTemp!
                            .toStringAsFixed(ConstantsHelper.globalDigit) +
                        " °C",
                    style: const TextStyle(fontSize: 15),
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Text(
                    "State Name : " + bugun.weatherStateName!,
                    style: const TextStyle(fontSize: 15),
                  ),
                  Text(
                    "Direction Compass : " + bugun.windDirectionCompass!,
                    style: const TextStyle(fontSize: 15),
                  ),
                ],
              ),

              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Text(
                    "Country Name : " + wet.parent!.title!,
                    style: const TextStyle(fontSize: 15),
                  ),
                  Text(
                    "Timezone : " + wet.timezone!,
                    style: const TextStyle(fontSize: 15),
                  ),
                ],
              ),
            ],
          ),
        );
      },
    );
  }
}
