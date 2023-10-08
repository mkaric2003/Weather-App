import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class ErrorState extends StatelessWidget {
  final String locationName;
  const ErrorState({
    super.key,
    required this.locationName,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Lottie.asset(
          'assets/animations/erroranimation.json',
          height: 150,
        ),
        Text(
          'We can‘t find $locationName \n Please type the location again',
          style: const TextStyle(
            color: Colors.white,
            fontSize: 20,
            fontWeight: FontWeight.w600,
          ),
          textAlign: TextAlign.center,
        ),
      ],
    );
  }
}
