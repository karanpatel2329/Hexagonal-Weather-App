import 'package:hexagonal_weather_app/module/weather/application/port/in/command/weather_command.dart';

abstract class GetWeatherUseCase {
  Future getWeather(GetWeatherCommond getWeatherCommond);
}

/// This use case will use to get the weather of the user.