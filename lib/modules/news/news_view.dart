import 'package:flutter/material.dart';
import 'package:mvvm_api/modules/news/news_detailes_view.dart';
import '../../api/repositories/api_news_repository.dart';
import '../../view_models/news_detailes_view_model.dart';
import '../../view_models/news_view_model.dart';

class NewsView extends StatelessWidget {
  NewsView({Key? key}) : super(key: key);
  var newsViewModel = NewsViewModel(newsRepository: API_NewsRepository());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(newsViewModel.title)),
      body: Center(
        child: FutureBuilder<List<NewsDetailesViewModel>>(
          future: newsViewModel.fetchAllNews(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const CircularProgressIndicator();
            } else if (snapshot.connectionState == ConnectionState.done &&
                snapshot.hasData) {
              var news = snapshot.data;
              return ListView.builder(
                itemCount: news?.length,
                itemBuilder: (context, index) => ListTile(
                  title: Text(news![index].newsModel.title.toString()),
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => NewsDetailesView(
                                newsDetailesViewModel: news[index])));
                  },
                ),
              );
            }
            return const CircularProgressIndicator();
          },
        ),
      ),
    );
  }
}
