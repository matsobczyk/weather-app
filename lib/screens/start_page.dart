import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_cmoon_icons/flutter_cmoon_icons.dart';
import 'package:weather_app/widgets/single_weather.dart';
import '../widgets/single_weather.dart';

class StartPage extends StatefulWidget {
  @override
  _StartPageState createState() => _StartPageState();
}

class _StartPageState extends State<StartPage> {
  @override
  Widget build(BuildContext context) {
    String bgImg = 'assets/night.jpg';
    return Scaffold(
      body: Container(
        child: Stack(
          children: <Widget>[
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
                        location: 'Gdynia',
                        time: '21:39',
                        day: 'Poniedziałek',
                        date: '2.01.2022',),
                      TemperatureInfo(
                        temperature: '15°C',
                        icon: IconMoon.icon_moonset1,
                        dayTime: 'Noc',),
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
      ),
    );
  }
}







