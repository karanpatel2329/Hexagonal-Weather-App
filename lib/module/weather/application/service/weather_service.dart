
import 'package:hexagonal_weather_app/module/weather/application/port/in/usecase/get_weather_usecase.dart';
import 'package:hexagonal_weather_app/module/weather/application/port/in/command/weather_command.dart';
import 'package:hexagonal_weather_app/module/weather/application/port/out/weather_port.dart';
import 'package:injectable/injectable.dart';

@singleton
class WeatherService implements GetWeatherUseCase{
  
  final WeatherPort weatherPort;

  WeatherService({required this.weatherPort,});
  
  @override
  Future getWeather(GetWeatherCommond getWeatherCommond) {
   return weatherPort.getW(getWeatherCommond.location);
  }
}

/// This service will use to get the weather of the location.