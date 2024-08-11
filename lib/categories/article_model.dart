class article_model {
  final String? image;
  final String? title;
  final String? subtitle;
  article_model(
      {required this.image, required this.title, required this.subtitle});
  factory article_model.fromjson(json) {
    return article_model(
        image: json['urlToImage'],
        title: json['title'],
        subtitle: json['description']);
  }
}
