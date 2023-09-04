import 'dart:convert';
import 'dart:developer';

import 'package:http/http.dart'; 
import 'package:news_app1/model/article.dart';

class ApiService {
  final endPointUrl =
      "https://newsapi.org/v2/top-headlines?country=us&apiKey=2fcdb105c8ba47ae8938ede2d5d9cd1d";

  Future<List<Article>> getArticle() async {
    Response response = await get(Uri.parse(endPointUrl));

    if (response.statusCode == 200) {
      final json = jsonDecode(response.body);
      List<dynamic> body = json['articles'];
      List<Article> articles =
          body.map((dynamic e) => Article.fromJson(e)).toList();
      log(articles.length.toString());
      return articles; 
    } else {
      throw ("Can't get articles");
    }
  }
}
