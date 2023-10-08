import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:provider/provider.dart';

import '../provider/weather_provider.dart';

class WeatherAnimation extends StatelessWidget {
  final String currentWeather;
  const WeatherAnimation({
    super.key,
    required this.currentWeather,
  });

  @override
  Widget build(BuildContext context) {
    final isCurrentlyDay = Provider.of<WeatherProvider>(context).isCurrentlyDay;
    final String sunny = isCurrentlyDay
        ? 'assets/animations/sunny.json'
        : 'assets/animations/moon.json';
    final String cloudy = isCurrentlyDay
        ? 'assets/animations/cloudy.json'
        : 'assets/animations/nightcloudy.json';
    return Center(
      child: Lottie.asset(
        currentWeather.contains('Rain')
            ? 'assets/animations/rain.json'
            : currentWeather.contains('Clouds')
                ? cloudy
                : sunny,
        height: 130,
      ),
    );
  }
}
