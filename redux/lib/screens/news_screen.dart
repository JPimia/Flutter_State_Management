import 'package:bloc_example/news_bloc/news_event.dart';
import 'package:bloc_example/news_bloc/news_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '/news_bloc/news_bloc.dart';

class NewsScreen extends StatelessWidget {
  const NewsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<NewsBloc, NewsState>(
      builder: (context, state) {
        if (state is NewsLoading) {
          context.read<NewsBloc>().add(LoadNews()); // Load the news articles
          return Center(child: CircularProgressIndicator());
        } else if (state is NewsLoaded) {
          return ListView.builder(
            itemCount: state.newsArticles.length,
            itemBuilder: (context, index) {
              return ListTile(
                title: Text(state.newsArticles[index]),
                trailing: ElevatedButton(
                  onPressed: () {
                    // You can add more logic for "View" action here
                    _showEditDialog(context, state.newsArticles[index], index);
                  },
                  child: Text("View"),
                ),
              );
            },
          );
        }
        return Container();
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
                context.read<NewsBloc>().add(
                      EditNews(index, controller.text),
                    );
                Navigator.of(context).pop();
              },
              child: Text("Save"),
            ),
          ],
        );
      },
    );
  }
}
