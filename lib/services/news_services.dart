import 'package:dio/dio.dart';
import 'package:news_today/categories/article_model.dart';

class NewsServices {
  final Dio dio;
  NewsServices(this.dio);

  Future<List<article_model>> getnews({required String category}) async {
    try {
      Response response = await dio.get(
          'https://newsapi.org/v2/top-headlines?country=us&apiKey=b0e9f38a67b14e888b908239d43086ce&category=$category');
      var jsonData = response.data;
      List<dynamic> articles = jsonData['articles'];
      List<article_model> articleslist = [];
      for (var article in articles) {
        article_model articlemodel = article_model.fromjson(article);
        articleslist.add(articlemodel);
      }
      return articleslist;
    } catch (e) {
      return [];
    }
  }
}
