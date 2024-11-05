import '/actions/news_actions.dart';
import '/states/news_state.dart';

NewsState newsReducer(NewsState state, dynamic action) {
  if (action is AddNewsAction) {
    // Create a new NewsItem and add it to the list
    final newArticle =
        NewsItem(title: action.title, description: action.description);
    return NewsState(newsArticles: [...state.newsArticles, newArticle]);
  } else if (action is EditNewsAction) {
    // Ensure we modify the specific NewsItem at the index by creating a new list
    final updatedArticles = List<NewsItem>.from(state.newsArticles);
    // Update only the description of the specific NewsItem
    final oldNewsItem = updatedArticles[action.index];
    updatedArticles[action.index] = NewsItem(
      title: oldNewsItem.title,
      description: action.newDescription, // Update the description
    );
    return NewsState(newsArticles: updatedArticles);
  }
  return state;
}
