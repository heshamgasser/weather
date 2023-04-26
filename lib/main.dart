import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:weather/Provider_Classes/weatherProvider.dart';
import 'package:weather/Screen/HomeScr.dart';
import 'package:weather/Screen/SearchScr.dart';

void main() {
  runApp(const WeatherApp());
}

class WeatherApp extends StatelessWidget {
  const WeatherApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context){
        return WeatherProvider();
      },
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        home: HomeScr(),
      ),
    );
  }
}
