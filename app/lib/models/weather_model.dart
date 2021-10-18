class Weather {
  Weather({
    required this.city,
    required this.country,
    required this.date,
    required this.weatherState,
    required this.minTemp,
    required this.maxTemp,
    required this.currentTemp,
    required this.alldays,
  });

  final String city;
  final String country;
  final String date;
  final String weatherState;
  final double minTemp;
  final double maxTemp;
  final double currentTemp;
  final List<NextDays> alldays;

  factory Weather.fromJson(Map<String, dynamic> json) {
    final allDaysdata = json['consolidated_weather'] as List;
    return Weather(
      country: json['parent']['title'],
      city: json['title'],
      date: json['consolidated_weather'][0]['applicable_date'],
      weatherState:
          json['consolidated_weather'][0]['weather_state_name'] as String,
      minTemp: json['consolidated_weather'][0]['min_temp'] as double,
      maxTemp: json['consolidated_weather'][0]['max_temp'] as double,
      currentTemp: json['consolidated_weather'][0]['the_temp'] as double,
      alldays: allDaysdata.map((e) => NextDays(
            weatherState: e['weather_state_name'] as String,
            date: e['applicable_date'] as String,
            maxTemp: e['max_temp'] as double,
            minTemp: e['min_temp'] as double,
          )).toList(),
    );
  }
}

class NextDays {
  NextDays({
    required this.weatherState,
    required this.date,
    required this.maxTemp,
    required this.minTemp,
  });

  String weatherState;
  String date;
  double maxTemp;
  double minTemp;
}