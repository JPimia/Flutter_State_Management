import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

// States
abstract class NewsState extends Equatable {
  @override
  List<Object> get props => [];
}

class NewsLoading extends NewsState {}

class NewsLoaded extends NewsState {
  final List<String> newsArticles;
  NewsLoaded(this.newsArticles);

  @override
  List<Object> get props => [newsArticles];
}
