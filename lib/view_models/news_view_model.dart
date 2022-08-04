import 'package:get/state_manager.dart';

import '../models/news_model.dart';
import '../api/repositories/base_news_repository.dart';
import 'news_detailes_view_model.dart';

class NewsViewModel extends GetxController {
  final String title = 'All News';

  RxList<NewsDetailesViewModel> newsList = <NewsDetailesViewModel>[].obs;
  var isLoading = true.obs;

  @override
  void onInit() {
    super.onInit();
    fetchAllNews();
  }

  NewsRepository? newsRepository;
  NewsViewModel({this.newsRepository});

  Future<void> fetchAllNews() async {
    List<NewsModel> list = await newsRepository!.getAllNews();
    newsList =
        RxList(list.map((element) => NewsDetailesViewModel(element)).toList());
    isLoading.value = false;
  }
}
