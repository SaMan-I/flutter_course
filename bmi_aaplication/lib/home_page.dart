import 'package:bmi_aaplication/bottom_navigation_buttom.dart';
import 'package:bmi_aaplication/enum.dart';
import 'package:bmi_aaplication/gender_card.dart';
import 'package:bmi_aaplication/height_dard.dart';
import 'package:bmi_aaplication/remove_add_card.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({
    super.key,
  });

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  Gender gender = Gender.male;
  double height = 180;
  double weight = 60;
  int age = 28;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xff211834),
      appBar: AppBar(
        backgroundColor: const Color(0xff211834),
        title: const Text('BMI CALCULATOR'),
        centerTitle: true,
        titleTextStyle:
            const TextStyle(fontWeight: FontWeight.bold, fontSize: 22),
      ),
      body: Padding(
        padding: const EdgeInsets.fromLTRB(20, 20, 20, 25),
        child: Column(
          children: [
            Row(
              children: [
                Expanded(
                  child: GenderCard(
                    icon: Icons.male,
                    text: 'MALE',
                    isActive: gender == Gender.male,
                    onTap: () {
                      setState(() {
                        gender = Gender.male;
                      });
                    },
                  ),
                ),
                // const SizedBox(height: 10),
                Expanded(
                  child: GenderCard(
                    icon: Icons.female,
                    text: 'FEMALE',
                    isActive: gender == Gender.female,
                    onTap: () {
                      setState(() {
                        gender = Gender.female;
                      });
                    },
                  ),
                ),
              ],
            ),
            const SizedBox(height: 15),
            HeightCard(
              value: height,
              onChanged: (v) {
                height = v;
                setState(() {});
              },
            ),
            const SizedBox(height: 15),
            Row(
              children: [
                Expanded(
                  child: RemoveAddCard(
                    text: 'WEIGHT',
                    value: weight,
                    onPressedRemove: () {
                      weight--;
                      setState(() {});
                    },
                    onPressedAdd: () {
                      weight++;
                      setState(() {});
                    },
                  ),
                ),
                // const SizedBox(width: 10),
                Expanded(
                  child: RemoveAddCard(
                    text: 'AGE',
                    value: age.toDouble(),
                    onPressedRemove: () {
                      age--;
                      setState(() {});
                    },
                    onPressedAdd: () {
                      age++;
                      setState(() {});
                    },
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationButtom(
        text: 'CALCULATE',
        onPressed: () {
          final bmi = calculate();
          showDialog(
            context: context,
            builder: (ctx) {
              return AlertDialog(
                backgroundColor: const Color(0xff0B0120),
                title: Center(
                  child: Text(
                    bmi.$1,
                    style: TextStyle(
                      fontSize: 30,
                      color: bmi.$4,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                content: Text(
                  '${bmi.$2}',
                  style: const TextStyle(
                    fontSize: 60,
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                  textAlign: TextAlign.center,
                ),
                actions: [
                  Text(
                    bmi.$3,
                    style: const TextStyle(color: Colors.white),
                    textAlign: TextAlign.center,
                  ),
                ],
              );
            },
          );
        },
      ),
    );
  }

  (String, double, String, Color) calculate() {
    final v = weight / ((height * height) / 10000);
    final result = double.parse(v.toStringAsFixed(1));

    if (result < 18.5) {
      final x = 20 * ((height * height) / 10000);
      final y = x - weight;
      return (
        'Арыксыз',
        result,
        'Сиздин дене салмагыңыз aрык. ${y.roundToDouble()} киллограм салмак кошунуз!\nСураныч кучтуроок тамак жениз :)',
        Colors.red,
      );
    } else if (result >= 18.5 && result < 25) {
      return (
        'Нормалдуусуз',
        result,
        'Сиздин дене салмагыңыз нормалдуу. Азаматсыз!',
        Colors.green,
      );
    } else {
      final x = 24 * ((height * height) / 10000);
      final y = weight - x;
      return (
        'Толуксуз',
        result,
        'Сиздин салмагыныз бир аз ашыкча. Сураныч ${y.roundToDouble()} киллограмга арыктаныз!',
        Colors.red,
      );
    }
  }
}
