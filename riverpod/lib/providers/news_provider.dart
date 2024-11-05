import '/models/news_model.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final newsProvider =
    StateNotifierProvider<NewsModel, List<News>>((ref) => NewsModel());

class NewsModel extends StateNotifier<List<News>> {
  NewsModel()
      : super([
          News(title: "News 1", description: "demo description blablabla"),
          News(title: "News 2", description: "demo description blablabla"),
          News(title: "News 3", description: "demo description blablabla"),
        ]);

  List<News> get news => state;

  void editNews(int index, String newContent) {
    state = [
      for (int i = 0; i < state.length; i++)
        if (i == index)
          News(title: state[index].title, description: newContent)
        else
          state[i]
    ];
  }

  void addNews(String title, String description) {
    state = [...state, News(title: title, description: description)];
  }
}
