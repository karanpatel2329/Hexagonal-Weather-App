// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:get_it/get_it.dart' as _i1;
import 'package:hexagonal_weather_app/module/weather/adapter/out/location_adapter.dart'
    as _i5;
import 'package:hexagonal_weather_app/module/weather/adapter/out/weather_adapter.dart'
    as _i8;
import 'package:hexagonal_weather_app/module/weather/application/port/in/usecase/get_location_usecase.dart'
    as _i3;
import 'package:hexagonal_weather_app/module/weather/application/port/in/usecase/get_weather_usecase.dart'
    as _i4;
import 'package:hexagonal_weather_app/module/weather/application/port/out/location_port.dart'
    as _i6;
import 'package:hexagonal_weather_app/module/weather/application/port/out/weather_port.dart'
    as _i9;
import 'package:hexagonal_weather_app/module/weather/application/service/location_service.dart'
    as _i7;
import 'package:hexagonal_weather_app/module/weather/application/service/weather_service.dart'
    as _i10;
import 'package:hexagonal_weather_app/module/weather/di/location_module.dart'
    as _i11;
import 'package:hexagonal_weather_app/module/weather/di/weather_module.dart'
    as _i12;
import 'package:injectable/injectable.dart' as _i2;

extension GetItInjectableX on _i1.GetIt {
// initializes the registration of main-scope dependencies inside of GetIt
  _i1.GetIt init({
    String? environment,
    _i2.EnvironmentFilter? environmentFilter,
  }) {
    final gh = _i2.GetItHelper(
      this,
      environment,
      environmentFilter,
    );
    final locationModule = _$LocationModule();
    final weatherModule = _$WeatherModule();
    gh.factory<_i3.GetLocationUseCase>(() => locationModule.getWeatherUseCase);
    gh.factory<_i4.GetWeatherUseCase>(() => weatherModule.getWeatherUseCase);
    gh.singleton<_i5.LocationAdapter>(() => _i5.LocationAdapter());
    gh.factory<_i6.LocationPort>(() => locationModule.weatherPort);
    gh.singleton<_i7.LocationService>(
        () => _i7.LocationService(locationPort: gh<_i6.LocationPort>()));
    gh.singleton<_i8.WeatherAdapter>(() => _i8.WeatherAdapter());
    gh.factory<_i9.WeatherPort>(() => weatherModule.weatherPort);
    gh.singleton<_i10.WeatherService>(
        () => _i10.WeatherService(weatherPort: gh<_i9.WeatherPort>()));
    return this;
  }
}

class _$LocationModule extends _i11.LocationModule {}

class _$WeatherModule extends _i12.WeatherModule {}
