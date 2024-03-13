import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hexagonal_weather_app/core/constants/app_strings.dart';
import 'package:hexagonal_weather_app/core/constants/colors.dart';
import 'package:hexagonal_weather_app/module/weather/adapter/in/bloc/weather_bloc.dart';

class PermissionRequiredScreen extends StatefulWidget {
  const PermissionRequiredScreen({super.key});

  @override
  State<PermissionRequiredScreen> createState() => _PermissionRequiredScreenState();
}

class _PermissionRequiredScreenState extends State<PermissionRequiredScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.primary,
      appBar: AppBar(
         backgroundColor: AppColors.primary,
         foregroundColor: AppColors.primaryText,
      title: const Text(AppStrings.permissionRequestTitle),
      leading: const SizedBox(),
      ),
      
      body: Center(
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children:  [
          const Text(
            AppStrings.permissionRequest,
            style: TextStyle(fontSize: 24,color:  AppColors.primaryText,),
          ),
          const SizedBox(height: 16),
          const Text(
          AppStrings.permissionDescription ,
            style: TextStyle(fontSize: 14,color:  AppColors.primaryText,),
            textAlign: TextAlign.center,
          ),
          const Text(AppStrings.permissionNote,
          textAlign: TextAlign.center,
          style: TextStyle(fontWeight: FontWeight.w600,color:  AppColors.primaryText,),
          ),
           const SizedBox(height: 14),
          ElevatedButton(
            onPressed: (){

              BlocProvider.of<WeatherBloc>(context).add(NavigateToHomeScreenEvent(context));
            },
            child: const Text(AppStrings.permissionBtn))
          ],
        ),
      ),
      ),
    );
  }
}