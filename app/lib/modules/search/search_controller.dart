import 'package:mobx/mobx.dart';
import 'package:weather_app/modules/search/repositories/weather_api_client.dart';

import '../../models/weather_model.dart';

part 'search_controller.g.dart';


class SearchController = _SearchController with _$SearchController;

abstract class _SearchController with Store {
  WeatherApiClient apiClient = WeatherApiClient();

  @observable
  Weather? response;

  @observable
  String? error;

  @observable
  String? cityFormatted;

  @observable
  String? currentTempFormatted;

  @observable
  String? maxTempFormatted;

  @observable
  String? minTempFormatted;

  @observable
  bool isSearching = false;

  @observable
  String? imageAsset;

  @action
  Future<Weather> getWeather(String city) async {
    isSearching = true;
    try {
      final locationId = await apiClient.getLocationId(city);
      final weather = await apiClient.fetchWeather(locationId);
      response = weather;
      imageAsset = getAsset(weather);
      cityFormatted = response!.city.replaceAll('£', '');
      currentTempFormatted = response!.currentTemp.toStringAsFixed(0);
      minTempFormatted = response!.minTemp.toStringAsFixed(0);
      maxTempFormatted = response!.maxTemp.toStringAsFixed(0);
      isSearching = false;
      error = null;
      return weather;
    } catch (e) {
      error = e.toString();
      response = null;
      isSearching = false;
      throw e;
    }
  }

  @action
  String getAsset(Weather weather) {
    final String asset;

    switch (weather.weatherState) {
      case 'Snow':
        asset = 'assets/snow.png';
        break;
      case 'Sleet':
        asset = 'assets/sleet.png';
        break;
      case 'Hail':
        asset = 'assets/hail.png';
        break;
      case 'Thunderstorm':
        asset = 'assets/thunderstorm.png';
        break;
      case 'Heavy Rain':
        asset = 'assets/heavy_rain.png';
        break;
      case 'Light Rain':
        asset = 'assets/light_rain.png';
        break;
      case 'Showers':
        asset = 'assets/showers.png';
        break;
      case 'Heavy Cloud':
        asset = 'assets/heavy_cloud.png';
        break;
      case 'Light Cloud':
        asset = 'assets/light_cloud.png';
        break;
      case 'Clear':
        asset = 'assets/clear.png';
        break;
      default:
        asset = 'assets/light_cloud.png';
    }
    return asset;
  }

  @action
  void clearSearch() {
    error = null;
    response = null;
  }
}
