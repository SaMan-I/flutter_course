import 'dart:convert';

import 'package:http/http.dart';
import 'package:get/get.dart';
import 'package:news_app_getx/models/country.dart';
import 'package:news_app_getx/models/news_data.dart';

const apiLink =
    'https://newsapi.org/v2/top-headlines?country=us&apiKey=f02f3cb2a5774444a7473f76ad482df3';

class NewsController extends GetxController {
  NewsController(this.http);

  final Client http;

  RxBool isLoading = false.obs;
  RxString data = ''.obs;
  RxString error = ''.obs;
  Rx<NewsData?> newsData = Rx<NewsData?>(null);
  Rx<Country> country = countries[0].obs;

  Future<void> getNews() async {
    try {
      isLoading.value = true;
      final uri = Uri.parse(getUrl());
      final response = await http.get(uri);
      //print(response);
      isLoading.value = false;
      if (response.statusCode == 200) {
        final decodedData = jsonDecode(response.body) as Map<String, dynamic>;
        newsData.value = NewsData.fromJson(decodedData);
        data.value = response.body;
        //print(data.value);
      } else {
        error.value = 'Error ${response.statusCode}';
        //print(error.value);
      }
    } catch (e) {
      error.value = 'Error ${e.toString()}';
      //print(error.value);
    }
  }

  void changeCountry(Country value) {
    country.value = value;
  }

  String getUrl() {
    return 'https://newsapi.org/v2/top-headlines?country=${country.value.code}&apiKey=f02f3cb2a5774444a7473f76ad482df3';
  }
}
