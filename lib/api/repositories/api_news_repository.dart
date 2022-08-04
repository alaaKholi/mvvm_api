import 'package:dio/dio.dart';
import 'package:mvvm_api/api/dio_helper.dart';
import 'package:mvvm_api/models/news_model.dart';
import 'package:mvvm_api/api/repositories/base_news_repository.dart';

class API_NewsRepository extends NewsRepository {
  @override
  Future<List<NewsModel>> getAllNews() async {
    List<NewsModel> news = [];
    try {
      var response =
          // await Dio().get('https://jsonplaceholder.typicode.com/posts');
          await DioHelper().get('/posts');
      var list = response.data as List;
      news = list.map((element) => NewsModel.fromJson(element)).toList();
    } catch (exception) {
      print(exception);
    }
    print(news);
    return news;
  }
}
