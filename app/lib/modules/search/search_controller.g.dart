// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'search_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$SearchController on _SearchController, Store {
  final _$responseAtom = Atom(name: '_SearchController.response');

  @override
  Weather? get response {
    _$responseAtom.reportRead();
    return super.response;
  }

  @override
  set response(Weather? value) {
    _$responseAtom.reportWrite(value, super.response, () {
      super.response = value;
    });
  }

  final _$errorAtom = Atom(name: '_SearchController.error');

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

  final _$isSearchingAtom = Atom(name: '_SearchController.isSearching');

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

  final _$getWeatherAsyncAction = AsyncAction('_SearchController.getWeather');

  @override
  Future<Weather> getWeather(String city) {
    return _$getWeatherAsyncAction.run(() => super.getWeather(city));
  }

  final _$_SearchControllerActionController =
      ActionController(name: '_SearchController');

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
isSearching: ${isSearching}
    ''';
  }
}
