import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart';
import 'package:news_app_getx/home/controller/news_controller.dart';
import 'package:news_app_getx/home/view/news_detail_page.dart';
import 'package:news_app_getx/models/country.dart';
import 'package:news_app_getx/widgets/news_card.dart';

class NewsPage extends GetView<NewsController> {
  const NewsPage({super.key});

  @override
  Widget build(BuildContext context) {
    NewsController controller = Get.put(NewsController(Client()))..getNews();
    return Scaffold(
      appBar: AppBar(
        title: const Text('News with GetX'),
        centerTitle: true,
        actions: [
          PopupMenuButton(
            onSelected: (value) {
              controller.changeCountry(value);
              controller.getNews();
            },
            itemBuilder: (BuildContext contex) {
              return countries
                  .map(
                    (e) => PopupMenuItem(
                      value: e,
                      child: Text(e.name),
                    ),
                  )
                  .toList();
            },
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Center(
          child: Obx(() {
            if (controller.isLoading.value &&
                controller.data.value.isEmpty &&
                controller.error.value.isEmpty) {
              return const CircularProgressIndicator();
            } else if (controller.newsData.value != null) {
              return Localizations.override(
                context: context,
                locale: Locale(controller.country.value.langCode),
                child: ListView.builder(
                  itemCount: controller.newsData.value!.articles.length,
                  itemBuilder: (BuildContext context, int index) {
                    final article = controller.newsData.value!.articles[index];
                    return InkWell(
                      child: NewsCard(article),
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (BuildContext context) =>
                                ArticleDetailPage(article),
                          ),
                        );
                      },
                    );
                  },
                ),
              );
            } else if (controller.error.value.isNotEmpty) {
              return Text(controller.error.value);
            } else {
              return const SizedBox.shrink();
            }
          }),
        ),
      ),
    );
  }
}
