import 'package:flutter/material.dart';

class GenderCard extends StatelessWidget {
  const GenderCard({
    super.key,
    required this.icon,
    required this.text,
    required this.isActive,
    required this.onTap,
  });

  final IconData icon;
  final String text;
  final bool isActive;
  final void Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Card(
        color: const Color(0xff0B0120),
        child: Column(
          children: [
            const SizedBox(height: 10),
            Icon(
              icon,
              size: 110,
              color:
                  isActive ? const Color(0xffFF1065) : const Color(0xffCECCD2),
            ),
            Text(
              text,
              style: TextStyle(
                fontSize: 22,
                color: isActive
                    ? const Color(0xffFF1065)
                    : const Color(0xffCECCD2),
              ),
            ),
            const SizedBox(height: 15),
          ],
        ),
      ),
    );
  }
}
