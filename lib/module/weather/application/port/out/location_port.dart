import 'package:hexagonal_weather_app/module/weather/application/port/in/command/location_command.dart';

abstract class LocationPort {
  Future getLocation(GetLocationCommond getLocationCommond);
}

/// This port will use location related work.