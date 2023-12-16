// import 'package:flutter/material.dart';
// import 'dart:math';

// class HomePage extends StatelessWidget {
//   const HomePage({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: const Color(0xffFFE93B),
//       appBar: AppBar(
//         centerTitle: true,
//         backgroundColor: const Color(0xffDA0037),
//         title: const Text(
//           'Dice App',
//           style: TextStyle(
//             color: Colors.white,
//             fontSize: 28,
//             fontWeight: FontWeight.bold,
//           ),
//         ),
//       ),
//       body: const HomePageBody(),
//     );
//   }
// }

// class HomePageBody extends StatefulWidget {
//   const HomePageBody({super.key});

//   @override
//   State<HomePageBody> createState() => _HomePageBodyState();
// }

// class _HomePageBodyState extends State<HomePageBody> {
//   int firstDiceindex = 1;
//   int secondDiceindex = 2;

//   Random random = Random();

//   void changeDice() {
//     firstDiceindex = random.nextInt(6) + 1;
//     secondDiceindex = random.nextInt(6) + 1;

//     setState(() {});
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Center(
//       child: Row(
//         children: [
//           const SizedBox(width: 20),
//           Expanded(
//             child: InkWell(
//               onTap: changeDice,
//               child: Image.asset('assets/images/dice_$firstDiceindex.png'),
//             ),
//           ),
//           const SizedBox(width: 20),
//           Expanded(
//             child: InkWell(
//               onTap: changeDice,
//               child: Image.asset('assets/images/dice_$secondDiceindex.png'),
//             ),
//           ),
//           const SizedBox(width: 20),
//         ],
//       ),
//     );
//   }
// }
