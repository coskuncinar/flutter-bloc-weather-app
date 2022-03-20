// To parse this JSON data, do
//
//     final weather = weatherFromJson(jsonString);

// ignore_for_file: unnecessary_null_in_if_null_operators, prefer_null_aware_operators

import 'dart:convert';

Weather weatherFromJson(String str) => Weather.fromJson(json.decode(str));

String weatherToJson(Weather data) => json.encode(data.toJson());

class Weather {
    Weather({
        this.consolidatedWeather,
        this.time,
        this.sunRise,
        this.sunSet,
        this.timezoneName,
        this.parent,
        this.sources,
        this.title,
        this.locationType,
        this.woeid,
        this.lattLong,
        this.timezone,
    });

    List<ConsolidatedWeather>? consolidatedWeather;
    DateTime? time;
    DateTime? sunRise;
    DateTime? sunSet;
    String? timezoneName;
    Parent? parent;
    List<Source>? sources;
    String? title;
    String? locationType;
    int? woeid;
    String? lattLong;
    String? timezone;

    factory Weather.fromJson(Map<String, dynamic> json) => Weather(
        consolidatedWeather: json["consolidated_weather"] == null ? null : List<ConsolidatedWeather>.from(json["consolidated_weather"].map((x) => ConsolidatedWeather.fromJson(x))),
        time: json["time"] == null ? null : DateTime.parse(json["time"]),
        sunRise: json["sun_rise"] == null ? null : DateTime.parse(json["sun_rise"]),
        sunSet: json["sun_set"] == null ? null : DateTime.parse(json["sun_set"]),
        timezoneName: json["timezone_name"] ?? null,
        parent: json["parent"] == null ? null : Parent.fromJson(json["parent"]),
        sources: json["sources"] == null ? null : List<Source>.from(json["sources"].map((x) => Source.fromJson(x))),
        title: json["title"] ?? null,
        locationType: json["location_type"] ?? null,
        woeid: json["woeid"] ?? null,
        lattLong: json["latt_long"] ?? null,
        timezone: json["timezone"] ?? null,
    );

    Map<String, dynamic> toJson() => {
        "consolidated_weather": consolidatedWeather == null ? null : List<dynamic>.from(consolidatedWeather!.map((x) => x.toJson())),
        "time": time == null ? null : time?.toIso8601String(),
        "sun_rise": sunRise == null ? null : sunRise?.toIso8601String(),
        "sun_set": sunSet == null ? null : sunSet?.toIso8601String(),
        "timezone_name": timezoneName ?? null,
        "parent": parent == null ? null : parent!.toJson(),
        "sources": sources == null ? null : List<dynamic>.from(sources!.map((x) => x.toJson())),
        "title": title ?? null,
        "location_type": locationType ?? null,
        "woeid": woeid ?? null,
        "latt_long": lattLong ?? null,
        "timezone": timezone ?? null,
    };
}

class ConsolidatedWeather {
    ConsolidatedWeather({
        this.id,
        this.weatherStateName,
        this.weatherStateAbbr,
        this.windDirectionCompass,
        this.created,
        this.applicableDate,
        this.minTemp,
        this.maxTemp,
        this.theTemp,
        this.windSpeed,
        this.windDirection,
        this.airPressure,
        this.humidity,
        this.visibility,
        this.predictability,
    });

    int? id;
    String? weatherStateName;
    String? weatherStateAbbr;
    String? windDirectionCompass;
    DateTime? created;
    DateTime? applicableDate;
    double? minTemp;
    double? maxTemp;
    double? theTemp;
    double? windSpeed;
    double? windDirection;
    double? airPressure;
    int? humidity;
    double? visibility;
    int? predictability;

    factory ConsolidatedWeather.fromJson(Map<String, dynamic> json) => ConsolidatedWeather(
        id: json["id"] ?? null,
        weatherStateName: json["weather_state_name"] ?? null,
        weatherStateAbbr: json["weather_state_abbr"] ?? null,
        windDirectionCompass: json["wind_direction_compass"] ?? null,
        created: json["created"] == null ? null : DateTime.parse(json["created"]),
        applicableDate: json["applicable_date"] == null ? null : DateTime.parse(json["applicable_date"]),
        minTemp: json["min_temp"] == null ? null : json["min_temp"].toDouble(),
        maxTemp: json["max_temp"] == null ? null : json["max_temp"].toDouble(),
        theTemp: json["the_temp"] == null ? null : json["the_temp"].toDouble(),
        windSpeed: json["wind_speed"] == null ? null : json["wind_speed"].toDouble(),
        windDirection: json["wind_direction"] == null ? null : json["wind_direction"].toDouble(),
        airPressure: json["air_pressure"] == null ? null : json["air_pressure"].toDouble(),
        humidity: json["humidity"] ?? null,
        visibility: json["visibility"] == null ? null : json["visibility"].toDouble(),
        predictability: json["predictability"] ?? null,
    );

    Map<String, dynamic> toJson() => {
        "id": id ?? null,
        "weather_state_name": weatherStateName ?? null,
        "weather_state_abbr": weatherStateAbbr ?? null,
        "wind_direction_compass": windDirectionCompass ?? null,
        "created": created == null ? null : created?.toIso8601String(),
        "applicable_date": applicableDate == null ? null : "${applicableDate!.year.toString().padLeft(4, '0')}-${applicableDate!.month.toString().padLeft(2, '0')}-${applicableDate!.day.toString().padLeft(2, '0')}",
        "min_temp": minTemp ?? null,
        "max_temp": maxTemp ?? null,
        "the_temp": theTemp ?? null,
        "wind_speed": windSpeed ?? null,
        "wind_direction": windDirection ?? null,
        "air_pressure": airPressure ?? null,
        "humidity": humidity ?? null,
        "visibility": visibility ?? null,
        "predictability": predictability ?? null,
    };
}

class Parent {
    Parent({
        this.title,
        this.locationType,
        this.woeid,
        this.lattLong,
    });

    String? title;
    String? locationType;
    int? woeid;
    String? lattLong;

    factory Parent.fromJson(Map<String, dynamic> json) => Parent(
        title: json["title"] ?? null,
        locationType: json["location_type"] ?? null,
        woeid: json["woeid"] ?? null,
        lattLong: json["latt_long"] ?? null,
    );

    Map<String, dynamic> toJson() => {
        "title": title ?? null,
        "location_type": locationType ?? null,
        "woeid": woeid ?? null,
        "latt_long": lattLong ?? null,
    };
}

class Source {
    Source({
        this.title,
        this.slug,
        this.url,
        this.crawlRate,
    });

    String? title;
    String? slug;
    String? url;
    int? crawlRate;

    factory Source.fromJson(Map<String, dynamic> json) => Source(
        title: json["title"] ?? null,
        slug: json["slug"] ?? null,
        url: json["url"] ?? null,
        crawlRate: json["crawl_rate"] ?? null,
    );

    Map<String, dynamic> toJson() => {
        "title": title ?? null,
        "slug": slug ?? null,
        "url": url ?? null,
        "crawl_rate": crawlRate ?? null,
    };
}
