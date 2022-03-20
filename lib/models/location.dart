// To parse this JSON data, do
//
//     final location = locationFromJson(jsonString);
// ignore_for_file: unnecessary_null_in_if_null_operators, prefer_null_aware_operators

import 'dart:convert';

List<Location> locationFromJson(String str) =>
    List<Location>.from(json.decode(str).map((x) => Location.fromJson(x)));

String locationToJson(List<Location> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Location {
  Location({
    this.title,
    this.locationType,
    this.woeid,
    this.lattLong,
  });

  String? title;
  String? locationType;
  int? woeid;
  String? lattLong;

  factory Location.fromJson(Map<String, dynamic> json) => Location(
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
