import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:news_app/controller/services/newsServices.dart';
import 'package:news_app/model/newsModel.dart';

class NewsDataProvider extends ChangeNotifier {
  List<NewsModel> news = [];
  NewsModel? selectedNews;
  fetchNewsData() async {
    news = [];
    notifyListeners();
    List<dynamic> newsData = await NewsServices.getNews();

    for (var data in newsData) {
      NewsModel currentNewsData = NewsModel.fromMap(data);
      news.add(currentNewsData);
      notifyListeners();
    }

    log(news.length.toString());
  }

  updateSelectedNews(NewsModel newsData) {
    selectedNews = newsData;
    notifyListeners();
  }
}
