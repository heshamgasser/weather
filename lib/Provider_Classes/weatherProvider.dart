import 'package:flutter/cupertino.dart';
import 'package:weather/Classes/WeatherStateClass.dart';

class WeatherProvider extends ChangeNotifier {
  WeatherState? _weatherData;
  String? cityName;

  set weatherData(WeatherState? weather) {
    _weatherData = weather;
    notifyListeners();
  }

  WeatherState? get weatherData => _weatherData;
}
