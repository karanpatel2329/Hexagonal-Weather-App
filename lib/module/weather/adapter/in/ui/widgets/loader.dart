
import 'package:flutter/material.dart';
import 'package:hexagonal_weather_app/core/constants/app_images.dart';
import 'package:lottie/lottie.dart';

class LoaderWidget extends StatelessWidget {
  const LoaderWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Lottie.asset(AppImages.loader, height: 200, width: 200, fit: BoxFit.cover,filterQuality: FilterQuality.high,frameRate: FrameRate.max,),
    );
  }
}

