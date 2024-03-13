import 'package:hexagonal_weather_app/main.dart';
import 'package:hexagonal_weather_app/module/weather/adapter/out/location_adapter.dart';
import 'package:hexagonal_weather_app/module/weather/application/port/in/usecase/get_location_usecase.dart';
import 'package:hexagonal_weather_app/module/weather/application/port/out/location_port.dart';
import 'package:hexagonal_weather_app/module/weather/application/service/location_service.dart';
import 'package:injectable/injectable.dart';

/// A module for handling location-related dependencies.
///
/// This module provides access to the [GetLocationUseCase] and [LocationPort]
/// implementations for retrieving weather information.
///

@module
abstract class LocationModule {
  GetLocationUseCase get getWeatherUseCase => injector.get<LocationService>();
  LocationPort get weatherPort => injector.get<LocationAdapter>();
}