import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:weather_app/constants/color_const.dart';

class CityTimeWidget extends StatelessWidget {
  const CityTimeWidget({
    required this.city,
    required this.time,
    super.key,
  });

  final String city;
  final String time;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          city,
          style: const TextStyle(
            fontSize: 32,
            fontWeight: FontWeight.w500,
            color: AppColors.titleTextColor,
          ),
        ),
        const SizedBox(height: 7),
        Text(
          getUiDateTime(),
          style: const TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.w400,
            color: AppColors.titleTextColor,
          ),
        ),
      ],
    );
  }

  String getUiDateTime() {
    try {
      final dateTime = DateTime.parse(time);
      final uiDateTime = DateFormat('EEEE  H:m  MMMM  d').format(dateTime);
      return uiDateTime;
    } catch (e) {
      return time;
    }
  }
}
