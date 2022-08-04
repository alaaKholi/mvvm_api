import '../models/news_model.dart';
import '../api/repositories/base_news_repository.dart';
import 'news_detailes_view_model.dart';

class NewsViewModel {
  final String title = 'All News';
  NewsRepository? newsRepository;
  NewsViewModel({this.newsRepository});

  Future<List<NewsDetailesViewModel>> fetchAllNews() async {
    List<NewsModel> list = await newsRepository!.getAllNews();
    return list.map((element) => NewsDetailesViewModel(element)).toList();
  }

}
