import 'package:weather_app/domain/next_days.dart';

class Weather {
  final String city;
  final String country;
  final String date;
  final String weatherState;
  final double minTemp;
  final double maxTemp;
  final double currentTemp;
  final List<NextDays> allDays;

  const Weather({
    required this.city,
    required this.country,
    required this.date,
    required this.weatherState,
    required this.minTemp,
    required this.maxTemp,
    required this.currentTemp,
    required this.allDays,
  });
}
