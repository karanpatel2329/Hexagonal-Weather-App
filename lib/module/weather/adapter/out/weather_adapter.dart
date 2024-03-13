import 'dart:convert';
import 'package:hexagonal_weather_app/module/weather/application/port/out/weather_port.dart';
import 'package:hexagonal_weather_app/module/weather/data/weather_data.dart';
import 'package:hexagonal_weather_app/module/weather/domain/weather.dart';
import 'package:injectable/injectable.dart';

/// The adapter class that implements the [WeatherPort] interface.
/// This class is responsible for interacting with the [WeatherRepo] to retrieve location information.


@singleton
class WeatherAdapter implements WeatherPort{
   final WeatherRepo _weatherRepo = WeatherRepo();
 
  @override
  Future<WeatherModel?> getW(String city) async{
    var a=await _weatherRepo.getWeather(city);
    if(a !=null){
     var res = jsonDecode(a)['data']['values'];
      res['name']=jsonDecode(a)['location']['name'];
      return WeatherModel.fromJson(res);
    } 
    return null;
  }

}

