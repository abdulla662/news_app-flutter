import 'dart:math';

import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:loading_indicator/loading_indicator.dart';
import 'package:news_today/categories/article_model.dart';
import 'package:news_today/categories/categories_list_view.dart';
import 'package:news_today/categories/category.dart';
import 'package:news_today/categories/news_tile.dart';
import 'package:news_today/categories/newstilebuilder.dart';
import 'package:news_today/classes/categorymodel.dart';
import 'package:news_today/services/news_services.dart';

void main() {
  runApp(Home_Page());
}

class Home_Page extends StatefulWidget {
  const Home_Page({super.key});

  @override
  State<Home_Page> createState() => _MyWidgetState();
}

class _MyWidgetState extends State<Home_Page> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          title: const Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "News",
                style: TextStyle(color: Colors.black),
              ),
              Text(
                "Cloud",
                style: TextStyle(color: Colors.orange),
              )
            ],
          ),
        ),
        body: const Padding(
          padding: EdgeInsets.symmetric(horizontal: 16),
          child: CustomScrollView(
            physics: BouncingScrollPhysics(),
            slivers: [
              SliverToBoxAdapter(
                child: CategoriesListView(),
              ),
              SliverToBoxAdapter(
                child: SizedBox(
                  height: 32,
                ),
              ),
              News_api_builder(
                category: 'general',
              ),
            ],
          ),
        ));
  }
}

class News_api_builder extends StatefulWidget {
  const News_api_builder({super.key, required this.category});
  final String category;

  @override
  State<News_api_builder> createState() => _News_api_builderState();
}

class _News_api_builderState extends State<News_api_builder> {
  var future;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    future = NewsServices(Dio()).getnews(category: widget.category);
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<article_model>>(
        future: future,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return Newstilebuilder(articlesmodels: snapshot.data ?? []);
          } else if (snapshot.hasError) {
            return SliverToBoxAdapter(
                child: Center(
              child: Text('opps there is an error '),
            ));
          } else {
            return const SliverToBoxAdapter(
              child: LoadingIndicator(indicatorType: Indicator.ballPulse),
            );
          }
        });
  }
}
