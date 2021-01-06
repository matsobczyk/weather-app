import 'package:flutter/material.dart';
import 'package:flutter_cmoon_icons/flutter_cmoon_icons.dart';
import 'package:weather_app/widgets/single_weather.dart';
import '../weatherApi.dart';
import '../widgets/single_weather.dart';


class StartPage extends StatefulWidget {
  @override
  _StartPageState createState() => _StartPageState();
}

class _StartPageState extends State<StartPage> {
  Future<Weather> futureWeather;

  @override
  void initState() {
    super.initState();
    futureWeather = fetchWeather();
  }
  @override
  Widget build(BuildContext context) {
    String bgImg = 'assets/night.jpg';
    return Scaffold(
      body: Stack(
        children: [
          Image.asset(
            bgImg,
            fit: BoxFit.cover,
            height: double.infinity,
            width: double.infinity,
          ),
          Container(
            decoration: BoxDecoration(color: Colors.black26),
          ),
          CustomAppBar(),
          FutureBuilder(
            future: futureWeather,
            builder: (context, snapshot) {
              if (snapshot.hasData){
                return Container(
                  child: Stack(
                    children: <Widget>[

                      Container(
                        padding: EdgeInsets.all(20),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    GeoLocInfo(
                                      location: snapshot.data.location,
                                      time: snapshot.data.time,
                                      day: snapshot.data.day,
                                      date: snapshot.data.date,),
                                    TemperatureInfo(
                                      temperature: snapshot.data.temperature,
                                      icon: IconMoon.icon_moonset1,
                                      dayTime: snapshot.data.dayTime,),
                                  ],
                                )),
                            Column(
                              children: [
                                SizedBox(height: 100,
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                      InfoCard(text: 'Wiatr', value: '24', unit: 'km/h',),
                                      InfoCard(text: 'Deszcz', value: '60', unit: '%',),
                                      InfoCard(text: 'Wilgotność', value: '27', unit: '%',),
                                    ],
                                  ),
                                ),
                              ],
                            )
                          ],
                        ),
                      ),
                    ],
                  ),
                );
              }else if (snapshot.hasError){
                return Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text ("${snapshot.error}"),
                  ],
                );
              }
              return CircularProgressIndicator();
            },
          ),
        ]
      ),
    );
  }
}

