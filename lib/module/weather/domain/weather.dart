// To parse this JSON data, do
//
//     final WeatherModel = WeatherModelFromJson(jsonString);

import 'dart:convert';

WeatherModel WeatherModelFromJson(String str) => WeatherModel.fromJson(json.decode(str));

String WeatherModelToJson(WeatherModel data) => json.encode(data.toJson());

class WeatherModel {
    double? cloudBase;
    double? cloudCeiling;
    double? cloudCover;
    double? dewPoint;
    double? freezingRainIntensity;
    double? humidity;
    double? precipitationProbability;
    double? pressureSurfaceLevel;
   double? rainIntensity;
    double? sleetIntensity;
    double? snowIntensity;
    double? temperature;
    double? temperatureApparent;
    double? uvHealthConcern;
    double? uvIndex;
    double? visibility;
    double? weatherCode;
    double? windDirection;
    double? windGust;
    double? windSpeed;
    String? name;

    WeatherModel({
        this.cloudBase,
        this.cloudCeiling,
        this.cloudCover,
        this.dewPoint,
        this.freezingRainIntensity,
        this.humidity,
        this.precipitationProbability,
        this.pressureSurfaceLevel,
        this.rainIntensity,
        this.sleetIntensity,
        this.snowIntensity,
        this.temperature,
        this.temperatureApparent,
        this.uvHealthConcern,
        this.uvIndex,
        this.visibility,
        this.weatherCode,
        this.windDirection,
        this.windGust,
        this.windSpeed,
        this.name
    });

    factory WeatherModel.fromJson(Map<String, dynamic> json) => WeatherModel(
        cloudBase: json["cloudBase"]?.toDouble(),
        cloudCeiling: json["cloudCeiling"]?.toDouble(),
        cloudCover: json["cloudCover"]?.toDouble(),
        dewPoint: json["dewPoint"]?.toDouble(),
        freezingRainIntensity: json["freezingRainIntensity"]?.toDouble(),
        humidity: json["humidity"]?.toDouble(),
        precipitationProbability: json["precipitationProbability"]?.toDouble(),
        pressureSurfaceLevel: json["pressureSurfaceLevel"]?.toDouble(),
        rainIntensity: json["rainIntensity"]?.toDouble(),
        sleetIntensity: json["sleetIntensity"]?.toDouble(),
        snowIntensity: json["snowIntensity"]?.toDouble(),
        temperature: json["temperature"]?.toDouble(),
        temperatureApparent: json["temperatureApparent"]?.toDouble(),
        uvHealthConcern: json["uvHealthConcern"]?.toDouble(),
        uvIndex: json["uvIndex"]?.toDouble(),
        visibility: json["visibility"]?.toDouble(),
        weatherCode: json["weatherCode"]?.toDouble(),
        windDirection: json["windDirection"]?.toDouble(),
        windGust: json["windGust"]?.toDouble(),
        windSpeed: json["windSpeed"]?.toDouble(),
        name: json["name"]
    );

    Map<String, dynamic> toJson() => {
        "cloudBase": cloudBase,
        "cloudCeiling": cloudCeiling,
        "cloudCover": cloudCover,
        "dewPoint": dewPoint,
        "freezingRainIntensity": freezingRainIntensity,
        "humidity": humidity,
        "precipitationProbability": precipitationProbability,
        "pressureSurfaceLevel": pressureSurfaceLevel,
        "rainIntensity": rainIntensity,
        "sleetIntensity": sleetIntensity,
        "snowIntensity": snowIntensity,
        "temperature": temperature,
        "temperatureApparent": temperatureApparent,
        "uvHealthConcern": uvHealthConcern,
        "uvIndex": uvIndex,
        "visibility": visibility,
        "weatherCode": weatherCode,
        "windDirection": windDirection,
        "windGust": windGust,
        "windSpeed": windSpeed,
    };
}
