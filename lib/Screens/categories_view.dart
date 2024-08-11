import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:news_today/Screens/home.dart';
import 'package:news_today/classes/categorymodel.dart';

class CategoriesView extends StatelessWidget {
  const CategoriesView({super.key, required this.category});
  final String category;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          News_api_builder(
            category: category,
          ),
        ],
      ),
    );
  }
}
