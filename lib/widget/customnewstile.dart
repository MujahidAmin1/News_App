import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';
import '../model/article.dart';

Widget customListTile(Article article) {
  return Container(
    margin: const EdgeInsets.all(12.0),
    padding: const EdgeInsets.all(8.0),
    decoration: BoxDecoration(
      color: Colors.grey[200],
      borderRadius: BorderRadius.circular(4),
    ),
    child: Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          height: 200,
          width: double.infinity,
          decoration: BoxDecoration(
            image: DecorationImage(
                image: CachedNetworkImageProvider(article.urlToImage ?? "")
                ),
            borderRadius: BorderRadius.circular(4.0),
          ),
        ),
        const SizedBox(height: 8),
        Container(
          padding: const EdgeInsets.all(2),
          decoration: BoxDecoration(
            color: Colors.purpleAccent,
            borderRadius: BorderRadius.circular(4.0),
          ),
          child: Text(article.source!.name!,
              style: const TextStyle(color: Colors.white)),
        ),
        const SizedBox(height: 8),
        Text(
          article.title!,
          style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16.0),
        )
      ],
    ),
  );
}
