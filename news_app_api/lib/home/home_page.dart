import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:news_app/constants/app_colors.dart';
import 'package:news_app/home/article_detail_page.dart';
import 'package:news_app/model/article_data.dart';

import 'package:news_app/widgets/news_card.dart';

const linkAPI =
    //'https://newsapi.org/v2/top-headlines?country=us&apiKey=5ea6b14fb6084c9dae2f9a00f75cb044';
    'https://newsapi.org/v2/top-headlines?sources=bbc-news&apiKey=f02f3cb2a5774444a7473f76ad482df3';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  AtricleData? articleData;

  final Dio dio = Dio();

  Future<void> getData() async {
    final response = await dio.get(linkAPI);
    if (response.statusCode == 200 || response.statusCode == 201) {
      final body = response.data;
      articleData = AtricleData.fromJson(body);
      setState(() {});
    }
  }

  @override
  void initState() {
    super.initState();
    getData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: AppColors.orang,
        foregroundColor: AppColors.white,
        title: const Text('News Aggregator'),
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.more_vert),
          ),
        ],
      ),
      body: articleData != null
          ? ListView.builder(
              padding: const EdgeInsets.all(20),
              itemCount: articleData?.articles.length,
              itemBuilder: (context, index) {
                return InkWell(
                  onTap: () {
                    Navigator.push<void>(
                      context,
                      MaterialPageRoute<void>(
                        builder: (BuildContext context) => ArticleDetailPage(
                          articleData!.articles[index],
                        ),
                      ),
                    );
                  },
                  child: NewsCard(articleData!.articles[index]),
                );
              },
            )
          : const Center(
              child: CircularProgressIndicator(),
            ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: AppColors.orang,
        foregroundColor: AppColors.white,
        child: const Icon(Icons.search),
        onPressed: () {},
      ),
    );
  }
}
