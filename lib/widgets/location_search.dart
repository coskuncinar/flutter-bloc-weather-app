import 'package:flutter/material.dart';
import 'package:flutter_myweatherapp/service/locator.dart';
import 'package:flutter_myweatherapp/service/weather_api_client.dart';

import '../models/location.dart';

class LocationSearchWidget extends StatefulWidget {
  const LocationSearchWidget({Key? key}) : super(key: key);

  @override
  State<LocationSearchWidget> createState() => _LocationSearchWidgetState();
}

class _LocationSearchWidgetState extends State<LocationSearchWidget> {
  final _textController = TextEditingController();
  String get _text => _textController.text;
  List<Location> locationAll = [];
  WeatherApiClient weatherApiClient = locator<WeatherApiClient>();

  bool isLoading = false;

  _getUserList() async {
    setState(() {
      isLoading = true;
    });
    locationAll = await weatherApiClient.getLocationSearch(_text);
    setState(() {
      isLoading = false;
    });
  }

  void eleman() {
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("City Search"),
      ),
      body: Form(
        child: Column(
          children: [
            Row(
              children: [
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: TextFormField(
                      controller: _textController,
                      decoration: const InputDecoration(
                        labelText: "City",
                        hintText: "Istanbul",
                        border: OutlineInputBorder(),
                      ),
                    ),
                  ),
                ),
                IconButton(
                  key: const Key('searchPage_search_iconButton'),
                  onPressed: () async {
                    //Navigator.of(context).pop(_text);
                    _getUserList();
                  },
                  icon: const Icon(Icons.search),
                )
              ],
            ),
            Expanded(
              child: isLoading
                  ? const Center(
                      child: CircularProgressIndicator(),
                    )
                  : locationAll.isNotEmpty
                      ? ListView.builder(
                          itemCount: locationAll.length,
                          itemBuilder: (context, index) => Card(
                            key: ValueKey(locationAll[index].woeid),
                            color: (index + 1) % 2 == 0
                                ? Colors.amberAccent
                                : Colors.purple[200],
                            elevation: 4,
                            margin: const EdgeInsets.symmetric(vertical: 10),
                            child: ListTile(
                              leading: const Icon(Icons.location_searching),
                              title: Text(
                                locationAll[index].title!,
                                style: const TextStyle(fontSize: 24),
                              ),
                              subtitle: Text(
                                locationAll[index].woeid.toString(),
                                style: const TextStyle(fontSize: 12),
                              ),
                              trailing: const Icon(Icons.arrow_forward_ios),
                              onTap: () {
                                Navigator.of(context)
                                    .pop(locationAll[index].title.toString());
                              },
                            ),
                          ),
                        )
                      : const Text(
                          'No results found',
                          style: TextStyle(
                            fontSize: 20,
                          ),
                        ),
            ),
          ],
        ),
      ),
    );
  }
}
