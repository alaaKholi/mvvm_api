import '../../models/news_model.dart';

abstract class NewsRepository {
  Future<List<NewsModel>> getAllNews();
  //Future<NewsModel> getNewsById(int id);
}
