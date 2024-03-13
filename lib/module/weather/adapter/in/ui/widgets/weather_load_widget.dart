import 'package:flutter/material.dart';
import 'package:hexagonal_weather_app/core/constants/app_strings.dart';
import 'package:hexagonal_weather_app/core/constants/colors.dart';
import 'package:hexagonal_weather_app/core/utlis/global_functions.dart';
import 'package:hexagonal_weather_app/module/weather/adapter/in/bloc/weather_bloc.dart';

class WeatherInfoWidget extends StatelessWidget {
  final WeatherLoaded state;
  const WeatherInfoWidget({
    super.key,
    required this.state
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width,
      child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const SizedBox(
                  height: 20,
                ),
                Row(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const Icon(
                      Icons.location_on,
                      size: 35,
                      color: AppColors.primaryText,
                    ),
                    SizedBox(
                        width: MediaQuery.of(context).size.width * 0.8,
                        child: Text(
                          "${state.weatherModel.name}",
                          style: const TextStyle(
                            color: AppColors.primaryText,
                          ),
                          textAlign: TextAlign.center,
                        )),
                  ],
                ),
                const SizedBox(
                  height: 40,
                ),
                Image.asset(
                  
                 GlobalFunctions.getImageAssetFromWeatherCode(state.weatherModel.weatherCode??1000),
                  height: 120,
                  fit: BoxFit.cover,
                ),
                const SizedBox(
                  height: 40,
                ),
                Text(
                  "${state.weatherModel.temperature?.toInt()} °",
                  style: const TextStyle(
                      color: AppColors.primaryText,
                      fontSize: 45,
                      fontWeight: FontWeight.w700),
                ),
                const SizedBox(
                  height: 40,
                ),
                Container(
                  width: MediaQuery.of(context).size.width * 0.8,
                  padding: const EdgeInsets.all(20),
                  decoration: BoxDecoration(
                    color: AppColors.primaryText.withOpacity(0.07),
                    borderRadius: BorderRadius.circular(20),
                    boxShadow: [
                      BoxShadow(
                        color: AppColors.primary.withOpacity(0.2),
                        blurRadius: 10,
                        spreadRadius: 2,
                      ),
                    ],
                  ),
                  child: Column(
                    children: [
                      const Text(
                        AppStrings.weatherDetail,
                        style: TextStyle(
                          color: AppColors.primaryText,
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 20),
                      const SizedBox(height: 10),
                      Text(
                        "${AppStrings.humidity} ${state.weatherModel.humidity}%",
                        style: const TextStyle(
                          color: AppColors.primaryText,
                          fontSize: 16,
                        ),
                      ),
                      const SizedBox(height: 10),
                      Text(
                        "${AppStrings.windSpeed} ${state.weatherModel.windSpeed} km/h",
                        style: const TextStyle(
                          color: AppColors.primaryText,
                          fontSize: 16,
                        ),
                      ),
                      const SizedBox(height: 10),
                      Text(
                        "${AppStrings.visibility} ${state.weatherModel.visibility} ",
                        style: const TextStyle(
                          color: AppColors.primaryText,
                          fontSize: 16,
                        ),
                      ),
                      const SizedBox(height: 10),
                      Text(
                        "${AppStrings.cloudCover} ${state.weatherModel.cloudCover} ",
                        style: const TextStyle(
                          color: AppColors.primaryText,
                          fontSize: 16,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
    );
  }
}
