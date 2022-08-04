import 'package:mvvm_api/api/dio_helper.dart';
import 'package:mvvm_api/models/news_model.dart';
import 'package:mvvm_api/api/repositories/base_news_repository.dart';

import '../../models/pagination_filter_model.dart';

class API_NewsRepository extends NewsRepository {
  @override
  Future<List<NewsModel>> getAllNews(PaginationFilter filter) async {
    List<NewsModel> news = [];
    try {
      var response =
          await DioHelper().get('/posts',
              queryParameters: {'_page': filter.page, '_limit': filter.limit});
      var list = response.data as List;
      news = list.map((element) => NewsModel.fromJson(element)).toList();
    } catch (exception) {
      print(exception);
    }
    print(news);
    print('-----------------');
    return news;
  }
}
