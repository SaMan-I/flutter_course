import 'dart:math';

import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => HJomePageState();
}

class HJomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffFFE93B),
      appBar: AppBar(
        backgroundColor: const Color(0xffDA0037),
        centerTitle: true,
        title: const Text(
          'Dice App',
          style: TextStyle(
            color: Colors.white,
            fontSize: 28,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: const GamePage(),
    );
  }
}

class GamePage extends StatefulWidget {
  const GamePage({super.key});

  @override
  State<GamePage> createState() => _GamePageState();
}

class _GamePageState extends State<GamePage> {
  Random random = Random();

  int clientFirstIndex = 1;
  int clientSecondIndex = 1;
  int clientSumm = 0;

  void clientAction() {
    clientFirstIndex = random.nextInt(6) + 1;
    clientSecondIndex = random.nextInt(6) + 1;
    clientSumm = clientSumm + clientFirstIndex + clientSecondIndex;
    setState(() {});
    result();
    if (clientSumm < 50) {
      manageAppAction();
    }
  }

  int appFirstIndex = 1;
  int appSecondIndex = 1;
  int appSumm = 0;

  void manageAppAction() {
    showDialog(
      context: context,
      builder: (ctx) {
        return const AlertDialog(content: CircularProgressIndicator());
      },
    );

    Future.delayed(const Duration(seconds: 1)).whenComplete(
      () {
        Navigator.pop(context);
        appAction();
      },
    );
  }

  void appAction() {
    appFirstIndex = random.nextInt(6) + 1;
    appSecondIndex = random.nextInt(6) + 1;
    appSumm = appSumm + appFirstIndex + appSecondIndex;
    setState(() {});
    result();
  }

  void result() {
    if (clientSumm >= 50) {
      showDialog(
        context: context,
        builder: (ctx) {
          return AlertDialog(
            title: const Text('Дуркурогон кол чабуулар! 👏 👏 👏'),
            actions: [
              TextButton(
                onPressed: resetAll,
                child: const Text('Ok'),
              ),
            ],
          );
        },
      );
    } else if (appSumm >= 50) {
      showDialog(
        context: context,
        builder: (ctx) {
          return AlertDialog(
            title: const Text('Олдун го даддин! 👎 👎 👎'),
            actions: [
              TextButton(
                onPressed: resetAll,
                child: const Text('Ok'),
              ),
            ],
          );
        },
      );
    }
  }

  void resetAll() {
    clientFirstIndex = 1;
    clientSecondIndex = 1;
    clientSumm = 0;

    appFirstIndex = 1;
    appSecondIndex = 1;
    appSumm = 0;

    Navigator.pop(context);
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Text(
            'Мен $clientSumm',
            style: const TextStyle(
              fontSize: 32,
              fontWeight: FontWeight.bold,
            ),
          ),
          Row(
            children: [
              const SizedBox(width: 20),
              Expanded(
                child: InkWell(
                  onTap: clientAction,
                  child:
                      Image.asset('assets/images/dice_$clientFirstIndex.png'),
                ),
              ),
              const SizedBox(width: 20),
              Expanded(
                child: InkWell(
                  onTap: clientAction,
                  child:
                      Image.asset('assets/images/dice_$clientSecondIndex.png'),
                ),
              ),
              const SizedBox(width: 20),
            ],
          ),
          Row(
            children: [
              const SizedBox(width: 20),
              Expanded(
                child: Image.asset('assets/images/dice_$appFirstIndex.png'),
              ),
              const SizedBox(width: 20),
              Expanded(
                child: Image.asset('assets/images/dice_$appSecondIndex.png'),
              ),
              const SizedBox(width: 20),
            ],
          ),
          Text(
            'Бот $appSumm',
            style: const TextStyle(
              fontSize: 32,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }
}
