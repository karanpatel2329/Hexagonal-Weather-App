import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:geocoding/geocoding.dart';
import 'package:hexagonal_weather_app/module/weather/adapter/in/ui/home_page.dart';
import 'package:hexagonal_weather_app/module/weather/adapter/in/ui/permission_request.dart';
import 'package:hexagonal_weather_app/module/weather/adapter/in/ui/weather_home.dart';
import 'package:hexagonal_weather_app/module/weather/application/port/in/command/location_command.dart';
import 'package:hexagonal_weather_app/module/weather/application/port/in/command/weather_command.dart';
import 'package:hexagonal_weather_app/module/weather/application/port/in/usecase/get_location_usecase.dart';
import 'package:hexagonal_weather_app/module/weather/application/port/in/usecase/get_weather_usecase.dart';
import 'package:hexagonal_weather_app/module/weather/domain/weather.dart';
part 'weather_event.dart';
part 'weather_state.dart';

class WeatherBloc extends Bloc<WeatherEvent, WeatherState> {
  WeatherBloc(this.getWeatherUseCase, this.getLocationUseCase)
      : super(WeatherInitial()) {
    on<WeatherEvent>((event, emit) async {
       if (event is GetWeatherbyLocationEvent) {
        emit(WeatherLoading());
        var loc = await getLocationUseCase.getLocation(event.locationCommond);
        if (loc == null) {
          Navigator.of(event.locationCommond.context).push(MaterialPageRoute(
              builder: (context) => PermissionRequiredScreen()));
          return;
        }
        var res = await getWeatherUseCase.getWeather(GetWeatherCommond(
            location:
                "${(loc as Placemark).locality ?? ""}-${(loc as Placemark).administrativeArea ?? ""}"));
        if (res == null) {
          emit(WeatherError("Error in fetching weather"));
          return;
        }
        emit(WeatherLoaded((res as WeatherModel)));
      }
      if (event is GetWeatherByNameEvent) {
        emit(WeatherLoading());

        var res = await getWeatherUseCase.getWeather(event.command);
        if (res == null) {
          emit(WeatherError("Error in fetching weather"));
          return;
        }
        emit(WeatherLoaded((res as WeatherModel)));
      }
      if (event is NavigateToWeatherScreenEvent) {
        Navigator.of(event.context)
            .push(MaterialPageRoute(builder: (context) => WeatherHome()));
      }
      if (event is NavigateToHomeScreenEvent) {
        Navigator.of(event.context)
            .push(MaterialPageRoute(builder: (context) => HomeScreen()));
      }
    });
  }
  final GetWeatherUseCase getWeatherUseCase;
  final GetLocationUseCase getLocationUseCase;
}
