import 'dart:convert';

import 'package:api/wea.dart';
import 'package:http/http.dart' as http;

import 'package:http/http.dart';

class ApiService {
  ApiService._instance();

  static final ApiService service = ApiService._instance();

  Future<WeatherResponse> fetchWeather({required String city}) async {
    String url =
        "https://api.openweathermap.org/data/2.5/weather?q=$city&appid=4a241542c4d44a2264e0336a2028aca6&units=metric";

    Response response = await http.get(Uri.parse(url));
    String body = response.body;
    var jsonresponse = jsonDecode(body);
    return WeatherResponse.fromJson(jsonresponse);
  }
}
