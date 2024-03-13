import 'package:hexagonal_weather_app/module/weather/adapter/out/weather_adapter.dart';
import 'package:hexagonal_weather_app/module/weather/application/port/in/usecase/get_weather_usecase.dart';
import 'package:hexagonal_weather_app/module/weather/application/port/out/weather_port.dart';
import 'package:hexagonal_weather_app/module/weather/application/service/weather_service.dart';

import 'package:injectable/injectable.dart';
import 'package:hexagonal_weather_app/main.dart';

/// A module for managing weather-related dependencies.
///
/// This module provides access to the [GetWeatherUseCase] and [WeatherPort] instances.
/// The [GetWeatherUseCase] is responsible for retrieving weather data,
/// while the [WeatherPort] acts as an adapter for interacting with the weather service.

@module
abstract class WeatherModule{
  GetWeatherUseCase get getWeatherUseCase => injector.get<WeatherService>();
  WeatherPort get weatherPort => injector.get<WeatherAdapter>();
}