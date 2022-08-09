import 'package:weather_app/data/model/next_days_response.dart';
import 'package:weather_app/domain/weather.dart';

class WeatherResponse {
  final String city;
  final String country;
  final String date;
  final String weatherState;
  final double minTemp;
  final double maxTemp;
  final double currentTemp;
  final List<NextDaysResponse> allDays;

  const WeatherResponse({
    required this.city,
    required this.country,
    required this.date,
    required this.weatherState,
    required this.minTemp,
    required this.maxTemp,
    required this.currentTemp,
    required this.allDays,
  });

  factory WeatherResponse.fromJson(Map<String, dynamic> json) {
    final allDaysResponse = json['consolidated_weather'] as List;
    return WeatherResponse(
      country: json['parent']['title'],
      city: json['title'],
      date: json['consolidated_weather'][0]['applicable_date'],
      weatherState:
          json['consolidated_weather'][0]['weather_state_name'] as String,
      minTemp: json['consolidated_weather'][0]['min_temp'] as double,
      maxTemp: json['consolidated_weather'][0]['max_temp'] as double,
      currentTemp: json['consolidated_weather'][0]['the_temp'] as double,
      allDays: allDaysResponse
          .map((day) => NextDaysResponse.fromJson(day))
          .toList(growable: false),
    );
  }

  Weather toDomain() => Weather(
        city: city,
        country: country,
        date: date,
        weatherState: weatherState,
        minTemp: minTemp,
        maxTemp: maxTemp,
        currentTemp: currentTemp,
        allDays: allDays.map((day) => day.toDomain()).toList(growable: false),
      );
}
