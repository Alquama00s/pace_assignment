import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:news_app/models/source.dart';
part 'article.freezed.dart';
part 'article.g.dart';

@freezed
class Article with _$Article {
  factory Article(
      {required Source source,
      String? author,
      required String title,
      required String description,
      String? url,
      String? urlToImage,
      required String publishedAt,
      required String content}) = _Article;

  factory Article.fromJson(Map<String, dynamic> json) =>
      _$ArticleFromJson(json);
}
