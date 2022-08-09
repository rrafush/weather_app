import 'package:weather_app/data/weather_service.dart';
import 'package:weather_app/domain/weather.dart';

class WeatherRepository {
  final WeatherService _service = WeatherService();

  Future<Weather> fetchWeather(String city) async {
    final locationId = await _service.getLocationId(city);
    final response = await _service.fetchWeather(locationId);
    return response.toDomain();
  }
}
