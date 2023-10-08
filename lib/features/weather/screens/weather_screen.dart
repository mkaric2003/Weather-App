import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:weather_app/constants.dart';
import 'package:weather_app/provider/weather_provider.dart';
import 'package:weather_app/widgets/background.dart';
import 'package:weather_app/features/weather/widgets/custom_search_textfield.dart';
import 'package:weather_app/features/weather/widgets/error_state.dart';
import 'package:weather_app/features/weather/widgets/weather_result.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final searchController = TextEditingController();
  final FirebaseAnalytics analytics = FirebaseAnalytics.instance;
  @override
  void initState() {
    super.initState();
    final weatherProvider =
        Provider.of<WeatherProvider>(context, listen: false);
    weatherProvider.getWeatherByCurrentUserCity();
  }

  @override
  Widget build(BuildContext context) {
    final weatherProvider = Provider.of<WeatherProvider>(context);
    return Background(
      content: Scaffold(
        backgroundColor: Colors.transparent,
        appBar: AppBar(
          backgroundColor: Colors.black38,
          title: CustomSearchTextField(
            searchController: searchController,
            labelName: 'Search Location',
            searchSubmit: () => weatherProvider
                .getWeatherByCity(searchController.text)
                .then(
                    (_) => analytics.logEvent(name: 'search_city', parameters: {
                          'city': searchController.text,
                        })),
          ),
        ),
        body: Container(
          padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 30),
          child: Center(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                weatherProvider.isError
                    ? ErrorState(locationName: searchController.text)
                    : weatherProvider.weatherResponse == null
                        ? weatherProvider.currentLocationWeather == null
                            ? const CircularProgressIndicator()
                            : WeatherResult(
                                weatherDesription:
                                    weatherProvider.currentLocationWeatherDesc!,
                                currentTemperature: kelvinToCelsius(
                                    weatherProvider
                                        .currentLocationWeather!.main!.temp!),
                                locationName: weatherProvider
                                    .currentLocationWeather!.name!,
                                humidity: weatherProvider
                                    .currentLocationWeather!.main!.humidity!
                                    .toString(),
                                windSpeed: weatherProvider
                                    .currentLocationWeather!.wind!.speed
                                    .toString(),
                              )
                        : WeatherResult(
                            weatherDesription: weatherProvider.weatherDesc!,
                            currentTemperature: kelvinToCelsius(
                                weatherProvider.weatherResponse!.main!.temp!),
                            locationName:
                                weatherProvider.weatherResponse!.name!,
                            humidity: weatherProvider
                                .weatherResponse!.main!.humidity!
                                .toString(),
                            windSpeed: weatherProvider
                                .weatherResponse!.wind!.speed
                                .toString(),
                          ),
                !weatherProvider.isError
                    ? ElevatedButton(
                        onPressed: () {
                          context.pushNamed(
                            '/weather-detail',
                            extra: weatherProvider.weatherResponse ??
                                weatherProvider.currentLocationWeather,
                          );
                        },
                        child: const Text('Check for details'),
                      )
                    : const SizedBox.shrink(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
