import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

// Events
abstract class NewsEvent extends Equatable {
  @override
  List<Object> get props => [];
}

class LoadNews extends NewsEvent {}

class EditNews extends NewsEvent {
  final int index;
  final String newNewsArticle;
  EditNews(this.index, this.newNewsArticle);
}
