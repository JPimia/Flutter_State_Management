import 'package:flutter/material.dart';
import '/providers/news_provider.dart';
import 'package:provider/provider.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class NewsScreen extends ConsumerWidget {
  const NewsScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final news = ref.watch(newsProvider);
    return news.isEmpty
        ? const Center(child: CircularProgressIndicator())
        : ListView.builder(
            itemCount: news.length,
            itemBuilder: (context, index) {
              return ListTile(
                title: Text(news[index].title),
                trailing: ElevatedButton(
                  onPressed: () {
                    // You can add more logic for "View" action here
                    _showEditDialog(context, news[index].title, index);
                  },
                  child: Text("View"),
                ),
              );
            },
          );
  }
}

void _showEditDialog(BuildContext context, String newsArticle, int index) {
  final TextEditingController controller =
      TextEditingController(text: newsArticle);

  showDialog(
    context: context,
    builder: (context) {
      return AlertDialog(
        title: Text("News Article"),
        content: TextField(
          controller: controller,
          decoration: InputDecoration(hintText: "Enter news article"),
        ),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            child: Text("Close"),
          ),
          TextButton(
            onPressed: () {
              context.read<NewsModel>().editNews(index, controller.text);
              Navigator.of(context).pop();
            },
            child: Text("Save"),
          ),
        ],
      );
    },
  );
}
