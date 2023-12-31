// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'restapi_exception.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$RestApiException {
  String get message => throw _privateConstructorUsedError;
  String get statusCode => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $RestApiExceptionCopyWith<RestApiException> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $RestApiExceptionCopyWith<$Res> {
  factory $RestApiExceptionCopyWith(
          RestApiException value, $Res Function(RestApiException) then) =
      _$RestApiExceptionCopyWithImpl<$Res, RestApiException>;
  @useResult
  $Res call({String message, String statusCode});
}

/// @nodoc
class _$RestApiExceptionCopyWithImpl<$Res, $Val extends RestApiException>
    implements $RestApiExceptionCopyWith<$Res> {
  _$RestApiExceptionCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? message = null,
    Object? statusCode = null,
  }) {
    return _then(_value.copyWith(
      message: null == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
      statusCode: null == statusCode
          ? _value.statusCode
          : statusCode // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_RestApiExceptionCopyWith<$Res>
    implements $RestApiExceptionCopyWith<$Res> {
  factory _$$_RestApiExceptionCopyWith(
          _$_RestApiException value, $Res Function(_$_RestApiException) then) =
      __$$_RestApiExceptionCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String message, String statusCode});
}

/// @nodoc
class __$$_RestApiExceptionCopyWithImpl<$Res>
    extends _$RestApiExceptionCopyWithImpl<$Res, _$_RestApiException>
    implements _$$_RestApiExceptionCopyWith<$Res> {
  __$$_RestApiExceptionCopyWithImpl(
      _$_RestApiException _value, $Res Function(_$_RestApiException) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? message = null,
    Object? statusCode = null,
  }) {
    return _then(_$_RestApiException(
      null == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
      null == statusCode
          ? _value.statusCode
          : statusCode // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$_RestApiException implements _RestApiException {
  const _$_RestApiException(this.message, this.statusCode);

  @override
  final String message;
  @override
  final String statusCode;

  @override
  String toString() {
    return 'RestApiException(message: $message, statusCode: $statusCode)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_RestApiException &&
            (identical(other.message, message) || other.message == message) &&
            (identical(other.statusCode, statusCode) ||
                other.statusCode == statusCode));
  }

  @override
  int get hashCode => Object.hash(runtimeType, message, statusCode);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_RestApiExceptionCopyWith<_$_RestApiException> get copyWith =>
      __$$_RestApiExceptionCopyWithImpl<_$_RestApiException>(this, _$identity);
}

abstract class _RestApiException implements RestApiException {
  const factory _RestApiException(
      final String message, final String statusCode) = _$_RestApiException;

  @override
  String get message;
  @override
  String get statusCode;
  @override
  @JsonKey(ignore: true)
  _$$_RestApiExceptionCopyWith<_$_RestApiException> get copyWith =>
      throw _privateConstructorUsedError;
}
