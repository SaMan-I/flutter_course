import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:weather_app/constants/assets_const.dart';
import 'package:weather_app/witget/weather_info_card.dart';

class WeatherInfoCards extends StatelessWidget {
  const WeatherInfoCards({
    super.key,
    required this.rainFallValue,
    required this.windSpeed,
    required this.humidityPercent,
  });

  final String rainFallValue;
  final String windSpeed;
  final String humidityPercent;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        WeatherInfoCard(
          icon: SvgPicture.asset(
            AssetsConst.reinFall,
            height: 70,
            fit: BoxFit.cover,
          ),
          title: 'RainFall',
          value: rainFallValue,
        ),
        WeatherInfoCard(
          icon: SvgPicture.asset(
            AssetsConst.wind,
            height: 70,
            fit: BoxFit.cover,
          ),
          title: 'Wind',
          value: windSpeed,
        ),
        WeatherInfoCard(
          icon: Padding(
            padding: const EdgeInsets.only(top: 15),
            child: SvgPicture.asset(
              AssetsConst.humidity,
              height: 60,
              fit: BoxFit.fitHeight,
            ),
          ),
          title: 'Humidity',
          value: humidityPercent,
        )
      ],
    );
  }
}
