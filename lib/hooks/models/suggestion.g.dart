// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'suggestion.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_Suggestion _$_$_SuggestionFromJson(Map<String, dynamic> json) {
  return _$_Suggestion(
    personName: json['person_name'] as String,
    tutorialName: json['tutorial_name'] as String,
    email: json['email'] as String,
    handle: json['media_handle'] as String,
    tutorialDesc: json['tutorial_desc'] as String,
  );
}

Map<String, dynamic> _$_$_SuggestionToJson(_$_Suggestion instance) =>
    <String, dynamic>{
      'person_name': instance.personName,
      'tutorial_name': instance.tutorialName,
      'email': instance.email,
      'media_handle': instance.handle,
      'tutorial_desc': instance.tutorialDesc,
    };
