import 'package:final_project_newspocket/models/news_model.dart';
import 'package:final_project_newspocket/service/news_service.dart';
import 'package:flutter/cupertino.dart';

class NewsProvider with ChangeNotifier {
  List<NewsModel?> _news = [];
  List<NewsModel?> _headline = [];

  List<NewsModel?> get news => _news;
  List<NewsModel?> get headline => _headline;

  set news(List<NewsModel?> news) {
    _news = news;
    notifyListeners();
  }

  set headline(List<NewsModel?> headline) {
    _headline = headline;
    notifyListeners();
  }

  Future<void> getNews() async {
    try {
      List<NewsModel?> news = await NewsService().getNews();
      _news = news;
    } catch (e) {
      print(e);
    }
  }

  Future<void> getheadlinenews() async {
    try {
      List<NewsModel?> headline = await NewsService().getHeadlineNews();
      _headline = headline;
    } catch (e) {
      print(e);
    }
  }
}
