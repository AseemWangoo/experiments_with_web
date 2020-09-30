import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hive/hive.dart';

part 'articles.g.dart';

@HiveType(typeId: 1)
@JsonSerializable(nullable: false)
class ArticlesModel {
  ArticlesModel({
    this.articleID,
    this.articleName,
    this.articleRoute,
    this.articleLinks,
  });

  /// A necessary factory constructor for creating a new instance
  /// from a map. Pass the map to the generated `_$ArticlesModelFromJson()` constructor.
  factory ArticlesModel.fromJson(Map<String, dynamic> json) =>
      _$ArticlesModelFromJson(json);

  /// `toJson` is the convention for a class to declare support for serialization
  /// to JSON. The implementation simply calls the private, generated
  /// helper method `_$ArticlesModelToJson`.
  Map<String, dynamic> toJson() => _$ArticlesModelToJson(this);

  @HiveField(0)
  @JsonKey(name: 'article_id')
  String articleID;

  @HiveField(1)
  @JsonKey(name: 'article_name')
  String articleName;

  @HiveField(2)
  @JsonKey(name: 'article_route')
  String articleRoute;

  @HiveField(3)
  @JsonKey(name: 'article_links')
  List<String> articleLinks;

  @HiveField(4)
  @JsonKey(name: 'is_favorite')
  bool isFavorite;
}
