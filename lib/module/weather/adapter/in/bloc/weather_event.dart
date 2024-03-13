part of 'weather_bloc.dart';

@immutable
sealed class WeatherEvent {}

class GetWeatherbyLocationEvent extends WeatherEvent {
  final GetLocationCommond locationCommond;

  GetWeatherbyLocationEvent(this.locationCommond);
  List<Object> get props => [locationCommond];
}

class GetWeatherByNameEvent extends WeatherEvent {
  final GetWeatherCommond command;

  GetWeatherByNameEvent(this.command);
  List<Object> get props => [command];
}

class NavigateToWeatherScreenEvent extends WeatherEvent {
  final BuildContext context;

  NavigateToWeatherScreenEvent(this.context);
  List<Object> get props => [context];
}
class NavigateToHomeScreenEvent extends WeatherEvent {
  final BuildContext context;

  NavigateToHomeScreenEvent(this.context);
  List<Object> get props => [context];
}