// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'articles.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class ArticlesModelAdapter extends TypeAdapter<ArticlesModel> {
  @override
  final int typeId = 1;

  @override
  ArticlesModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return ArticlesModel(
      articleID: fields[0] as String,
      articleName: fields[1] as String,
      articleRoute: fields[2] as String,
      articleLinks: (fields[3] as List)?.cast<String>(),
    )..isFavorite = fields[4] as bool;
  }

  @override
  void write(BinaryWriter writer, ArticlesModel obj) {
    writer
      ..writeByte(5)
      ..writeByte(0)
      ..write(obj.articleID)
      ..writeByte(1)
      ..write(obj.articleName)
      ..writeByte(2)
      ..write(obj.articleRoute)
      ..writeByte(3)
      ..write(obj.articleLinks)
      ..writeByte(4)
      ..write(obj.isFavorite);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ArticlesModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ArticlesModel _$ArticlesModelFromJson(Map<String, dynamic> json) {
  return ArticlesModel(
    articleID: json['article_id'] as String,
    articleName: json['article_name'] as String,
    articleRoute: json['article_route'] as String,
    articleLinks:
        (json['article_links'] as List).map((e) => e as String).toList(),
  )..isFavorite = json['is_favorite'] as bool;
}

Map<String, dynamic> _$ArticlesModelToJson(ArticlesModel instance) =>
    <String, dynamic>{
      'article_id': instance.articleID,
      'article_name': instance.articleName,
      'article_route': instance.articleRoute,
      'article_links': instance.articleLinks,
      'is_favorite': instance.isFavorite,
    };
