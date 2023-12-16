import 'package:flutter/material.dart';
import 'package:flutter_timer_bloc/timer/view/timer_page.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Timer',
      theme: ThemeData(
        colorScheme: const ColorScheme.light(
          primary: Color.fromRGBO(71, 74, 126, 1),
        ),
      ),
      home: const TimerPage(),
    );
  }
}
