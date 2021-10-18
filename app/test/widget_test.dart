// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility that Flutter provides. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

import 'package:flutter_test/flutter_test.dart';

import 'package:weather_app/modules/search/repositories/weather_api_client.dart';

void main() {
  test('Should return type int when passed a valid city name', () async{
    await WeatherApiClient().getLocationId('London');
    int result = await WeatherApiClient().getLocationId('London');
    expect(result, 44418);
  });
}
