import 'dart:convert';

import 'package:final_project_newspocket/models/news_model.dart';
import 'package:http/http.dart' as http;

import '../api.dart';

class NewsService {
  Future<List<NewsModel?>> getNews() async {
    var url = ('$apinews');
    //var headers = {'Content-Type': 'aplication/json'};

    var response = await http.get(
      Uri.parse(url),
      //headers: headers,
    );

    print(response.body);

    if (response.statusCode == 200) {
      List data = jsonDecode(response.body)['articles'];
      List<NewsModel?> news = [];

      for (var item in data) {
        news.add(NewsModel?.fromJson(item));
      }
      print("newslist" + news.toString());
      return news;
    } else {
      throw Exception('Gagal Get News');
    }
  }

  Future<List<NewsModel?>> getHeadlineNews() async {
    var url = ('$apiheadlinenews');
    //var headers = {'Content-Type': 'aplication/json'};

    var response = await http.get(
      Uri.parse(url),
      //headers: headers,
    );

    print(response.body);

    if (response.statusCode == 200) {
      List data = jsonDecode(response.body)['articles'];
      List<NewsModel?> news = [];

      for (var item in data) {
        news.add(NewsModel?.fromJson(item));
      }
      print("newslist" + news.toString());
      return news;
    } else {
      throw Exception('Gagal Get Headlinenews');
    }
  }
}
