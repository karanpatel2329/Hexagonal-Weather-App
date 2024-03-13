import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';

import 'package:geocoding/geocoding.dart';
import 'package:hexagonal_weather_app/module/weather/application/port/in/command/location_command.dart';

/// A repository class that handles location-related operations.

class LocationRepo {
  /// Retrieves the current location based on the provided [getLocationCommond].
  ///
  /// Returns the [Placemark] object representing the current location if the location permission is granted,
  /// otherwise returns null.
  ///
  /// Throws an error if there is an issue with retrieving the location.

  Future getLocation(GetLocationCommond getLocationCommond) async {
    final hasPermission =
        await handleLocationPermission(getLocationCommond.context);
    if (!hasPermission) {
      return null;
    } else {
      Position? position = await Geolocator.getCurrentPosition(
              desiredAccuracy: LocationAccuracy.high,
              timeLimit: Duration(seconds: 3))
          .then((Position position) async {
        return position;
      }).catchError((e) {
        // ignore: invalid_return_type_for_catch_error
        return null;
      });
      List<Placemark> placemarks =
          await placemarkFromCoordinates(position.latitude, position.longitude);
      return placemarks.first;
    }
  }

  /// Handles the location permission by checking if the location service is enabled,
  /// requesting permission if necessary, and showing appropriate error messages.
  ///
  /// Returns true if the location permission is granted, otherwise returns false.

  static Future<bool> handleLocationPermission(BuildContext context) async {
    bool serviceEnabled;
    LocationPermission permission;

    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      return false;
    }
    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text('Location permissions are denied')));
        return false;
      }
    }
    if (permission == LocationPermission.deniedForever) {
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
          content: Text(
              'Location permissions are permanently denied, we cannot request permissions.')));
      return false;
    }
    return true;
  }
}
