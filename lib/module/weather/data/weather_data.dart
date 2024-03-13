import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:hexagonal_weather_app/core/constants/api_routes.dart';
import 'package:http/http.dart' as http;

/// A repository class for retrieving weather data.
class WeatherRepo {
  /// Retrieves weather data for the specified city.
  ///
  /// Returns the weather data as a JSON string if the request is successful,
  /// otherwise returns null.
  ///
  /// The [city] parameter specifies the city for which to retrieve weather data.
  ///
  /// Throws an exception if an error occurs during the HTTP request.
  Future<String?> getWeather(String city) async {
    try {
      var url = Uri.parse('${ApiRoutes.weatherDetail}=$city');

      var headers = {
        'apikey': dotenv.env['API_KEY'] ?? '',
        'content-type': 'application/json',
      };
      var response = await http.get(url, headers: headers);
      if (response.statusCode == 200) {
        return response.body;
      }
      return null;
    } catch (e) {
      return null;
    }
  }
}
