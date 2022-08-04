import '../models/news_model.dart';

class NewsDetailesViewModel {
  NewsModel newsModel;
  NewsDetailesViewModel(this.newsModel);

  get id => newsModel.id;
  get userId => newsModel.userId;
  get title => newsModel.title;
  get body => newsModel.body;
}
