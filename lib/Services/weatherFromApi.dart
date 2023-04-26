import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:weather/Classes/WeatherStateClass.dart';

class WeatherFormApi {
  String baseUrl = 'http://api.weatherapi.com/v1';
  String apiKey = '85b3d20110c140d6ad0100641230803';

  Future <WeatherState> getWeather({required String cityName}) async {
    Uri url = Uri.parse(
        '$baseUrl/forecast.json?key=$apiKey&q=$cityName&aqi=no');
    http.Response response = await http.get(url);

    Map <String, dynamic> dataReturn = jsonDecode(response.body);
    WeatherState dayWeather = WeatherState.jsonFile(dataReturn);

    return dayWeather;
  }
}