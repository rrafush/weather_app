// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'search_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$SearchController on _SearchController, Store {
  late final _$responseAtom =
      Atom(name: '_SearchController.response', context: context);

  @override
  WeatherResponse? get response {
    _$responseAtom.reportRead();
    return super.response;
  }

  @override
  set response(WeatherResponse? value) {
    _$responseAtom.reportWrite(value, super.response, () {
      super.response = value;
    });
  }

  late final _$errorAtom =
      Atom(name: '_SearchController.error', context: context);

  @override
  String? get error {
    _$errorAtom.reportRead();
    return super.error;
  }

  @override
  set error(String? value) {
    _$errorAtom.reportWrite(value, super.error, () {
      super.error = value;
    });
  }

  late final _$cityFormattedAtom =
      Atom(name: '_SearchController.cityFormatted', context: context);

  @override
  String? get cityFormatted {
    _$cityFormattedAtom.reportRead();
    return super.cityFormatted;
  }

  @override
  set cityFormatted(String? value) {
    _$cityFormattedAtom.reportWrite(value, super.cityFormatted, () {
      super.cityFormatted = value;
    });
  }

  late final _$currentTempFormattedAtom =
      Atom(name: '_SearchController.currentTempFormatted', context: context);

  @override
  String? get currentTempFormatted {
    _$currentTempFormattedAtom.reportRead();
    return super.currentTempFormatted;
  }

  @override
  set currentTempFormatted(String? value) {
    _$currentTempFormattedAtom.reportWrite(value, super.currentTempFormatted,
        () {
      super.currentTempFormatted = value;
    });
  }

  late final _$maxTempFormattedAtom =
      Atom(name: '_SearchController.maxTempFormatted', context: context);

  @override
  String? get maxTempFormatted {
    _$maxTempFormattedAtom.reportRead();
    return super.maxTempFormatted;
  }

  @override
  set maxTempFormatted(String? value) {
    _$maxTempFormattedAtom.reportWrite(value, super.maxTempFormatted, () {
      super.maxTempFormatted = value;
    });
  }

  late final _$minTempFormattedAtom =
      Atom(name: '_SearchController.minTempFormatted', context: context);

  @override
  String? get minTempFormatted {
    _$minTempFormattedAtom.reportRead();
    return super.minTempFormatted;
  }

  @override
  set minTempFormatted(String? value) {
    _$minTempFormattedAtom.reportWrite(value, super.minTempFormatted, () {
      super.minTempFormatted = value;
    });
  }

  late final _$isSearchingAtom =
      Atom(name: '_SearchController.isSearching', context: context);

  @override
  bool get isSearching {
    _$isSearchingAtom.reportRead();
    return super.isSearching;
  }

  @override
  set isSearching(bool value) {
    _$isSearchingAtom.reportWrite(value, super.isSearching, () {
      super.isSearching = value;
    });
  }

  late final _$imageAssetAtom =
      Atom(name: '_SearchController.imageAsset', context: context);

  @override
  String? get imageAsset {
    _$imageAssetAtom.reportRead();
    return super.imageAsset;
  }

  @override
  set imageAsset(String? value) {
    _$imageAssetAtom.reportWrite(value, super.imageAsset, () {
      super.imageAsset = value;
    });
  }

  late final _$getWeatherAsyncAction =
      AsyncAction('_SearchController.getWeather', context: context);

  @override
  Future<WeatherResponse> getWeather(String city) {
    return _$getWeatherAsyncAction.run(() => super.getWeather(city));
  }

  late final _$_SearchControllerActionController =
      ActionController(name: '_SearchController', context: context);

  @override
  void formatStrings(Weather weather) {
    final _$actionInfo = _$_SearchControllerActionController.startAction(
        name: '_SearchController.formatStrings');
    try {
      return super.formatStrings(weather);
    } finally {
      _$_SearchControllerActionController.endAction(_$actionInfo);
    }
  }

  @override
  String getAsset(WeatherResponse weather) {
    final _$actionInfo = _$_SearchControllerActionController.startAction(
        name: '_SearchController.getAsset');
    try {
      return super.getAsset(weather);
    } finally {
      _$_SearchControllerActionController.endAction(_$actionInfo);
    }
  }

  @override
  void clearSearch() {
    final _$actionInfo = _$_SearchControllerActionController.startAction(
        name: '_SearchController.clearSearch');
    try {
      return super.clearSearch();
    } finally {
      _$_SearchControllerActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
response: ${response},
error: ${error},
cityFormatted: ${cityFormatted},
currentTempFormatted: ${currentTempFormatted},
maxTempFormatted: ${maxTempFormatted},
minTempFormatted: ${minTempFormatted},
isSearching: ${isSearching},
imageAsset: ${imageAsset}
    ''';
  }
}
