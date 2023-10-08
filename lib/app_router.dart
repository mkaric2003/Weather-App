import 'package:go_router/go_router.dart';
import 'package:weather_app/features/weather/screens/weather_screen.dart';
import 'package:weather_app/features/weather_detail/screens/weather_detail_screen.dart';
import 'package:weather_app/models/weather_response.dart';

final GoRouter router = GoRouter(routes: <GoRoute>[
  GoRoute(
    path: '/',
    builder: (context, state) => const HomeScreen(),
  ),
  GoRoute(
    path: '/weather-detail',
    name: '/weather-detail',
    builder: (context, state) => WeatherDetailScreen(
      weatherResponse: state.extra as WeatherResponse,
    ),
  ),
]);
