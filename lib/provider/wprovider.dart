import '../wea.dart';
import 'package:flutter/material.dart';

class Wprovider extends ChangeNotifier {
  WeatherResponse? _weather2;

  set weather2(WeatherResponse? weather) {
    _weather2 = weather;

    notifyListeners();
  }

  WeatherResponse? get weather2 => _weather2;
}
