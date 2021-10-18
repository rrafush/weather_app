import 'dart:convert';

import 'package:http/http.dart' as http;

import '../../../models/weather_model.dart';

class WeatherApiClient {
  static const baseUrl = 'https://www.metaweather.com/api';

  Future<int> getLocationId(String city) async {
    final locationUrl = Uri.parse('$baseUrl/location/search/?query=$city');
    final locationResponse = await http.get(locationUrl);
    if (locationResponse.statusCode != 200) {
      throw Exception(
          "I'm sorry, I wasn't able to find '$city', could you possibly have misspelled something?");
    }
    final locationJson = jsonDecode(locationResponse.body) as List;
    if (locationJson.isEmpty) {
      throw Exception(
          "Oops, there's no data here for '$city', I'm really sorry!");
    }
    return locationJson.first['woeid'] as int;
  }

  Future<Weather> fetchWeather(int locationId) async {
    final weatherUrl = Uri.parse('$baseUrl/location/$locationId');
    final weatherResponse = await http.get(weatherUrl);
    if (weatherResponse.statusCode != 200) {
      throw Exception(
          'There seems to be a problem in obtaining the data for this city. Please try again. If the error persists, do not hesitate to contact me!');
    }
    final weatherJson = jsonDecode(weatherResponse.body);
    final consolidatedWeather = weatherJson as Map<String, dynamic>;

    final weather = Weather.fromJson(consolidatedWeather);
    return weather;
  }
}
