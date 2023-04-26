
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:weather/Classes/WeatherStateClass.dart';
import 'package:weather/Provider_Classes/weatherProvider.dart';
import 'package:weather/Screen/HomeScr.dart';
import 'package:weather/Services/weatherFromApi.dart';


class SearchScr extends StatelessWidget {
  String? cityName;
  SearchScr ({this.updateUi});

  VoidCallback? updateUi;




  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        elevation: 0.0,
        leading: IconButton(
            onPressed: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) {
                return  HomeScr();
              }));
            },
            icon: const Icon(Icons.arrow_back)),
        title: const Text(
          'Search a City',
          style: TextStyle(
            fontSize: 24.0,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: TextFormField(
            onFieldSubmitted: (enteredData) async {
              cityName = enteredData;
              WeatherFormApi weatherSearch = WeatherFormApi();
              WeatherState weather = await weatherSearch.getWeather(cityName: cityName!);
             Provider.of <WeatherProvider>(context, listen: false).weatherData = weather;
             Provider.of <WeatherProvider>(context , listen: false).cityName = cityName;

              Navigator.pop(context);

            },
            decoration: const InputDecoration(
              contentPadding:
              EdgeInsets.symmetric(vertical: 30.0, horizontal: 15.0),
              hintText: 'Enter City Name',
              border: OutlineInputBorder(),
              labelText: 'Search',
              labelStyle: TextStyle(
                color: Colors.blue,
                fontSize: 18.0,
              ),
              suffixIcon: Icon(Icons.search),
              suffixIconColor: Colors.black,
            ),
          ),
        ),
      ),
    );
  }
}



