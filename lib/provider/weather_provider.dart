import 'dart:convert';
import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'package:http/http.dart' as http;
import 'package:weather_app/models/weather_response.dart';

import '../firebase_options.dart';

class WeatherProvider extends ChangeNotifier {
  final String _baseUrl = 'https://api.openweathermap.org/data/2.5';
  bool isError = false;
  WeatherResponse? weatherResponse;
  String? weatherDesc;
  String? currentLocationWeatherDesc;
  WeatherResponse? currentLocationWeather;
  bool isCurrentlyDay = true;

  Future<void> getWeatherByCity(String city) async {
    final response = await http
        .get(Uri.parse('$_baseUrl/weather?q=$city&appid=$openWeatherMapToken'));
    if (response.statusCode == 200) {
      final Map<String, dynamic> jsonResponse = jsonDecode(response.body);
      weatherResponse = WeatherResponse.fromJson(jsonResponse);
      weatherDesc = weatherResponse!.weather![0].main;

      isError = false;
      notifyListeners();
    } else {
      log('Error fetching weather data: ${response.statusCode}');
      log('Error fetching weather data: ${response.body}');
      isError = true;
      notifyListeners();
    }
  }

  Future<WeatherResponse?> getWeatherByCurrentUserCity() async {
    final city = await getLocationName();
    final response = await http.get(Uri.parse(
        '$_baseUrl/weather?q=$city&appid=1148516082a7ded7f4891f93dfd38b57'));
    if (response.statusCode == 200) {
      final Map<String, dynamic> jsonResponse = jsonDecode(response.body);
      currentLocationWeather = WeatherResponse.fromJson(jsonResponse);
      currentLocationWeatherDesc = currentLocationWeather!.weather![0].main;
      isCurrentlyDay = isDayTime(currentLocationWeather!.sys!.sunrise!,
          currentLocationWeather!.sys!.sunset!);
      notifyListeners();
      return WeatherResponse.fromJson(jsonResponse);
    } else {
      log('Error fetching weather data: ${response.statusCode}');
      log('Error fetching weather data: ${response.body}');
      return null;
    }
  }

  Future<Position?> getCurrentUserLocation() async {
    LocationPermission permission;
    permission = await Geolocator.checkPermission();

    try {
      if (permission == LocationPermission.denied) {
        permission = await Geolocator.requestPermission();
        return await Geolocator.getCurrentPosition(
          desiredAccuracy: LocationAccuracy.best,
        );
      } else {
        return await Geolocator.getCurrentPosition(
          desiredAccuracy: LocationAccuracy.best,
        );
      }
    } catch (e) {
      log('Error getting current location: $e');
      return null;
    }
  }

  Future<String> getLocationName() async {
    try {
      final position = await getCurrentUserLocation();
      List<Placemark> placemarks = await placemarkFromCoordinates(
        position!.latitude,
        position.longitude,
      );
      if (placemarks.isNotEmpty) {
        Placemark placemark = placemarks[0];
        String locationName = placemark.locality!;
        return locationName;
      } else {
        return 'Unknown place';
      }
    } catch (e) {
      return 'Error getting location';
    }
  }

  bool isDayTime(int sunriseTime, int sunsetTime) {
    int currentTime = DateTime.now().millisecondsSinceEpoch;
    return currentTime >= sunriseTime && currentTime < sunsetTime;
  }
}
