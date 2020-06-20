// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named

part of 'suggestion.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;
Suggestion _$SuggestionFromJson(Map<String, dynamic> json) {
  return _Suggestion.fromJson(json);
}

class _$SuggestionTearOff {
  const _$SuggestionTearOff();

  _Suggestion call(
      {@JsonKey(name: 'person_name') String personName,
      @JsonKey(name: 'tutorial_name') String tutorialName,
      @JsonKey(name: 'email') String email,
      @JsonKey(name: 'media_handle') String handle,
      @JsonKey(name: 'tutorial_desc') String tutorialDesc}) {
    return _Suggestion(
      personName: personName,
      tutorialName: tutorialName,
      email: email,
      handle: handle,
      tutorialDesc: tutorialDesc,
    );
  }
}

// ignore: unused_element
const $Suggestion = _$SuggestionTearOff();

mixin _$Suggestion {
  @JsonKey(name: 'person_name')
  String get personName;
  @JsonKey(name: 'tutorial_name')
  String get tutorialName;
  @JsonKey(name: 'email')
  String get email;
  @JsonKey(name: 'media_handle')
  String get handle;
  @JsonKey(name: 'tutorial_desc')
  String get tutorialDesc;

  Map<String, dynamic> toJson();
  $SuggestionCopyWith<Suggestion> get copyWith;
}

abstract class $SuggestionCopyWith<$Res> {
  factory $SuggestionCopyWith(
          Suggestion value, $Res Function(Suggestion) then) =
      _$SuggestionCopyWithImpl<$Res>;
  $Res call(
      {@JsonKey(name: 'person_name') String personName,
      @JsonKey(name: 'tutorial_name') String tutorialName,
      @JsonKey(name: 'email') String email,
      @JsonKey(name: 'media_handle') String handle,
      @JsonKey(name: 'tutorial_desc') String tutorialDesc});
}

class _$SuggestionCopyWithImpl<$Res> implements $SuggestionCopyWith<$Res> {
  _$SuggestionCopyWithImpl(this._value, this._then);

  final Suggestion _value;
  // ignore: unused_field
  final $Res Function(Suggestion) _then;

  @override
  $Res call({
    Object personName = freezed,
    Object tutorialName = freezed,
    Object email = freezed,
    Object handle = freezed,
    Object tutorialDesc = freezed,
  }) {
    return _then(_value.copyWith(
      personName:
          personName == freezed ? _value.personName : personName as String,
      tutorialName: tutorialName == freezed
          ? _value.tutorialName
          : tutorialName as String,
      email: email == freezed ? _value.email : email as String,
      handle: handle == freezed ? _value.handle : handle as String,
      tutorialDesc: tutorialDesc == freezed
          ? _value.tutorialDesc
          : tutorialDesc as String,
    ));
  }
}

abstract class _$SuggestionCopyWith<$Res> implements $SuggestionCopyWith<$Res> {
  factory _$SuggestionCopyWith(
          _Suggestion value, $Res Function(_Suggestion) then) =
      __$SuggestionCopyWithImpl<$Res>;
  @override
  $Res call(
      {@JsonKey(name: 'person_name') String personName,
      @JsonKey(name: 'tutorial_name') String tutorialName,
      @JsonKey(name: 'email') String email,
      @JsonKey(name: 'media_handle') String handle,
      @JsonKey(name: 'tutorial_desc') String tutorialDesc});
}

class __$SuggestionCopyWithImpl<$Res> extends _$SuggestionCopyWithImpl<$Res>
    implements _$SuggestionCopyWith<$Res> {
  __$SuggestionCopyWithImpl(
      _Suggestion _value, $Res Function(_Suggestion) _then)
      : super(_value, (v) => _then(v as _Suggestion));

  @override
  _Suggestion get _value => super._value as _Suggestion;

  @override
  $Res call({
    Object personName = freezed,
    Object tutorialName = freezed,
    Object email = freezed,
    Object handle = freezed,
    Object tutorialDesc = freezed,
  }) {
    return _then(_Suggestion(
      personName:
          personName == freezed ? _value.personName : personName as String,
      tutorialName: tutorialName == freezed
          ? _value.tutorialName
          : tutorialName as String,
      email: email == freezed ? _value.email : email as String,
      handle: handle == freezed ? _value.handle : handle as String,
      tutorialDesc: tutorialDesc == freezed
          ? _value.tutorialDesc
          : tutorialDesc as String,
    ));
  }
}

@JsonSerializable()
class _$_Suggestion with DiagnosticableTreeMixin implements _Suggestion {
  const _$_Suggestion(
      {@JsonKey(name: 'person_name') this.personName,
      @JsonKey(name: 'tutorial_name') this.tutorialName,
      @JsonKey(name: 'email') this.email,
      @JsonKey(name: 'media_handle') this.handle,
      @JsonKey(name: 'tutorial_desc') this.tutorialDesc});

  factory _$_Suggestion.fromJson(Map<String, dynamic> json) =>
      _$_$_SuggestionFromJson(json);

  @override
  @JsonKey(name: 'person_name')
  final String personName;
  @override
  @JsonKey(name: 'tutorial_name')
  final String tutorialName;
  @override
  @JsonKey(name: 'email')
  final String email;
  @override
  @JsonKey(name: 'media_handle')
  final String handle;
  @override
  @JsonKey(name: 'tutorial_desc')
  final String tutorialDesc;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'Suggestion(personName: $personName, tutorialName: $tutorialName, email: $email, handle: $handle, tutorialDesc: $tutorialDesc)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'Suggestion'))
      ..add(DiagnosticsProperty('personName', personName))
      ..add(DiagnosticsProperty('tutorialName', tutorialName))
      ..add(DiagnosticsProperty('email', email))
      ..add(DiagnosticsProperty('handle', handle))
      ..add(DiagnosticsProperty('tutorialDesc', tutorialDesc));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _Suggestion &&
            (identical(other.personName, personName) ||
                const DeepCollectionEquality()
                    .equals(other.personName, personName)) &&
            (identical(other.tutorialName, tutorialName) ||
                const DeepCollectionEquality()
                    .equals(other.tutorialName, tutorialName)) &&
            (identical(other.email, email) ||
                const DeepCollectionEquality().equals(other.email, email)) &&
            (identical(other.handle, handle) ||
                const DeepCollectionEquality().equals(other.handle, handle)) &&
            (identical(other.tutorialDesc, tutorialDesc) ||
                const DeepCollectionEquality()
                    .equals(other.tutorialDesc, tutorialDesc)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(personName) ^
      const DeepCollectionEquality().hash(tutorialName) ^
      const DeepCollectionEquality().hash(email) ^
      const DeepCollectionEquality().hash(handle) ^
      const DeepCollectionEquality().hash(tutorialDesc);

  @override
  _$SuggestionCopyWith<_Suggestion> get copyWith =>
      __$SuggestionCopyWithImpl<_Suggestion>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$_$_SuggestionToJson(this);
  }
}

abstract class _Suggestion implements Suggestion {
  const factory _Suggestion(
      {@JsonKey(name: 'person_name') String personName,
      @JsonKey(name: 'tutorial_name') String tutorialName,
      @JsonKey(name: 'email') String email,
      @JsonKey(name: 'media_handle') String handle,
      @JsonKey(name: 'tutorial_desc') String tutorialDesc}) = _$_Suggestion;

  factory _Suggestion.fromJson(Map<String, dynamic> json) =
      _$_Suggestion.fromJson;

  @override
  @JsonKey(name: 'person_name')
  String get personName;
  @override
  @JsonKey(name: 'tutorial_name')
  String get tutorialName;
  @override
  @JsonKey(name: 'email')
  String get email;
  @override
  @JsonKey(name: 'media_handle')
  String get handle;
  @override
  @JsonKey(name: 'tutorial_desc')
  String get tutorialDesc;
  @override
  _$SuggestionCopyWith<_Suggestion> get copyWith;
}
