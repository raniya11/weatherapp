import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:weatherapp/models.dart';
import 'package:weatherapp/secrets.dart';
import 'package:http/http.dart' as http;

class WeatherServiceProvider extends ChangeNotifier{
  weatherResponseModel? _weather;
  weatherResponseModel? get weather => _weather;
  String? get error => _error;
  String? _error =" ";
  bool _isLoading = false;
  bool get isLoading => _isLoading;

  Future<void> fetchWeatherData(String city) async{
    _isLoading=true;
    _error="";

    try{
      final apiUrl="${Secrets.openWeatherBaseUrl}${city}&appid=${Secrets.openWeatherApiKey}${Secrets.units}";
      final url = Uri.parse(apiUrl);
      print(url);
      final response = await http.get(url);
      print(response.body);
      print(response.statusCode);
      if(response.statusCode==200){
        final data = jsonDecode(response.body);

        print(data);

        _weather = weatherResponseModel.fromJson(data);
        print(_weather!.main!.temp);
        notifyListeners();
      }
      else{
        _error = "Failed to load data";
        notifyListeners();
      }

    }
    catch (e) {
      _error = "An error occured ${e}";
      notifyListeners();
    }
    finally{
      _isLoading = false;
      notifyListeners();
    }
  }
}