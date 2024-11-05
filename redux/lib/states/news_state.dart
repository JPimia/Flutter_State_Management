const List<NewsItem> defaultNewsArticles = [
  NewsItem(title: "News header 1", description: "Demo text 12321312321"),
  NewsItem(title: "News header 2", description: "Demo text 12321312321"),
  NewsItem(title: "News header 3", description: "Demo text 12321312321"),
];

class NewsState {
  final List<NewsItem> newsArticles;
  const NewsState({this.newsArticles = defaultNewsArticles});
}

// news_item.dart
class NewsItem {
  final String? title;
  final String? description;

  const NewsItem({this.title, this.description});
}
