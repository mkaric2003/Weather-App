import 'package:flutter/material.dart';
import 'package:weather_app/widgets/weather_animation.dart';

class WeatherResult extends StatelessWidget {
  final String weatherDesription;
  final String currentTemperature;
  final String locationName;
  final String humidity;
  final String windSpeed;
  const WeatherResult({
    super.key,
    required this.weatherDesription,
    required this.currentTemperature,
    required this.locationName,
    required this.humidity,
    required this.windSpeed,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 50),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          WeatherAnimation(currentWeather: weatherDesription),
          Text(
            '$currentTemperature °c',
            style: const TextStyle(
                color: Colors.white, fontSize: 40, fontWeight: FontWeight.w600),
          ),
          Text(
            locationName,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 30,
              fontWeight: FontWeight.w500,
            ),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 30),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  const Icon(
                    Icons.water,
                    color: Colors.white,
                    size: 40,
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  Column(
                    children: [
                      Text(
                        '$humidity %',
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      const Text(
                        'Humidity',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 15,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              Row(
                children: [
                  const Icon(
                    Icons.wind_power,
                    color: Colors.white,
                    size: 35,
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  Column(
                    children: [
                      Text(
                        '$windSpeed km/h',
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      const Text(
                        'Wind Speed',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 15,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}
