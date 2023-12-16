import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.deepPurple,
        title: const Text(
          'Tapshyrma 01',
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: const Center(child: CounterRebuild()),
    );
  }
}

class CounterRebuild extends StatefulWidget {
  const CounterRebuild({super.key});

  @override
  State<CounterRebuild> createState() => _CounterRebuildState();
}

class _CounterRebuildState extends State<CounterRebuild> {
  int count = 0;
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Card(
          elevation: 8,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 100, vertical: 20),
            child: Text(
              'Counter:  ${count.toString().padLeft(4, '0')}',
              style: const TextStyle(fontSize: 25),
            ),
          ),
        ),
        const SizedBox(height: 30),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            ElevatedButton(
                style: ElevatedButton.styleFrom(
                  elevation: 10,
                ),
                onPressed: () {
                  count--;
                  setState(() {});
                },
                child: const Icon(Icons.thumb_down)),
            ElevatedButton(
                style: ElevatedButton.styleFrom(
                  elevation: 10,
                ),
                onPressed: () {
                  count = 0;
                  setState(() {});
                },
                child: const Icon(Icons.refresh_rounded)),
            ElevatedButton(
                style: ElevatedButton.styleFrom(
                  elevation: 10,
                ),
                onPressed: () {
                  count++;
                  setState(() {});
                },
                child: const Icon(Icons.thumb_up)),
          ],
        ),
      ],
    );
  }
}
