import 'package:equatable/equatable.dart';

abstract class NewsState extends Equatable {
  @override
  List<Object> get props => [];
}

class NewsLoading extends NewsState {}

class NewsLoaded extends NewsState {
  final List<NewsArticle> newsArticles;
  NewsLoaded(this.newsArticles);

  @override
  List<Object> get props => [newsArticles];
}

class NewsArticle extends Equatable {
  final String title;
  final String description;

  NewsArticle(this.title, this.description);

  @override
  List<Object> get props => [title, description];
}
