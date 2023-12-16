import 'package:flutter/material.dart';
import 'package:weather_app/home/wearther_extra.dart';
import 'package:weather_app/witget/curent_weather_card.dart';
import 'package:weather_app/witget/city_time.dart';
import 'package:weather_app/witget/weather_info_cards.dart';
import '../model/weather_model.dart';

class HomeBody extends StatelessWidget {
  const HomeBody({
    super.key,
    required this.weather,
  });

  final Weather weather;

  @override
  Widget build(BuildContext context) {
    
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        CityTimeWidget(
          city: '${weather.location.name}\n${weather.location.country}',
          time: weather.location.localTime,
        ),
        CurrentWetherCard(
          degree: '${weather.current.tempC.toInt()}',
          weatherState: weather.current.condition.text,
          // icon: AssetsConst.bigCloud,
          icon:
              'assets/weatherIcons/${weather.current.condition.getWeatherIconIndex()}.svg',
        ),
        WeatherInfoCards(
          rainFallValue: '${weather.current.precipMM}cm',
          windSpeed: '${weather.current.windKPH}km/h',
          humidityPercent: '${weather.current.humidity}%',
        ),
        const SizedBox(height: 20),
        const WeatherExtra(),
        Container(),
      ],
    );
  }
}
