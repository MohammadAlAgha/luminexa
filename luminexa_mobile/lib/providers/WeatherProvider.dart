import 'package:flutter/foundation.dart';
import 'package:luminexa_mobile/APIs/WeatherAPI.dart';

class WeatherProvider with ChangeNotifier {
  String temp;
  String wind;
  String status;
  String humidity;
  // String sunRise;
  // String sunSet;

  WeatherProvider({
    required this.temp,
    required this.wind,
    required this.status,
    required this.humidity,
    // required this.sunRise,
    // required this.sunSet,
  });

  Future getWeather() async {
    try {
      final weatherData = await WeatherAPI.getWeather();
      temp = weatherData['main']['temp'].toString();
      print(temp);
      wind = weatherData['wind']['speed'].toString();
      print(wind);
      status = weatherData['weather'][0]['main'].toString();
      print(status);
      humidity = weatherData['main']['humidity'].toString();
      print(humidity);
      // sunRise = weatherData.data['sys']['sunrise'];
      // print(sunRise);
      // sunSet = weatherData.data['sys']['sunset'];
      // print(sunRise);
    } catch (e) {
      rethrow;
    }

    notifyListeners();
  }
}
