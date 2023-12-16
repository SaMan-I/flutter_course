import 'dart:math';

import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String smail = '🥵';
  int degree = 0;
  Color backgroundColor = Colors.amber;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        centerTitle: true,
        title: const Text(
          'Weather App Mini',
          style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
        ),
      ),
      body: Container(
        alignment: Alignment.center,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Text(
              smail,
              style: const TextStyle(fontSize: 100),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  '$degree',
                  style: const TextStyle(fontSize: 100),
                ),
                const Text(
                  '°C',
                  style: TextStyle(fontSize: 40),
                ),
              ],
            ),
            TextButton(
              style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all(Colors.grey),
                  overlayColor: MaterialStateProperty.all(Colors.white10),
                  shape: MaterialStateProperty.all(
                    RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15),
                    ),
                  ),
                  side: MaterialStateProperty.all(const BorderSide(
                    color: Colors.white60,
                    width: 1,
                  ))),
              onPressed: () {
                changeWeather();
              },
              child: const Text(
                'Аба ырайын алмаштырыныз!',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 20,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  void changeWeather() {
    Random random = Random();
    setState(() {
      var result = random.nextInt(6);
      if (result == 0) {
        smail = '🥵';
        degree = next(min: 30, max: 40);
        backgroundColor = Colors.amber;
      } else if (result == 1) {
        smail = '🤩';
        degree = next(min: 20, max: 30);
        backgroundColor = Colors.green;
      } else if (result == 2) {
        smail = '🌧';
        degree = next(min: 10, max: 15);
        backgroundColor = Colors.grey;
      } else if (result == 3) {
        smail = '😶‍🌫️';
        degree = next(min: 1, max: 10);
        backgroundColor = Colors.blueGrey;
      } else if (result == 5) {
        smail = '❄️';
        degree = next(min: 0, max: -10);
        backgroundColor = Colors.red;
      } else if (result == 4) {
        smail = '🥶';
        degree = next(min: -10, max: -50);
        backgroundColor = Colors.blue;
      }
    });
  }

  int next({required min, required max}) {
    Random random = Random();
    return min + random.nextInt(max - min);
  }
}
