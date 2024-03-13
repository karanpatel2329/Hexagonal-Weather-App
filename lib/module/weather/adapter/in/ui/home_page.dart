import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hexagonal_weather_app/core/constants/app_strings.dart';
import 'package:hexagonal_weather_app/core/constants/colors.dart';
import 'package:hexagonal_weather_app/module/weather/adapter/in/bloc/weather_bloc.dart';
import 'package:hexagonal_weather_app/module/weather/application/port/in/command/location_command.dart';
import 'package:hexagonal_weather_app/module/weather/application/port/in/command/weather_command.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  TextEditingController _searchController = TextEditingController();
  var _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: AppColors.primary,
        body: Center(
          child: Padding(
            padding: const EdgeInsets.all(12.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                const Spacer(
                  flex: 2,
                ),
                const Text(
                  AppStrings.appName,
                  style: TextStyle(fontSize: 24, color: AppColors.primaryText),
                ),
                const SizedBox(
                  height: 20,
                ),
                const Text(
                  AppStrings.welcomeMessage,
                  style: TextStyle(
                      fontSize: 18,
                      color: AppColors.primaryText,
                      fontWeight: FontWeight.w300),
                ),
                const Spacer(
                  flex: 1,
                ),
                SizedBox(
                  width: MediaQuery.of(context).size.width * 0.8,
                  child: Form(
                    key: _formKey,
                    child: TextFormField(
                      controller: _searchController,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return AppStrings.searchErrorMessage;
                        }
                        return null;
                      },
                      style: const TextStyle(color: AppColors.primaryText),
                      onChanged: (value) {
                        setState(() {});
                      },
                      decoration: InputDecoration(
                        hintText: AppStrings.searchHint,
                        hintStyle: TextStyle(
                            color: AppColors.primaryText.withOpacity(0.5)),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                        suffixIcon: IconButton(
                          onPressed: () {
                            if (_formKey.currentState!.validate()) {
                              BlocProvider.of<WeatherBloc>(context)
                                  .add(NavigateToWeatherScreenEvent(context));
                              BlocProvider.of<WeatherBloc>(context).add(
                                  GetWeatherByNameEvent(GetWeatherCommond(
                                      location: _searchController.text)));
                            }
                            // Perform search action
                          },
                          icon: Icon(
                            Icons.search,
                            color: _searchController.text.isNotEmpty
                                ? AppColors.primaryText
                                : AppColors.primaryText.withOpacity(0.5),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 12,
                ),
                const Text(
                  AppStrings.orText,
                  style: TextStyle(color: AppColors.primaryText),
                ),
                const SizedBox(
                  height: 12,
                ),
                ElevatedButton(
                  onPressed: () {
                    BlocProvider.of<WeatherBloc>(context)
                        .add(NavigateToWeatherScreenEvent(context));
                    BlocProvider.of<WeatherBloc>(context).add(
                        GetWeatherbyLocationEvent(
                            GetLocationCommond(context: context)));

                    // Perform action to use user's location
                  },
                  child: const Text(AppStrings.useMyLocationBtn),
                ),
                const Spacer(
                  flex: 4,
                ),
              ],
            ),
          ),
        ));
  }
}
