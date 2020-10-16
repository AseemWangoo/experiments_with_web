// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'cached_searches.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class CachedSearchesAdapter extends TypeAdapter<CachedSearches> {
  @override
  final int typeId = 2;

  @override
  CachedSearches read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return CachedSearches(
      phrase: fields[0] as String,
      occurences: fields[1] as int,
      clickedResult: fields[2] as String,
      timestamp: fields[3] as DateTime,
      articleName: fields[4] as String,
    );
  }

  @override
  void write(BinaryWriter writer, CachedSearches obj) {
    writer
      ..writeByte(5)
      ..writeByte(0)
      ..write(obj.phrase)
      ..writeByte(1)
      ..write(obj.occurences)
      ..writeByte(2)
      ..write(obj.clickedResult)
      ..writeByte(3)
      ..write(obj.timestamp)
      ..writeByte(4)
      ..write(obj.articleName);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is CachedSearchesAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CachedSearches _$CachedSearchesFromJson(Map<String, dynamic> json) {
  return CachedSearches(
    phrase: json['phrase'] as String,
    occurences: json['occurences'] as int,
    clickedResult: json['clicked_result'] as String,
    timestamp: CachedSearches.rawDateTime(json['timestamp']),
    articleName: json['article_name'] as String,
  );
}

Map<String, dynamic> _$CachedSearchesToJson(CachedSearches instance) =>
    <String, dynamic>{
      'phrase': instance.phrase,
      'occurences': instance.occurences,
      'clicked_result': instance.clickedResult,
      'timestamp': CachedSearches.setDateTime(instance.timestamp),
      'article_name': instance.articleName,
    };
