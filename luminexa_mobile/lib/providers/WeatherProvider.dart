import 'package:flutter/foundation.dart';
import 'package:luminexa_mobile/APIs/WeatherAPI.dart';

class WeatherProvider with ChangeNotifier {
  String temp;
  String wind;
  String status;
  String humidity;
  DateTime sunRise;
  DateTime sunSet;

  WeatherProvider({
    required this.temp,
    required this.wind,
    required this.status,
    required this.humidity,
    required this.sunRise,
    required this.sunSet,
  });

  Future getWeather() async {
    try {
      final weatherData = await WeatherAPI.getWeather();
      temp = weatherData['main']['temp'].toString();
      wind = weatherData['wind']['speed'].toString();
      status = weatherData['weather'][0]['main'].toString();
      humidity = weatherData['main']['humidity'].toString();
      final sunriseDateTime = weatherData['sys']['sunrise'];
      final sunsetDateTime = weatherData['sys']['sunset'];

      sunRise = DateTime.fromMillisecondsSinceEpoch(sunriseDateTime * 1000);
      sunSet = DateTime.fromMillisecondsSinceEpoch(sunsetDateTime * 1000);
    } catch (e) {
      rethrow;
    }

    notifyListeners();
  }
}
