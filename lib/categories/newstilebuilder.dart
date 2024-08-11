import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:loading_indicator/loading_indicator.dart';
import 'package:news_today/categories/article_model.dart';
import 'package:news_today/categories/news_tile.dart';
import 'package:news_today/services/news_services.dart';

class Newstilebuilder extends StatelessWidget {
  final List<article_model> articlesmodels;

  const Newstilebuilder({super.key, required this.articlesmodels});

  @override
  Widget build(BuildContext context) {
    return Expanded(
        child: SliverList(
            delegate: SliverChildBuilderDelegate(
      childCount: articlesmodels.length,
      (context, index) {
        return NewsTile(
          articles: articlesmodels[index],
        );
      },
    )));
  }
}
