import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart' as http;
import 'dart:convert' as convert ;

import 'package:weather_app/screens/start_page.dart';


Future<Weather> fetchWeather(location) async {
  Map<String, dynamic>    formMap = {
    "location": location
  } ;

  final response = await http.post(
    'http://192.168.1.12:3000/',
    body: convert.jsonEncode(formMap),
      headers: {
        HttpHeaders.contentTypeHeader: 'application/json',
      }

  );


  if (response.statusCode == 200) {
    // If the server did return a 200 OK response,
    // then parse the JSON.
    print(response.body);
    return Weather.fromJson(jsonDecode(response.body));
  } else {
    // If the server did not return a 200 OK response,
    // then throw an exception.
    throw Exception('Failed to load album');
  }
}

class Weather {
  final String location;
  final String time;
  final String day;
  final String date;
  final String temperature;
  final String windSpeed;
  final String rainProbability;
  final String humidity;
  final String dayTime;


  Weather({this.location, this.time, this.day, this.date, this.temperature, this.dayTime, this.windSpeed, this.rainProbability, this.humidity});

  factory Weather.fromJson(Map<String, dynamic> json) {
    return Weather(
      location: json['location'],
      time: json['time'],
      day: json['day'],
      date: json['date'],
      temperature: json['temperature'],
      windSpeed: json['windSpeed'],
      dayTime: json['dayTime'],
      rainProbability: json['rainProbability'],
      humidity: json['humidity'],
    );
  }
}