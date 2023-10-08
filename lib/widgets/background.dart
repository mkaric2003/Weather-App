import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:weather_app/provider/weather_provider.dart';

class Background extends StatelessWidget {
  final Widget content;
  const Background({
    super.key,
    required this.content,
  });

  @override
  Widget build(BuildContext context) {
    final weatherProvider = Provider.of<WeatherProvider>(context);
    return Container(
      height: MediaQuery.of(context).size.height,
      width: MediaQuery.of(context).size.width,
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage(weatherProvider.isCurrentlyDay
              ? 'assets/images/skyDay.jpeg'
              : 'assets/images/skyNight.jpg'),
          fit: BoxFit.cover,
        ),
      ),
      child: content,
    );
  }
}
