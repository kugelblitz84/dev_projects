import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:weather_app1/models/weather_models.dart';

class WeatherServices {
  fetchWeather() async {
    final response = await http.get(
      Uri.parse(
          "https://api.openweathermap.org/data/2.5/weather?lat=23.9905&lon=90.3877&appid=cad73040c837264efe5b07d7578d5ff9"),
    );
    try {
      if (response.statusCode == 200) {
        var json = jsonDecode(response.body);
        return WeatherData.fromJson(json);
      } else {
        throw Exception('Failed to load Weather data');
      }
    } catch (e) {
      print(e.toString());
    }
  }
  
}
// replace the api key with your api key thay openWeathemap provide you
// for your current location provide the longitude and latitude of your current location