
import 'package:flutter/material.dart';
import 'package:flutter_cmoon_icons/flutter_cmoon_icons.dart';

class InfoCard extends StatelessWidget {
  InfoCard({this.text, this.value, this.unit});
  final text;
  final value;
  final unit;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(5.0),
      child: Container(
        width: 100,
        child: Column(
          children: [
            Text(text, style: TextStyle(color: Colors.white, fontSize: 17, fontWeight: FontWeight.bold)),
            Text(value, style: TextStyle(color: Colors.white, fontSize: 27)),
            Text(unit, style: TextStyle(color: Colors.white, fontSize: 13)),
          ],
        ),
      ),
    );
  }
}

class GeoLocInfo extends StatelessWidget {
  GeoLocInfo({@required this.location, this.time, this.day, this.date});
  final location;
  final time;
  final day;
  final date;



  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(height: 120,),
        Text(
          location,
          style: TextStyle(
              fontSize: 48,
              fontWeight: FontWeight.bold,
              color: Colors.white
          ),),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 2.0),
          child: Text(
            time+' - '+ day + ' '+ date,
            style: TextStyle(
                color: Colors.white70,
                fontSize: 18
          ),
          ),
        )
      ],
    );
  }
}

class TemperatureInfo extends StatelessWidget {
  TemperatureInfo({this.temperature, this.icon, this.dayTime});
  final temperature;
  final icon;
  final dayTime;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: 120,),
          Padding(
            padding: EdgeInsets.symmetric(vertical: 0),
            child: Text(
              temperature,
              style: TextStyle(
                  fontSize: 68,
                  fontWeight: FontWeight.bold,
                  color: Colors.white
              ),),
          ),
          Row(
            children: [
              Container(
                child: CIcon(icon, color: Colors.white, size: 80,),
              ),
              Text(dayTime, style: TextStyle(color: Colors.white, fontSize: 30),)
            ],
          ),
          Padding(padding: EdgeInsets.symmetric(vertical: 10),
              child: Container(decoration: BoxDecoration( border: Border.all(color: Colors.white24)),))
        ],
      ),
    );
  }
}

class CustomAppBar extends StatelessWidget {
  const CustomAppBar({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 5.0, horizontal: 2),
      child: AppBar(
        title: Text(""),
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(icon: Icon(
          Icons.search, size: 30,
          color: Colors.white,),
            onPressed: () {
              print('Search Clicked');
            }),
        actions: [
          Container(
            margin: EdgeInsets.fromLTRB(0, 0, 20, 0),
            child: GestureDetector(
              onTap: () => print('Menu Clicked'),
              child: Icon(Icons.menu, size: 30,
                color: Colors.white,
              ),
            ),
          ),
        ],
      ),
    );
  }
}