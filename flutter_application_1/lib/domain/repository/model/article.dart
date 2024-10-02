import 'package:json_annotation/json_annotation.dart';

part 'article.g.dart';

@JsonSerializable()
class Article {
  Article({
    required this.id,
    required this.url,
    required this.width,
    required this.height,
    required this.breeds,
  });

  @JsonKey(fromJson: _idFromJson)
  final String id;
  final String url;
  final int width;
  final int height;
  final List<Breed> breeds;

  factory Article.fromJson(Map<String, dynamic> json) => _$ArticleFromJson(json);
  Map<String, dynamic> toJson() => _$ArticleToJson(this);
  static String _idFromJson(dynamic id) => id.toString();
}

@JsonSerializable()
class Breed {
  Breed({
    required this.id,
    required this.name,
    required this.temperament,
    required this.origin,
    required this.lifeSpan,
    required this.description,
    this.wikipediaUrl,
  });

  @JsonKey(fromJson: _idFromJson)
  final String id;
  final String? name;
  final String? temperament;
  final String? origin;
  final String? lifeSpan;
  final String? description;
  @JsonKey(name: 'wikipedia_url')
  final String? wikipediaUrl;

  factory Breed.fromJson(Map<String, dynamic> json) => _$BreedFromJson(json);
  Map<String, dynamic> toJson() => _$BreedToJson(this);
  static String _idFromJson(dynamic id) => id.toString();
}
