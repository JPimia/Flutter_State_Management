import 'package:flutter/material.dart';
import '/models/news_model.dart';

class NewsModel with ChangeNotifier {
  List<News> _newsArticles = [
    News(title: "News header 1", description: "Demo text 12321312321"),
    News(title: "News header 2", description: "Demo text 12321312321"),
    News(title: "News header 3", description: "Demo text 12321312321"),
  ];

  List<News> get news => _newsArticles;

  void editNews(int index, String newContent) {
    news[index].description = newContent;
    notifyListeners();
  }

  void addNews(String title) {
    _newsArticles.add(News(title: "New News", description: "Demo text 12321312321"));
    notifyListeners();
  }
}
