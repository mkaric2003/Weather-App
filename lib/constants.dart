import 'package:intl/intl.dart';

String kelvinToCelsius(double kelvin) {
  return (kelvin - 273.15).round().toString();
}

String unixTimestampToTime(int timestamp) {
  final dateTime = DateTime.fromMillisecondsSinceEpoch(timestamp * 1000);
  final formattedTime = DateFormat.Hm().format(dateTime); // HH:mm format
  return formattedTime;
}
