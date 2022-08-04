
import '../../models/news_model.dart';
import '../../models/pagination_filter_model.dart';

abstract class NewsRepository {
  Future<List<NewsModel>> getAllNews(PaginationFilter filter);
  //Future<NewsModel> getNewsById(int id);
}
