import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import '/actions/news_actions.dart';
import '/states/app_state.dart';
import '/states/news_state.dart';

class NewsScreen extends StatelessWidget {
  const NewsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
            icon: const Icon(Icons.add),
            onPressed: () {
              // Dispatch action to add new news item
              StoreProvider.of<AppState>(context).dispatch(
                AddNewsAction("New News Item", "Demo text 12321312321"),
              );
            },
          ),
        ],
      ),
      body: StoreConnector<AppState, NewsState>(
        converter: (store) => store.state.newsState,
        builder: (context, newsState) {
          if (newsState.newsArticles.isEmpty) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else {
            return ListView.builder(
              padding: const EdgeInsets.all(16.0),
              itemCount: newsState.newsArticles.length,
              itemBuilder: (context, index) {
                final article = newsState.newsArticles[index];
                return Card(
                  elevation: 2,
                  margin: const EdgeInsets.symmetric(vertical: 8),
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          article.title!,
                          style: const TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(height: 8),
                        Text(
                          article.description!,
                          style: const TextStyle(
                            fontSize: 14,
                            color: Colors.grey,
                          ),
                        ),
                        const SizedBox(height: 16),
                        Align(
                          alignment: Alignment.centerRight,
                          child: ElevatedButton(
                            onPressed: () {
                              _showEditDialog(
                                  context, article.description!, index);
                            },
                            child: const Text("View"),
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              },
            );
          }
        },
      ),
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
