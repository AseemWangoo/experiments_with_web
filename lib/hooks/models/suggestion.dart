import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter/foundation.dart';

part 'suggestion.freezed.dart';
part 'suggestion.g.dart';

@freezed
abstract class Suggestion with _$Suggestion {
  const factory Suggestion({
    @JsonKey(name: 'person_name') String personName,
  }) = _Suggestion;

  factory Suggestion.fromJson(Map<String, dynamic> json) =>
      _$SuggestionFromJson(json);
}
