
import 'package:hexagonal_weather_app/module/weather/application/port/in/command/location_command.dart';
import 'package:hexagonal_weather_app/module/weather/application/port/out/location_port.dart';
import 'package:hexagonal_weather_app/module/weather/data/location_data.dart';
import 'package:injectable/injectable.dart';

/// The adapter class that implements the [LocationPort] interface.
/// This class is responsible for interacting with the [LocationRepo] to retrieve location information.

@singleton
class LocationAdapter implements LocationPort{
  final LocationRepo _locationRepo = LocationRepo();

  @override
  Future getLocation(GetLocationCommond getLocationCommond) {
    return _locationRepo.getLocation(getLocationCommond);
  }
}
