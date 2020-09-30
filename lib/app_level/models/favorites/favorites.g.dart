// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'favorites.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class FavoritesModelAdapter extends TypeAdapter<FavoritesModel> {
  @override
  final int typeId = 1;

  @override
  FavoritesModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return FavoritesModel(
      articleID: fields[0] as String,
      articleName: fields[1] as String,
      articleRoute: fields[2] as String,
      articleLinks: (fields[3] as List)?.cast<String>(),
    );
  }

  @override
  void write(BinaryWriter writer, FavoritesModel obj) {
    writer
      ..writeByte(4)
      ..writeByte(0)
      ..write(obj.articleID)
      ..writeByte(1)
      ..write(obj.articleName)
      ..writeByte(2)
      ..write(obj.articleRoute)
      ..writeByte(3)
      ..write(obj.articleLinks);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is FavoritesModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

FavoritesModel _$FavoritesModelFromJson(Map<String, dynamic> json) {
  return FavoritesModel(
    articleID: json['article_id'] as String,
    articleName: json['article_name'] as String,
    articleRoute: json['article_route'] as String,
    articleLinks:
        (json['article_links'] as List).map((e) => e as String).toList(),
  );
}

Map<String, dynamic> _$FavoritesModelToJson(FavoritesModel instance) =>
    <String, dynamic>{
      'article_id': instance.articleID,
      'article_name': instance.articleName,
      'article_route': instance.articleRoute,
      'article_links': instance.articleLinks,
    };
