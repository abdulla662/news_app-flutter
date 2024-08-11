import 'dart:math';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:news_today/categories/article_model.dart';

class NewsTile extends StatelessWidget {
  const NewsTile({super.key, required this.articles});
  final article_model articles;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ClipRRect(
            borderRadius: BorderRadius.circular(8),
            child: articles.image != null
                ? Image.network(
                    height: 200,
                    width: double.infinity,
                    fit: BoxFit.cover,
                    articles.image!)
                : Image.network(
                    'https://as1.ftcdn.net/v2/jpg/02/48/42/64/1000_F_248426448_NVKLywWqArG2ADUxDq6QprtIzsF82dMF.jpg')),
        const SizedBox(
          height: 12,
        ),
        Text(
          overflow: TextOverflow.ellipsis,
          maxLines: 2,
          articles.title!,
          style: TextStyle(
              color: Colors.black, fontWeight: FontWeight.w500, fontSize: 20),
        ),
        const SizedBox(
          height: 12,
        ),
        Text(
          overflow: TextOverflow.ellipsis,
          maxLines: 2,
          articles.subtitle ?? '',
          style: TextStyle(color: Colors.grey, fontSize: 14),
        ),
      ],
    );
  }
}
