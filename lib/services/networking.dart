import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;
import 'package:weather_now/screens/loading_screen.dart';
import 'dart:convert';

class NetworkAPI {
  NetworkAPI(this.url);
  final String url;

  Future getData() async {
    http.Response response = await http.get(Uri.parse(url));
    if (response.statusCode == 200) {
      String weatherData = response.body;
      return jsonDecode(weatherData);
    } else {
      print(response.statusCode);
      print(response.body);
    }
  }
}
