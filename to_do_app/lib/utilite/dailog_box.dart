import 'package:flutter/material.dart';
import 'package:to_do_app/utilite/my_buttons.dart';

class DialogBox extends StatelessWidget {
  final TextEditingController controller;
  final VoidCallback onSave;
  final VoidCallback onCansel;

  const DialogBox({
    super.key,
    required this.controller,
    required this.onSave,
    required this.onCansel,
  });

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: Colors.blueGrey[50],
      content: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(50),
        ),
        height: 130,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            TextField(
              controller: controller,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                hintText: 'Add a new task: ',
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                MyButtons(text: 'Save', onPressed: onSave),
                const SizedBox(width: 10),
                MyButtons(text: 'Cancel', onPressed: onCansel),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
