import 'package:flutter/material.dart';
import 'package:weathermodel/weather_model.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<WeatherModel> weathers = [
    WeatherModel(country: 'Kyrgyzstan', city: 'Bishkek', temp: 15.5),
    WeatherModel(country: 'Kyrgyzstan', city: 'Chui', temp: 13.7),
    WeatherModel(country: 'Kyrgyzstan', city: 'Batken', temp: 18.0),
    WeatherModel(country: 'Kyrgyzstan', city: 'Jalal-Abad', temp: 17.3),
    WeatherModel(country: 'Kyrgyzstan', city: 'Osh', temp: 20.0),
    WeatherModel(country: 'Kyrgyzstan', city: 'Naryn', temp: 7.5),
    WeatherModel(country: 'Kyrgyzstan', city: 'Talas', temp: 12.5),
    WeatherModel(country: 'Kyrgyzstan', city: 'Ysyk-Kol', temp: 13.5),
  ];

  int currentCityIndex = 0;

  void changeCity() {
    // List<double> cityTemperatures = [];
    // for (int i = 0; i < weathers.length; i++) {
    //   double temp = weathers[i].temp;
    //   cityTemperatures.add(temp);
    // }

    setState(() {
      currentCityIndex = (currentCityIndex + 1) % weathers.length;
    });
  }

  int temperature() {
    return 0;
  }

  void changeWeather() {}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        centerTitle: true,
        title: const Text('Weather model'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Text(
              ' ${weathers[currentCityIndex].country} \n ${weathers[currentCityIndex].city}',
              textAlign: TextAlign.center,
              style: const TextStyle(
                fontSize: 40,
                fontWeight: FontWeight.w400,
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  ' ${weathers[currentCityIndex].temp}',
                  style: const TextStyle(
                    fontSize: 50,
                    fontWeight: FontWeight.w400,
                  ),
                ),
                const Text(
                  ' ℃',
                  style: TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ],
            ),
            Text(
              weathers[currentCityIndex].temp < 10
                  ? 'Na ulitse holodno, \n odevaite teplee!'
                  : 'Na ulitse teplo \n odevaite po legche!',
              textAlign: TextAlign.center,
              style: const TextStyle(
                fontSize: 30,
              ),
            ),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                elevation: 5,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(5),
                ),
              ),
              onPressed: () {
                changeCity();
              },
              child: const Text(
                'Press me',
                style: TextStyle(fontSize: 20),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
