import '/news_bloc/news_event.dart';
import '/news_bloc/news_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class NewsBloc extends Bloc<NewsEvent, NewsState> {
  final List<NewsArticle> _newsArticles = [
    NewsArticle("News header 1", "Description 1"),
    NewsArticle("News header 2", "Description 2"),
    NewsArticle("News header 3", "Description 3"),
  ];

  NewsBloc() : super(NewsLoading()) {
    on<LoadNews>(_onLoadNews);
    on<EditNews>(_onEditNews);
    on<AddNews>(_onAddNews);
  }

  Future<void> _onLoadNews(event, emit) async {
    emit(NewsLoaded(_newsArticles));
  }

  Future<void> _onEditNews(event, emit) async {
    if (state is NewsLoaded) {
      final updatedNewsArticles = List<NewsArticle>.from((state as NewsLoaded).newsArticles);
      final newsArticle = updatedNewsArticles[event.index];
      updatedNewsArticles[event.index] = NewsArticle(newsArticle.title, event.description!);
      emit(NewsLoaded(updatedNewsArticles));
    }
  }

  Future<void> _onAddNews(event, emit) async {
    if (state is NewsLoaded) {
      final updatedNewsArticles = List<NewsArticle>.from((state as NewsLoaded).newsArticles);
      updatedNewsArticles.add(NewsArticle(event.title!, event.description!));
      emit(NewsLoaded(updatedNewsArticles));
    }
  }
}
