class Condition {
  final String text;
  final String icon;
  final int code;

  const Condition({
    required this.text,
    required this.icon,
    required this.code,
  });

  factory Condition.fromWeatherApi(Map<String, dynamic> json) {
    return Condition(
      text: json['text'],
      icon: json['icon'],
      code: json['code'],
    );
  }
  String getWeatherIconIndex() {
    if (1000 <= code && code <= 1002) return 'sun';
    if (1180 <= code && code <= 1246) return 'cloud_rain';
    if (code == 1003) return 'sun_cloud';
    if (1006 <= code && code <= 1147) return 'cloud';
    if (1273 <= code && code <= 1276) return 'sun';
    return 'big_cloud';
  }
}
