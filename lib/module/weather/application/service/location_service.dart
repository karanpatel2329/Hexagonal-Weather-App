
import 'package:hexagonal_weather_app/module/weather/application/port/in/command/location_command.dart';
import 'package:hexagonal_weather_app/module/weather/application/port/in/usecase/get_location_usecase.dart';
import 'package:hexagonal_weather_app/module/weather/application/port/out/location_port.dart';
import 'package:injectable/injectable.dart';

@singleton
class LocationService implements GetLocationUseCase{
  
  final LocationPort locationPort;

  LocationService({required this.locationPort,});
  
  @override
  Future getLocation(GetLocationCommond getLocationCommond) {
    return locationPort.getLocation(getLocationCommond);
  }
  
    
}

/// This service will use to get the location of the user.