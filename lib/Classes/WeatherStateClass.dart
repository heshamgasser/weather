import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class WeatherState {
  DateTime date;
  double avgTemp;
  double maxTemp;
  double minTemp;
  String condition;
  

  WeatherState(
      {required this.date,
      required this.avgTemp,
      required this.maxTemp,
      required this.minTemp,
      required this.condition});

  factory WeatherState.jsonFile(dynamic daraReturn) {
    var jsonData = daraReturn['forecast']['forecastday'][0]['day'];
    // date = daraReturn['location']['localtime'];
    // avgTemp = jsonData['avgtemp_c'];
    // maxTemp = jsonData['maxtemp_c'];
    // minTemp = jsonData['mintemp_c'];
    // condition = jsonData['condition']['text'];

    return WeatherState(
        date: DateTime.parse(daraReturn['location']['localtime']),
        avgTemp: jsonData['avgtemp_c'],
        maxTemp: jsonData['maxtemp_c'],
        minTemp: jsonData['mintemp_c'],
        condition: jsonData['condition']['text']);
  }

  void view() {

    print('Date: $date');
    print('Temperature: $avgTemp');
    print('Max Temperature: $maxTemp');
    print('Min Temperature: $minTemp');
    print('Condition: $condition');
  }



}


