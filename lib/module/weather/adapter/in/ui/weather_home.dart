import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hexagonal_weather_app/core/constants/app_strings.dart';
import 'package:hexagonal_weather_app/core/constants/colors.dart';
import 'package:hexagonal_weather_app/module/weather/adapter/in/bloc/weather_bloc.dart';
import 'package:hexagonal_weather_app/module/weather/adapter/in/ui/widgets/loader.dart';
import 'package:hexagonal_weather_app/module/weather/adapter/in/ui/widgets/weather_load_widget.dart';

class WeatherHome extends StatefulWidget {
  const WeatherHome({super.key});

  @override
  State<WeatherHome> createState() => _WeatherHomeState();
}

class _WeatherHomeState extends State<WeatherHome> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.primary,
      appBar: AppBar(
        backgroundColor: AppColors.primary,
        foregroundColor: AppColors.primaryText,
        title: const Text(AppStrings.weatherInfoTitle),
      ),
      body: BlocConsumer<WeatherBloc, WeatherState>(
        listener: (context, state) {
          if (state is WeatherError) {
            ScaffoldMessenger.of(context)
                .showSnackBar(SnackBar(content: Text(state.message)));
            Navigator.pop(context);
          }
        },
        builder: (context, state) {
           
          if (state is WeatherLoaded) {
            return   WeatherInfoWidget(state: state,);
          }
          if (state is WeatherLoading) {
            return LoaderWidget();
          }
          return Container();
        },
      ),
    );
  }
}
