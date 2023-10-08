import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:weather_app/features/weather_detail/widgets/information_tile.dart';
import 'package:weather_app/models/weather_response.dart';
import 'package:weather_app/provider/weather_provider.dart';
import 'package:weather_app/widgets/background.dart';
import 'package:weather_app/widgets/weather_animation.dart';
import 'package:weather_app/constants.dart';

class WeatherDetailScreen extends StatelessWidget {
  final WeatherResponse weatherResponse;
  const WeatherDetailScreen({
    super.key,
    required this.weatherResponse,
  });

  @override
  Widget build(BuildContext context) {
    final weatherDesc = Provider.of<WeatherProvider>(context).weatherDesc ??
        Provider.of<WeatherProvider>(context).currentLocationWeatherDesc;
    return Background(
      content: Scaffold(
        backgroundColor: Colors.transparent,
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          title: Text(
            weatherResponse.name!,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 30,
              fontWeight: FontWeight.w600,
            ),
          ),
          leading: IconButton(
            icon: const Icon(
              Icons.arrow_back_ios,
              color: Colors.white,
              size: 30,
            ),
            onPressed: () => context.pop(),
          ),
        ),
        body: Container(
          padding: const EdgeInsets.symmetric(
            horizontal: 20,
            vertical: 30,
          ),
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 50),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    WeatherAnimation(currentWeather: weatherDesc!),
                    Text(
                      '${kelvinToCelsius(weatherResponse.main!.temp!)} °c',
                      style: const TextStyle(
                          color: Colors.white,
                          fontSize: 40,
                          fontWeight: FontWeight.w600),
                    ),
                    const SizedBox(height: 50),
                    InformationTile(
                      value1:
                          '${kelvinToCelsius(weatherResponse.main!.tempMin!)} °c',
                      value2:
                          '${kelvinToCelsius(weatherResponse.main!.tempMax!)} °c',
                      title1: 'MIN Temp',
                      title2: 'Max Temp',
                      icon1: buildIcon(Icons.thermostat),
                      icon2: buildIcon(Icons.thermostat),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    InformationTile(
                      value1: '${weatherResponse.main!.humidity!} %',
                      value2: '${weatherResponse.main!.pressure} hPa',
                      title1: 'Humidity',
                      title2: 'Pressure',
                      icon1: buildIcon(Icons.water),
                      icon2: buildIcon(Icons.trending_up),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    InformationTile(
                      value1: '${weatherResponse.wind!.speed} km/h',
                      value2: '${weatherResponse.wind!.deg} °',
                      title1: 'Wind Speed',
                      title2: 'Wind Direction',
                      icon1: buildIcon(Icons.wind_power),
                      icon2: buildIcon(Icons.navigation),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    InformationTile(
                      value1:
                          '${unixTimestampToTime(weatherResponse.sys!.sunrise!)} h',
                      value2:
                          '${unixTimestampToTime(weatherResponse.sys!.sunset!)} h',
                      title1: 'Sunrise',
                      title2: 'Sunset',
                      icon1: buildIcon(Icons.wb_sunny),
                      icon2: buildIcon(Icons.nightlight),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Icon buildIcon(IconData iconData) {
    return Icon(
      iconData,
      color: Colors.white,
      size: 40,
    );
  }
}
