import 'package:flutter/material.dart';
import 'package:news_app1/model/article.dart';
import 'package:news_app1/screens/news_detailed_screen.dart';
import 'package:news_app1/services/apiservice.dart';
import 'package:news_app1/widget/customnewstile.dart';

class NewsScreen extends StatefulWidget {
  const NewsScreen({super.key});

  @override
  State<NewsScreen> createState() => _NewsScreenState();
}

class _NewsScreenState extends State<NewsScreen> {
  late Future<List<Article>> articles;
  final GlobalKey<RefreshIndicatorState> _refreshIndicatorKey =
      GlobalKey<RefreshIndicatorState>();

  @override
  void initState() {
    articles = ApiService().getArticle();
    super.initState();
  }

  Future<void> _onRefresh() async {
    await Future.delayed(const Duration(seconds: 3));
    await ApiService().getArticle();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('News'),
      ),
      body: FutureBuilder(
        future: articles,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            List<Article> article = snapshot.data!;
            return RefreshIndicator(
              key: _refreshIndicatorKey,
              onRefresh: _onRefresh,
              child: ListView.builder(
                itemCount: snapshot.data!.length,
                itemBuilder: (context, index) {
                  return GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) {
                              return NewsDetailScreen(article: article[index]);
                            },
                          ),
                        );
                      },
                      child: customListTile(article[index]));
                },
              ),
            );
          }
          return const Center(
            child: CircularProgressIndicator(),
          );
        },
      ),
    );
  }
}
