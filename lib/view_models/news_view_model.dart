import 'package:get/state_manager.dart';
import '../models/news_model.dart';
import '../api/repositories/base_news_repository.dart';
import '../models/pagination_filter_model.dart';
import 'news_detailes_view_model.dart';

class NewsViewModel extends GetxController {
  final String title = 'All News';

  final RxList<NewsDetailesViewModel> _newsList = <NewsDetailesViewModel>[].obs;
  final RxBool isLoading = true.obs;
  final _paginationFilter = PaginationFilter().obs;
  final _lastPage = false.obs;

  List<NewsDetailesViewModel> get newsList => _newsList.toList();
  int get limit => _paginationFilter.value.limit!;
  int get _page => _paginationFilter.value.page!;
  bool get lastPage => _lastPage.value;

  @override
  void onInit() {
    // ever is called every time the Rx variable emits a new value.
    ever(_paginationFilter, (_) => fetchAllNews());
    _changePaginationFilter(1, 6);
    super.onInit();
  }

  NewsRepository? newsRepository;
  NewsViewModel({this.newsRepository});

  Future<void> fetchAllNews() async {
    List<NewsModel> list =
        await newsRepository!.getAllNews(_paginationFilter.value);
    if (list.isEmpty) {
      _lastPage.value = true;
      return;
    }
    final moreLoadedNews =
        RxList(list.map((element) => NewsDetailesViewModel(element)).toList());
    _newsList.addAll(moreLoadedNews);
    isLoading.value = false;
  }

  void _changePaginationFilter(int page, int limit) {
    _paginationFilter.update((val) {
      val?.page = page;
      val?.limit = limit;
    });
  }

  void loadNextPage() => _changePaginationFilter(_page + 1, limit);
}


