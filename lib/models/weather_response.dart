import 'package:weather_app/models/coordinate.dart';

import 'main_response_part.dart';
import 'sys.dart';
import 'weather.dart';
import 'wind.dart';

class WeatherResponse {
  Coordinate? coord;
  List<Weather>? weather;
  String? base;
  Main? main;
  int? visibility;
  Wind? wind;
  Clouds? clouds;
  int? dt;
  Sys? sys;
  int? timezone;
  int? id;
  String? name;
  int? cod;

  WeatherResponse({
    this.coord,
    this.weather,
    this.base,
    this.main,
    this.visibility,
    this.wind,
    this.clouds,
    this.dt,
    this.sys,
    this.timezone,
    this.id,
    this.name,
    this.cod,
  });

  WeatherResponse.fromJson(Map<String, dynamic> json) {
    coord = json['coord'] != null ? Coordinate.fromJson(json['coord']) : null;
    weather = json['weather'] != null
        ? (json['weather'] as List).map((i) => Weather.fromJson(i)).toList()
        : null;
    base = json['base'];
    main = json['main'] != null ? Main.fromJson(json['main']) : null;
    visibility = json['visibility'];
    wind = json['wind'] != null ? Wind.fromJson(json['wind']) : null;
    clouds = json['clouds'] != null ? Clouds.fromJson(json['clouds']) : null;
    dt = json['dt'];
    sys = json['sys'] != null ? Sys.fromJson(json['sys']) : null;
    timezone = json['timezone'];
    id = json['id'];
    name = json['name'];
    cod = json['cod'];
  }
}
