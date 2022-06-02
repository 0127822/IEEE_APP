
class Article {
  final int? id;
  final String title;
  final String imageUrl;
  final String date;
  final String? content;
  final String routeName = '/articleDetails';

  const Article(
      {required this.title,
      required this.date,
      required this.imageUrl,
      this.content,
      this.id});

  factory Article.fromJson(Map<String, dynamic> json) {
    Article article = Article(
        id: json['id'],
        title: json['attributes']['author'],
        date: json['attributes']["publishedAt"],
        imageUrl: json['attributes']["image"],
        content: json['attributes']["content"]);
    return article;
  }
}
class ArticlesResponse {
  List<Article> articles;
  ArticlesResponse({required this.articles});

  factory ArticlesResponse.fromJson(Map<String, dynamic> json) {
    ArticlesResponse articlesResponse = ArticlesResponse(articles: []);
    for (var c in json['data']) {
      articlesResponse.articles.add(Article.fromJson(c));
    }
    return articlesResponse;
  }
}
