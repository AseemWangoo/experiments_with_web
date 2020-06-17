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

  _Suggestion call({@JsonKey(name: 'person_name') String personName}) {
    return _Suggestion(
      personName: personName,
    );
  }
}

// ignore: unused_element
const $Suggestion = _$SuggestionTearOff();

mixin _$Suggestion {
  @JsonKey(name: 'person_name')
  String get personName;

  Map<String, dynamic> toJson();
  $SuggestionCopyWith<Suggestion> get copyWith;
}

abstract class $SuggestionCopyWith<$Res> {
  factory $SuggestionCopyWith(
          Suggestion value, $Res Function(Suggestion) then) =
      _$SuggestionCopyWithImpl<$Res>;
  $Res call({@JsonKey(name: 'person_name') String personName});
}

class _$SuggestionCopyWithImpl<$Res> implements $SuggestionCopyWith<$Res> {
  _$SuggestionCopyWithImpl(this._value, this._then);

  final Suggestion _value;
  // ignore: unused_field
  final $Res Function(Suggestion) _then;

  @override
  $Res call({
    Object personName = freezed,
  }) {
    return _then(_value.copyWith(
      personName:
          personName == freezed ? _value.personName : personName as String,
    ));
  }
}

abstract class _$SuggestionCopyWith<$Res> implements $SuggestionCopyWith<$Res> {
  factory _$SuggestionCopyWith(
          _Suggestion value, $Res Function(_Suggestion) then) =
      __$SuggestionCopyWithImpl<$Res>;
  @override
  $Res call({@JsonKey(name: 'person_name') String personName});
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
  }) {
    return _then(_Suggestion(
      personName:
          personName == freezed ? _value.personName : personName as String,
    ));
  }
}

@JsonSerializable()
class _$_Suggestion with DiagnosticableTreeMixin implements _Suggestion {
  const _$_Suggestion({@JsonKey(name: 'person_name') this.personName});

  factory _$_Suggestion.fromJson(Map<String, dynamic> json) =>
      _$_$_SuggestionFromJson(json);

  @override
  @JsonKey(name: 'person_name')
  final String personName;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'Suggestion(personName: $personName)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'Suggestion'))
      ..add(DiagnosticsProperty('personName', personName));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _Suggestion &&
            (identical(other.personName, personName) ||
                const DeepCollectionEquality()
                    .equals(other.personName, personName)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^ const DeepCollectionEquality().hash(personName);

  @override
  _$SuggestionCopyWith<_Suggestion> get copyWith =>
      __$SuggestionCopyWithImpl<_Suggestion>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$_$_SuggestionToJson(this);
  }
}

abstract class _Suggestion implements Suggestion {
  const factory _Suggestion({@JsonKey(name: 'person_name') String personName}) =
      _$_Suggestion;

  factory _Suggestion.fromJson(Map<String, dynamic> json) =
      _$_Suggestion.fromJson;

  @override
  @JsonKey(name: 'person_name')
  String get personName;
  @override
  _$SuggestionCopyWith<_Suggestion> get copyWith;
}
