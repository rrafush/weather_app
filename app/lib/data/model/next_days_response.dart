import 'package:weather_app/domain/next_days.dart';

class NextDaysResponse {
  final String weatherState;
  final String date;
  final double maxTemp;
  final double minTemp;

  const NextDaysResponse({
    required this.weatherState,
    required this.date,
    required this.maxTemp,
    required this.minTemp,
  });

  factory NextDaysResponse.fromJson(Map<String, dynamic> json) =>
      NextDaysResponse(
        weatherState: json['weather_state_name'] as String,
        date: json['applicable_date'] as String,
        maxTemp: json['max_temp'] as double,
        minTemp: json['min_temp'] as double,
      );

  NextDays toDomain() => NextDays(
        weatherState: weatherState,
        date: date,
        maxTemp: maxTemp,
        minTemp: minTemp,
      );
}
