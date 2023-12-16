import 'condition_model.dart';

class Current {
  final String lastUpdated;
  final double tempC;
  final int isDay;
  final Condition condition;
  final double windMPH;
  final double windKPH;
  final String windDir;
  final num precipMM;
  final num precipIn;
  final int humidity;
  final int cloude;
  final double feelsLikeC;
  final num visKM;

  const Current({
    required this.lastUpdated,
    required this.tempC,
    required this.isDay,
    required this.condition,
    required this.windMPH,
    required this.windKPH,
    required this.windDir,
    required this.precipIn,
    required this.precipMM,
    required this.humidity,
    required this.cloude,
    required this.feelsLikeC,
    required this.visKM,
  });

  factory Current.fromWeatherApi(Map<String, dynamic> json) {
    return Current(
      lastUpdated: json['last_updated'],
      tempC: json['temp_c'],
      isDay: json['is_day'],
      condition: Condition.fromWeatherApi(json['condition']),
      windMPH: json['wind_mph'],
      windKPH: json['wind_kph'],
      windDir: json['wind_dir'],
      precipMM: json['precip_mm'],
      precipIn: json['precip_in'],
      humidity: json['humidity'],
      cloude: json['cloud'],
      feelsLikeC: json['feelslike_c'],
      visKM: json['vis_km'],
    );
  }
}
