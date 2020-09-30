import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hive/hive.dart';

part 'favorites.g.dart';

@HiveType(typeId: 1)
@JsonSerializable(nullable: false)
class FavoritesModel {
  FavoritesModel({
    this.articleID,
    this.articleName,
    this.articleRoute,
    this.articleLinks,
  });

  /// A necessary factory constructor for creating a new instance
  /// from a map. Pass the map to the generated `_$FavoritesModelFromJson()` constructor.
  // factory FavoritesModel.fromJson(Map<String, dynamic> json) =>
  //     _$FavoritesModelFromJson(json);

  /// `toJson` is the convention for a class to declare support for serialization
  /// to JSON. The implementation simply calls the private, generated
  /// helper method `_$FavoritesModelToJson`.
  // Map<String, dynamic> toJson() => _$FavoritesModelToJson(this);

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
}
