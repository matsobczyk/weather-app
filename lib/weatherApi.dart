import 'dart:convert';
import 'package:http/http.dart' as http;

Future<Weather> fetchWeather() async {
  final response = await http.get('http://192.168.1.45:3000/example');

  if (response.statusCode == 200) {
    // If the server did return a 200 OK response,
    // then parse the JSON.
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
  final String dayTime;

  Weather({this.location, this.time, this.day, this.date, this.temperature, this.dayTime});

  factory Weather.fromJson(Map<String, dynamic> json) {
    return Weather(
      location: json['location'],
      time: json['time'],
      day: json['day'],
      date: json['date'],
      temperature: json['temperature'],
      dayTime: json['dayTime'],
    );
  }
}