class WeatherModel {
  String country;
  String city;
  double temp;
  

  WeatherModel({
    required this.country,
    required this.city,
    required this.temp,
  });
}

class Country {
  String name;
  String capital;

  Country({
    required this.name,
    required this.capital,
  });
}

class City {
  String name;

  City({required this.name});
}
