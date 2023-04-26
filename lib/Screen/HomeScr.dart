import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:weather/Classes/WeatherStateClass.dart';
import 'package:weather/Provider_Classes/weatherProvider.dart';
import 'package:weather/Screen/SearchScr.dart';

class HomeScr extends StatefulWidget {
  HomeScr({Key? key}) : super(key: key);

  @override
  State<HomeScr> createState() => _HomeScrState();
}

class _HomeScrState extends State<HomeScr> {



  @override
  Widget build(BuildContext context) {

    WeatherState? weatherState = Provider.of <WeatherProvider>(context).weatherData;
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Colors.blue,
        elevation: 0,
        titleSpacing: 20,
        title: const Text(
          'Weather',
          style: TextStyle(
            color: Colors.white,
            fontSize: 24.0,
            fontWeight: FontWeight.bold,
          ),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 10.0),
            child: IconButton(
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) {
                  return SearchScr();
                }));
              },
              icon: const Icon(CupertinoIcons.search),
            ),
          ),
        ],
      ),
      body: weatherState == null
          ? Padding(
              padding: const EdgeInsets.all(20.0),
              child: Center(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: const [
                    Text(
                      'There is No Weather 😔 Start',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 25.0,
                      ),
                    ),
                    Text(
                      'Searching Now 🔍',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 25.0,
                      ),
                    ),
                  ],
                ),
              ),
            )
          : Center(
            child: Container(
                alignment: AlignmentDirectional.topCenter,
                width: double.infinity,
                color: Colors.orange,
                child: Column(
                  children: [
                    Spacer(flex: 3),
                    Text(
                      Provider.of<WeatherProvider>(context).cityName!.toUpperCase(),
                      style: TextStyle(
                        fontSize: 40.0,
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                      ),
                    ),
                    SizedBox(height: 5.0),
                    Text(
                      'Updated : ${weatherState.date.hour}:${weatherState.date.minute}',
                      style: TextStyle(
                        fontSize: 20.0,
                        color: Colors.black,
                      ),
                    ),
                    SizedBox(height: 5.0),
                    Text(
                      '${weatherState.date.day}/${weatherState.date.month}/${weatherState.date.year}',
                      style: TextStyle(
                        fontSize: 20.0,
                        color: Colors.black,
                      ),
                    ),
                    Spacer(flex: 2),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Icon(
                          Icons.wb_sunny_sharp,
                          color: Colors.blue,
                          size: 100.0,
                        ),
                        // SizedBox(width: 40.0),
                        Text(
                          '${weatherState.avgTemp.toInt()}',
                          style: TextStyle(
                            fontSize: 50.0,
                            color: Colors.black,
                          ),
                        ),
                        // SizedBox(width: 40.0),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Max Temp ${weatherState.maxTemp.toInt()}',
                              style: TextStyle(
                                fontSize: 18.0,
                                color: Colors.black,
                              ),
                            ),
                            SizedBox(height: 5.0),
                            Text(
                              'Min Temp ${weatherState.minTemp.toInt()}',
                              style: TextStyle(
                                fontSize: 18.0,
                                color: Colors.black,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                    Spacer(flex: 2,),
                    Text(
                      '${weatherState.condition}',
                      style: TextStyle(
                        fontSize: 40.0,
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                      ),
                    ),
                    Spacer(flex: 5),
                  ],
                ),
              ),
          ),
    );
  }
}
