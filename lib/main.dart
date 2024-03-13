import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:get_it/get_it.dart';
import 'package:hexagonal_weather_app/core/constants/app_strings.dart';
import 'package:hexagonal_weather_app/main.config.dart';
import 'package:hexagonal_weather_app/module/weather/adapter/in/bloc/weather_bloc.dart';
import 'package:hexagonal_weather_app/module/weather/adapter/in/ui/home_page.dart';
import 'package:hexagonal_weather_app/module/weather/application/port/in/usecase/get_location_usecase.dart';
import 'package:hexagonal_weather_app/module/weather/application/port/in/usecase/get_weather_usecase.dart';
import 'package:injectable/injectable.dart';

import 'package:flutter_bloc/flutter_bloc.dart';
void main() async{
  await dotenv.load();
  WidgetsFlutterBinding.ensureInitialized();
  configureDependencies();
  runApp(const MyApp());
}

final injector = GetIt.instance;

@InjectableInit()
void configureDependencies() => GetItInjectableX(injector).init();

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => WeatherBloc(injector.get<GetWeatherUseCase>(),injector.get<GetLocationUseCase>()),
      child: MaterialApp(
        title: AppStrings.appName,
        home: HomeScreen(),
      ),
    );
  }
}
