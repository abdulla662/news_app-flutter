import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:news_today/Screens/home.dart';
import 'package:news_today/services/news_services.dart';

void main() {
  runApp(Main_Page());
}

class Main_Page extends StatelessWidget {
  const Main_Page({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Home_Page(),
    );
  }
}
