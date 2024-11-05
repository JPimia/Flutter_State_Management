import '/models/news_model.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final newsProvider =
    StateNotifierProvider<NewsModel, List<News>>((ref) => NewsModel());

class NewsModel extends StateNotifier<List<News>> {
  NewsModel()
      : super([
          News(title: "News header 1"),
          News(title: "News header 2"),
          News(title: "News header 3"),
        ]);

  List<News> get news => state;

  void editNews(int index, String newContent) {
    state = [
      for (int i = 0; i < state.length; i++)
        if (i == index) News(title: newContent) else state[i]
    ];
  }
}
