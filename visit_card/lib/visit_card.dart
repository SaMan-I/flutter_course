import 'package:flutter/material.dart';

class VisitCard extends StatefulWidget {
  const VisitCard({super.key});

  @override
  State<VisitCard> createState() => _VisitCardState();
}

class _VisitCardState extends State<VisitCard> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xff056C5C),
      appBar: AppBar(
        centerTitle: true,
        title: const Text('Visit Card'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              'Samat Manat',
              style: TextStyle(
                color: Colors.white,
                fontFamily: 'Pacifico',
                fontSize: 50,
                fontWeight: FontWeight.bold,
              ),
            ),
            const Text(
              'Flutter Developer',
              style: TextStyle(
                color: Colors.white,
                fontSize: 32,
                decorationColor: Colors.white,
                height: 0,
              ),
            ),
            const Divider(
              color: Colors.white,
              thickness: 2,
              indent: 60,
              endIndent: 60,
              height: 0,
            ),
            const SizedBox(height: 25),
            Container(
              padding: const EdgeInsets.only(left: 50),
              height: 60,
              width: double.infinity,
              color: Colors.white,
              child: Row(
                children: [
                  Image.asset(
                    'assets/images/phone.png',
                    height: 30,
                    width: 30,
                  ),
                  const SizedBox(width: 20),
                  const Text(
                    '+996 555 50 50 50',
                    style: TextStyle(
                      color: Color(0xff056C5C),
                      fontSize: 25,
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 25),
            Container(
              padding: const EdgeInsets.only(left: 50),
              height: 60,
              width: double.infinity,
              color: Colors.white,
              child: Row(
                children: [
                  Image.asset(
                    'assets/images/mail.png',
                    height: 30,
                    width: 30,
                  ),
                  const SizedBox(width: 20),
                  const Text(
                    'samat@gmail.com',
                    style: TextStyle(
                      color: Color(0xff056C5C),
                      fontSize: 25,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
