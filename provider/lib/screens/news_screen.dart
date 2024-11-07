import 'package:flutter/material.dart';
import '/providers/news_provider.dart';
import 'package:provider/provider.dart';

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
              context.read<NewsModel>().addNews("New News");
            },
          ),
        ],
      ),
      body: Consumer<NewsModel>(
        builder: (context, newsProvider, index) {
          if (newsProvider.news.isEmpty) {
            return const Center(child: CircularProgressIndicator());
          } else {
            return ListView.builder(
              padding: const EdgeInsets.all(16.0),
              itemCount: newsProvider.news.length,
              itemBuilder: (context, index) {
                return Card(
                  elevation: 2,
                  margin: const EdgeInsets.symmetric(vertical: 8),
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          newsProvider.news[index].title!,
                          style: const TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(height: 8),
                        Text(
                          newsProvider.news[index].description ?? "",
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
                                  context, newsProvider.news[index].description ?? "", index);
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
    final TextEditingController controller = TextEditingController(text: newsArticle);

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
                context.read<NewsModel>().editNews(index, controller.text);
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
