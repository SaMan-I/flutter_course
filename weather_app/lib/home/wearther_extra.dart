import 'package:flutter/material.dart';
import 'package:weather_app/constants/assets_const.dart';
import 'package:weather_app/constants/color_const.dart';
import 'package:weather_app/witget/weather_extra_card.dart';

class WeatherExtra extends StatelessWidget {
  const WeatherExtra({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Column(
        children: [
          TabBar(
            isScrollable: true,
            labelStyle: const TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
            ),
            labelColor: AppColors.blackColor,
            indicatorColor: AppColors.blackColor,
            dividerColor: AppColors.titleTextColor,
            tabs: [
              const Tab(text: 'Today'),
              const Tab(text: 'Tommorow'),
              SizedBox(
                width: MediaQuery.of(context).size.width * 0.4,
                child: const Tab(text: 'Next 7 Day >'),
              ),
            ],
          ),
          SizedBox(
            height: 130,
            child: ListView.builder(
              itemCount: 7,
              scrollDirection: Axis.horizontal,
              itemBuilder: (BuildContext contex, int index) {
                return const WeatherExtraCard(
                  title: '13:00',
                  icon: AssetsConst.sunCloud,
                  degree: '21 0',
                );
              },
            ),
          )
        ],
      ),
    );
  }
}
