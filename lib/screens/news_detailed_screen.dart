// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:news_app1/model/article.dart';

class NewsDetailScreen extends StatelessWidget {
  Article article;
  NewsDetailScreen({super.key, required this.article});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(article.source!.name!),
      ),
      body: ListView(
        padding: const EdgeInsets.symmetric(horizontal: 6),
        physics: const BouncingScrollPhysics(
            decelerationRate: ScrollDecelerationRate.normal),
        children: [
          article.urlToImage != null
          ? Container(
            height: 300,
            width: double.infinity,
            decoration: BoxDecoration(
              image: DecorationImage(
                  image: CachedNetworkImageProvider(
                    article.urlToImage!
                  ),
                  fit: BoxFit.cover),
              borderRadius: BorderRadius.circular(6.0),
            ),
          )
         : Container(
          height: 300,
            width: double.infinity,
            decoration: BoxDecoration(
            
              borderRadius: BorderRadius.circular(6.0),
            ),
          child: const Icon(Icons.hide_image),
          ),
          const SizedBox(height: 8),
          Text(article.description!,
              style:
                  const TextStyle(fontSize: 17, fontWeight: FontWeight.bold)),
          const SizedBox(height: 10),
          Text(
            article.content!,
            style: const TextStyle(fontSize: 18),
          ),
        ],
      ),
    );
  }
}
