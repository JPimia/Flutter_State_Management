import 'package:flutter/material.dart';
import '/providers/news_provider.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class NewsScreen extends ConsumerWidget {
  const NewsScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final news = ref.watch(newsProvider);

    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
            icon: const Icon(Icons.add),
            onPressed: () {
              // Add logic to add new news item
              ref
                  .read(newsProvider.notifier)
                  .addNews("New News Item", "Demo text 12321312321");
            },
          ),
        ],
      ),
      body: news.isEmpty
          ? const Center(child: CircularProgressIndicator())
          : ListView.builder(
              padding: const EdgeInsets.all(16.0),
              itemCount: news.length,
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
                          news[index].title!,
                          style: const TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(height: 8),
                        Text(
                          news[index].description!,
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
                              _showEditDialog(context, news[index].description!,
                                  index, ref);
                            },
                            child: const Text("View"),
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
    );
  }
}

void _showEditDialog(
    BuildContext context, String newsArticle, int index, WidgetRef ref) {
  final TextEditingController controller =
      TextEditingController(text: newsArticle);

  showDialog(
    context: context,
    builder: (context) {
      return AlertDialog(
        title: const Text("Edit News Article"),
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
              ref.read(newsProvider.notifier).editNews(index, controller.text);
              Navigator.of(context).pop();
            },
            child: const Text("Save"),
          ),
        ],
      );
    },
  );
}
