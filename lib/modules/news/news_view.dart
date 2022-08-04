import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mvvm_api/modules/news/news_detailes_view.dart';
import '../../api/repositories/api_news_repository.dart';
import '../../view_models/news_view_model.dart';

class NewsView extends StatelessWidget {
  NewsView({Key? key}) : super(key: key);
  final newsViewModel =
      Get.put(NewsViewModel(newsRepository: API_NewsRepository()));

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(newsViewModel.title)),
      body: Center(
        child: Obx(
          () => newsViewModel.isLoading.value == true
              ? const CircularProgressIndicator()
              : ListView.builder(
                  itemCount: newsViewModel.newsList.length,
                  itemBuilder: (context, index) => ListTile(
                    title: Text(newsViewModel.newsList[index].newsModel.title
                        .toString()),
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => NewsDetailesView(
                              newsDetailesViewModel:
                                  newsViewModel.newsList[index]),
                        ),
                      );
                    },
                  ),
                ),
        ),
      ),
    );
  }
}
