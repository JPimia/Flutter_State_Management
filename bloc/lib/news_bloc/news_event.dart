import 'package:equatable/equatable.dart';

abstract class NewsEvent extends Equatable {
  @override
  List<Object> get props => [];
}

class LoadNews extends NewsEvent {}

class EditNews extends NewsEvent {
  final int index;
  final String? title;
  final String? description;
  EditNews(this.index, this.title, this.description);

  @override
  List<Object> get props => [index, title ?? '', description!];
}

class AddNews extends NewsEvent {
  final String? title;
  final String? description;
  AddNews(this.title, this.description);

  @override
  List<Object> get props => [title!, description!];
}
