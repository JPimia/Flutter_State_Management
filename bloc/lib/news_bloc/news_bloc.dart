// Bloc
import 'package:bloc_example/news_bloc/news_event.dart';
import 'package:bloc_example/news_bloc/news_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class NewsBloc extends Bloc<NewsEvent, NewsState> {
  final List<String> _newsArticles = [
    "News header 1",
    "News header 2",
    "News header 3"
  ];

  NewsBloc() : super(NewsLoading()) {
    on<LoadNews>((event, emit) {
      emit(NewsLoaded(_newsArticles));
    });

    on<EditNews>((event, emit) {
      if (state is NewsLoaded) {
        final updatedNewsArticles =
            List<String>.from((state as NewsLoaded).newsArticles);
        updatedNewsArticles[event.index] = event.newNewsArticle;
        emit(NewsLoaded(updatedNewsArticles));
      }
    });
  }
}
