import 'package:mobx/mobx.dart';
import 'package:weather_app/data/weather_repository.dart';
import 'package:weather_app/domain/weather.dart';
import 'package:weather_app/presentation/weather_page/weather_page_ui_model.dart';

part 'search_controller.g.dart';

class SearchController = _SearchController with _$SearchController;

abstract class _SearchController with Store {
  WeatherRepository _repository = WeatherRepository();

  @observable
  String? errorFeedback;

  @observable
  WeatherPageUIModel uiModel = WeatherPageUIModel(null);

  @observable
  bool isLoading = false;

  @observable
  String? imageAsset;

  @action
  Future<Weather> getWeather(String city) async {
    isLoading = true;
    errorFeedback = null;
    try {
      final weather = await _repository.fetchWeather(city);
      uiModel = WeatherPageUIModel(weather);
      imageAsset = getAsset(weather);
      isLoading = false;
      errorFeedback = null;
      return weather;
    } catch (e) {
      errorFeedback = e.toString();
      isLoading = false;
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
    errorFeedback = null;
    uiModel = WeatherPageUIModel(null);
  }
}
