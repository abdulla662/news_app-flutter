import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:news_today/Screens/categories_view.dart';
import 'package:news_today/categories/category.dart';
import 'package:news_today/classes/categorymodel.dart';

class CategoriesListView extends StatelessWidget {
  final List<Categorymodel> imglist = const [
    Categorymodel(categoryname: "business", image: 'assets/business.jpg'),
    Categorymodel(categoryname: "sports", image: 'assets/health.avif'),
    Categorymodel(categoryname: "General", image: 'assets/general.jpg'),
    Categorymodel(categoryname: "health", image: 'assets/health.avif'),
    Categorymodel(categoryname: "science", image: 'assets/science.avif'),
    Categorymodel(categoryname: "technology", image: 'assets/technology.jpeg'),
    Categorymodel(
        categoryname: 'entertainment', image: 'assets/entertaiment.avif')
  ];
  const CategoriesListView({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        height: 100,
        child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: imglist.length,
          itemBuilder: (context, index) {
            return Category_card(category: imglist[index]);
          },
        ));
  }
}
