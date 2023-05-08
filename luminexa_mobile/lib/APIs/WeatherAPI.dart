import 'package:dio/dio.dart';

abstract class WeatherAPI {
  static getWeather() async {
    final String apiKey = '0b35cd2bcf267f08827f46da4cff9909';
    final String city = 'Beirut';
    final String url =
        'https://api.openweathermap.org/data/2.5/weather?q=$city&units=metric&appid=$apiKey';

    final response = await Dio().get(url);

    if (response.statusCode == 200) {
      final weatherData = response.data;
      return Map<String, dynamic>.from(weatherData);
    } else {
      print('Failed to get weather data.');
    }
  }
}
