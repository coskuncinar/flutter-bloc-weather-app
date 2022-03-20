import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_myweatherapp/bloc/weather/weather_bloc.dart';
import 'package:intl/intl.dart';

class LastUpdateWidget extends StatelessWidget {
  const LastUpdateWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<WeatherBloc, WeatherState>(
      builder: (context, state) {
        var yeniTarih = (state as WeatherLoadedState).weather.time!.toLocal();
        return Column(
          children: [
            const Text(
              'Last Update',
              style: TextStyle(fontSize: 15, fontWeight: FontWeight.w500),
            ),
            const SizedBox(
              height: 2,
            ),
            Text(
              TimeOfDay.fromDateTime(yeniTarih).format(context) +
                  " " +
                  DateFormat.yMd().format(yeniTarih).toString(),
              style: const TextStyle(fontSize: 15, fontWeight: FontWeight.w500),
            ),
          ],
        );
      },
    );
  }
}
