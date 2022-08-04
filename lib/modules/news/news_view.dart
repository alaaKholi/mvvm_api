import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lazy_load_scrollview/lazy_load_scrollview.dart';
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
              : LazyLoadScrollView(
                  onEndOfPage: newsViewModel.loadNextPage,
                  isLoading: newsViewModel.lastPage,
                  child: ListView.builder(
                    itemCount: newsViewModel.newsList.length,
                    itemBuilder: (context, index) {
                      // print(
                      //     '${newsViewModel.newsList[index].newsModel.title.toString().codeUnitAt(0)}${newsViewModel.newsList[index].newsModel.title.toString().codeUnitAt(5)}');
                      return ListTile(
                        title: Text(newsViewModel
                            .newsList[index].newsModel.title
                            .toString()),
                        leading: CachedNetworkImage(
                          //adding a cached photo for every item with fixed color with hex number according to the ascii code for the 1,5 charachter of its title string
                          imageUrl:
                              'https://via.placeholder.com/600/${newsViewModel.newsList[index].newsModel.title.toString().codeUnitAt(0)}${newsViewModel.newsList[index].newsModel.title.toString().codeUnitAt(5)}',
                          placeholder: (context, url) =>
                              const CircularProgressIndicator(),
                          errorWidget: (context, url, error) =>
                              const Icon(Icons.error),
                        ),
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => NewsDetailesView(
                                newsDetailesViewModel:
                                    newsViewModel.newsList[index],
                              ),
                            ),
                          );
                        },
                      );
                    },
                  ),
                ),
        ),
      ),
    );
  }
}
