import 'package:flutter/material.dart';
import 'package:news_today/Screens/categories_view.dart';
import 'package:news_today/classes/categorymodel.dart';

class Category_card extends StatelessWidget {
  const Category_card({super.key, required this.category});
  final Categorymodel category;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) =>
                  CategoriesView(category: category.categoryname)),
        );
      },
      child: Padding(
        padding: EdgeInsets.only(right: 16),
        child: Container(
          height: 100,
          width: 200,
          decoration: BoxDecoration(
              image: DecorationImage(
                  image: AssetImage(category.image), fit: BoxFit.fill),
              borderRadius: BorderRadius.circular(16),
              color: Colors.amber),
          child: Center(
              child: Text(
            category.categoryname,
            style: TextStyle(
                color: Colors.white, fontWeight: FontWeight.bold, fontSize: 18),
          )),
        ),
      ),
    );
  }
}
