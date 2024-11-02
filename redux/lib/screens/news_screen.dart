import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import '/actions/news_actions.dart';
import '/states/app_state.dart';
import '/states/news_state.dart';

class NewsScreen extends StatelessWidget {
  const NewsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return StoreConnector<AppState, NewsState>(
      converter: (store) => store.state.newsState,
      builder: (context, newsState) {
        if (newsState.newsArticles.isEmpty) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        } else {
          return ListView.builder(
            itemCount: newsState.newsArticles.length,
            itemBuilder: (context, index) {
              return ListTile(
                title: Text(newsState.newsArticles[index]),
                trailing: ElevatedButton(
                  onPressed: () {
                    _showEditDialog(
                        context, newsState.newsArticles[index], index);
                  },
                  child: const Text("View"),
                ),
              );
            },
          );
        }
      },
    );
  }

  void _showEditDialog(BuildContext context, String newsArticle, int index) {
    final TextEditingController controller =
        TextEditingController(text: newsArticle);

    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text("News Article"),
          content: TextField(
            controller: controller,
            decoration: const InputDecoration(hintText: "Enter news article"),
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: const Text("Close"),
            ),
            TextButton(
              onPressed: () {
                StoreProvider.of<AppState>(context).dispatch(
                  EditNewsAction(index, controller.text),
                );
                Navigator.of(context).pop();
              },
              child: const Text("Save"),
            ),
          ],
        );
      },
    );
  }
}
