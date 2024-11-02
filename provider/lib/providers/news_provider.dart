import 'package:flutter/material.dart';
import '/models/news_model.dart';

class NewsModel with ChangeNotifier {
  List<News> _newsArticles = [
    News(title: "News header 1"),
    News(title: "News header 2"),
    News(title: "News header 3"),
  ];

  List<News> get news => _newsArticles;

  void editNews(int index, String newContent) {
    news[index].title = newContent;
    notifyListeners();
  }
}
