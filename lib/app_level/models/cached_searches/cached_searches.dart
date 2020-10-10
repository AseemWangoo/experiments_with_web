import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hive/hive.dart';

part 'cached_searches.g.dart';

@HiveType(typeId: 2)
@JsonSerializable()
class CachedSearches {
  CachedSearches({
    this.phrase,
    this.occurances,
    this.clickedResult,
    this.projectStartedOn,
  });

  /// A necessary factory constructor for creating a new instance
  /// from a map. Pass the map to the generated `_$CachedSearchesFromJson()` constructor.
  factory CachedSearches.fromJson(Map<String, dynamic> json) =>
      _$CachedSearchesFromJson(json);

  /// `toJson` is the convention for a class to declare support for serialization
  /// to JSON. The implementation simply calls the private, generated
  /// helper method `_$CachedSearchesToJson`.
  Map<String, dynamic> toJson() => _$CachedSearchesToJson(this);

  @HiveField(0)
  @JsonKey(name: 'phrase')
  String phrase;

  @HiveField(1)
  @JsonKey(name: 'occurances')
  int occurances;

  @HiveField(2)
  @JsonKey(name: 'clicked_result')
  String clickedResult;

  @HiveField(3)
  @JsonKey(
    name: 'timestamp',
    nullable: true,
    fromJson: rawDateTime,
    toJson: setDateTime,
  )
  DateTime projectStartedOn;

  static DateTime rawDateTime(dynamic t) {
    if (t == null) {
      return null;
    }
    return t.toDate() as DateTime;
  }

  static DateTime setDateTime(DateTime date) => date;
}
