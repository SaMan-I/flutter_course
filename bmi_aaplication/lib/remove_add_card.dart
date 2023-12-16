import 'package:bmi_aaplication/sircule_button.dart';
import 'package:flutter/material.dart';

class RemoveAddCard extends StatelessWidget {
  const RemoveAddCard({
    super.key,
    required this.text,
    required this.value,
    required this.onPressedRemove,
    required this.onPressedAdd,
  });

  final String text;
  final double value;
  final void Function()? onPressedRemove;
  final void Function()? onPressedAdd;

  @override
  Widget build(BuildContext context) {
    return Card(
      color: const Color(0xff0B0120),
      child: Padding(
        padding: const EdgeInsets.fromLTRB(15, 20, 15, 20),
        child: Column(
          children: [
            Text(
              text,
              style: const TextStyle(
                fontSize: 22,
                color: Color(0xffCECCD2),
              ),
            ),
            Text(
              '${value.toInt()}',
              style: const TextStyle(
                fontSize: 40,
                fontWeight: FontWeight.bold,
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SirculeButton(
                  icon: Icons.remove,
                  onPressed: onPressedRemove,
                ),
                SirculeButton(
                  icon: Icons.add,
                  onPressed: onPressedAdd,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
