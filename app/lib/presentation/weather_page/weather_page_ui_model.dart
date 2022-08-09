import 'package:weather_app/domain/next_days.dart';
import 'package:weather_app/domain/weather.dart';

class WeatherPageUIModel {
  final Weather? weather;

  const WeatherPageUIModel(this.weather);

  bool get hasContent => weather != null;

  String get city => weather?.city.replaceAll('£', '') ?? '';

  String get country => weather?.country ?? '';

  String get currentTemp => weather?.currentTemp.toStringAsFixed(0) ?? '';

  String get minTemp => weather?.minTemp.toStringAsFixed(0) ?? '';

  String get maxTemp => weather?.maxTemp.toStringAsFixed(0) ?? '';

  String get weatherState => weather?.weatherState ?? '';

  List<NextDays> get allDays => weather?.allDays ?? [];
}
