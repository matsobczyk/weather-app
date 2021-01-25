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

  var txt = TextEditingController();

  @override
  void initState() {
    super.initState();
    futureWeather = fetchWeather('Gdynia');
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
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 5.0, horizontal: 2),
          child: AppBar(
            title: Text(""),
            backgroundColor: Colors.transparent,
            actions: <Widget>[
              Row(
                children: [
                  Container(
                    width:350,
                    padding: const EdgeInsets.all(16.0),
                    child: TextFormField(
                      showCursor: false,
                      decoration: InputDecoration(
                        enabledBorder: UnderlineInputBorder(
                          borderSide: BorderSide(color: Colors.white),
                        ),
                        focusedBorder: UnderlineInputBorder(
                          borderSide: BorderSide(color: Colors.white),
                        ),
                        border: UnderlineInputBorder(
                          borderSide: BorderSide(color: Colors.white),
                        ),
                      ),
                      controller: txt,
                    ),
                  ),
                  IconButton(icon: Icon(Icons.search), onPressed: () {
                    setState(() {

                      futureWeather = fetchWeather(txt.text);
                      txt.clear();
                    });

                  })
                ],
              ),

            ],

            elevation: 0,

          ),
        ),
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
                                      day: snapshot.data.day.toString(),
                                      date: snapshot.data.date,),
                                    TemperatureInfo(
                                      temperature: snapshot.data.temperature.toString().split('.')[0] +' °C',
                                      icon: IconMoon.icon_sun3,
                                      dayTime: snapshot.data.dayTime,),
                                  ],
                                )),
                            Column(
                              children: [
                                SizedBox(height: 100,
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                      InfoCard(text: 'Deszcz', value: snapshot.data.rainProbability.toString().split(' ')[0], unit: '%',),
                                      InfoCard(text: 'Wiatr', value: snapshot.data.windSpeed.toString().split(' ')[0], unit: 'm/s',),
                                      InfoCard(text: 'Wilgotność', value: snapshot.data.humidity.toString().split('%')[0], unit: '%',),
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
                print(snapshot);
                return Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Center(child: Text('Check Spelling', style: TextStyle(
                      color: Colors.white, fontSize: 27) ,))
                  ],
                );
              }
              return Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  CircularProgressIndicator(),
                ],
              );
            },
          ),
        ]
      ),
    );
  }
}

