import 'package:hexagonal_weather_app/module/weather/application/port/in/command/location_command.dart';

abstract class GetLocationUseCase {
  Future getLocation(GetLocationCommond getLocationCommond);
}

/// This use case will use to get the location of the user.