import '/actions/news_actions.dart';
import '/states/news_state.dart';

NewsState newsReducer(NewsState state, dynamic action) {
  if (action is EditNewsAction) {
    final updatedNews = List<String>.from(state.newsArticles);
    updatedNews[action.index] = action.newNewsArticle;
    return NewsState(newsArticles: updatedNews);
  }
  return state;
}
