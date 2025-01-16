// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'failure.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$Failure {
  String? get message => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String? message) server,
    required TResult Function(String? message) cache,
    required TResult Function(String? message) network,
    required TResult Function(String? message) invalidCredentials,
    required TResult Function(String? message) unexpected,
    required TResult Function(String? message) emailAlreadyInUse,
    required TResult Function(String? message) unauthenticated,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String? message)? server,
    TResult? Function(String? message)? cache,
    TResult? Function(String? message)? network,
    TResult? Function(String? message)? invalidCredentials,
    TResult? Function(String? message)? unexpected,
    TResult? Function(String? message)? emailAlreadyInUse,
    TResult? Function(String? message)? unauthenticated,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String? message)? server,
    TResult Function(String? message)? cache,
    TResult Function(String? message)? network,
    TResult Function(String? message)? invalidCredentials,
    TResult Function(String? message)? unexpected,
    TResult Function(String? message)? emailAlreadyInUse,
    TResult Function(String? message)? unauthenticated,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(ServerFailure value) server,
    required TResult Function(CacheFailure value) cache,
    required TResult Function(NetworkFailure value) network,
    required TResult Function(InvalidCredentialsFailure value)
        invalidCredentials,
    required TResult Function(UnexpectedFailure value) unexpected,
    required TResult Function(EmailAlreadyInUseFailure value) emailAlreadyInUse,
    required TResult Function(UnauthenticatedFailure value) unauthenticated,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(ServerFailure value)? server,
    TResult? Function(CacheFailure value)? cache,
    TResult? Function(NetworkFailure value)? network,
    TResult? Function(InvalidCredentialsFailure value)? invalidCredentials,
    TResult? Function(UnexpectedFailure value)? unexpected,
    TResult? Function(EmailAlreadyInUseFailure value)? emailAlreadyInUse,
    TResult? Function(UnauthenticatedFailure value)? unauthenticated,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(ServerFailure value)? server,
    TResult Function(CacheFailure value)? cache,
    TResult Function(NetworkFailure value)? network,
    TResult Function(InvalidCredentialsFailure value)? invalidCredentials,
    TResult Function(UnexpectedFailure value)? unexpected,
    TResult Function(EmailAlreadyInUseFailure value)? emailAlreadyInUse,
    TResult Function(UnauthenticatedFailure value)? unauthenticated,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;

  /// Create a copy of Failure
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $FailureCopyWith<Failure> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $FailureCopyWith<$Res> {
  factory $FailureCopyWith(Failure value, $Res Function(Failure) then) =
      _$FailureCopyWithImpl<$Res, Failure>;
  @useResult
  $Res call({String? message});
}

/// @nodoc
class _$FailureCopyWithImpl<$Res, $Val extends Failure>
    implements $FailureCopyWith<$Res> {
  _$FailureCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of Failure
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? message = freezed,
  }) {
    return _then(_value.copyWith(
      message: freezed == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ServerFailureImplCopyWith<$Res>
    implements $FailureCopyWith<$Res> {
  factory _$$ServerFailureImplCopyWith(
          _$ServerFailureImpl value, $Res Function(_$ServerFailureImpl) then) =
      __$$ServerFailureImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String? message});
}

/// @nodoc
class __$$ServerFailureImplCopyWithImpl<$Res>
    extends _$FailureCopyWithImpl<$Res, _$ServerFailureImpl>
    implements _$$ServerFailureImplCopyWith<$Res> {
  __$$ServerFailureImplCopyWithImpl(
      _$ServerFailureImpl _value, $Res Function(_$ServerFailureImpl) _then)
      : super(_value, _then);

  /// Create a copy of Failure
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? message = freezed,
  }) {
    return _then(_$ServerFailureImpl(
      freezed == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc

class _$ServerFailureImpl implements ServerFailure {
  const _$ServerFailureImpl([this.message]);

  @override
  final String? message;

  @override
  String toString() {
    return 'Failure.server(message: $message)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ServerFailureImpl &&
            (identical(other.message, message) || other.message == message));
  }

  @override
  int get hashCode => Object.hash(runtimeType, message);

  /// Create a copy of Failure
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ServerFailureImplCopyWith<_$ServerFailureImpl> get copyWith =>
      __$$ServerFailureImplCopyWithImpl<_$ServerFailureImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String? message) server,
    required TResult Function(String? message) cache,
    required TResult Function(String? message) network,
    required TResult Function(String? message) invalidCredentials,
    required TResult Function(String? message) unexpected,
    required TResult Function(String? message) emailAlreadyInUse,
    required TResult Function(String? message) unauthenticated,
  }) {
    return server(message);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String? message)? server,
    TResult? Function(String? message)? cache,
    TResult? Function(String? message)? network,
    TResult? Function(String? message)? invalidCredentials,
    TResult? Function(String? message)? unexpected,
    TResult? Function(String? message)? emailAlreadyInUse,
    TResult? Function(String? message)? unauthenticated,
  }) {
    return server?.call(message);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String? message)? server,
    TResult Function(String? message)? cache,
    TResult Function(String? message)? network,
    TResult Function(String? message)? invalidCredentials,
    TResult Function(String? message)? unexpected,
    TResult Function(String? message)? emailAlreadyInUse,
    TResult Function(String? message)? unauthenticated,
    required TResult orElse(),
  }) {
    if (server != null) {
      return server(message);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(ServerFailure value) server,
    required TResult Function(CacheFailure value) cache,
    required TResult Function(NetworkFailure value) network,
    required TResult Function(InvalidCredentialsFailure value)
        invalidCredentials,
    required TResult Function(UnexpectedFailure value) unexpected,
    required TResult Function(EmailAlreadyInUseFailure value) emailAlreadyInUse,
    required TResult Function(UnauthenticatedFailure value) unauthenticated,
  }) {
    return server(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(ServerFailure value)? server,
    TResult? Function(CacheFailure value)? cache,
    TResult? Function(NetworkFailure value)? network,
    TResult? Function(InvalidCredentialsFailure value)? invalidCredentials,
    TResult? Function(UnexpectedFailure value)? unexpected,
    TResult? Function(EmailAlreadyInUseFailure value)? emailAlreadyInUse,
    TResult? Function(UnauthenticatedFailure value)? unauthenticated,
  }) {
    return server?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(ServerFailure value)? server,
    TResult Function(CacheFailure value)? cache,
    TResult Function(NetworkFailure value)? network,
    TResult Function(InvalidCredentialsFailure value)? invalidCredentials,
    TResult Function(UnexpectedFailure value)? unexpected,
    TResult Function(EmailAlreadyInUseFailure value)? emailAlreadyInUse,
    TResult Function(UnauthenticatedFailure value)? unauthenticated,
    required TResult orElse(),
  }) {
    if (server != null) {
      return server(this);
    }
    return orElse();
  }
}

abstract class ServerFailure implements Failure {
  const factory ServerFailure([final String? message]) = _$ServerFailureImpl;

  @override
  String? get message;

  /// Create a copy of Failure
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ServerFailureImplCopyWith<_$ServerFailureImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$CacheFailureImplCopyWith<$Res>
    implements $FailureCopyWith<$Res> {
  factory _$$CacheFailureImplCopyWith(
          _$CacheFailureImpl value, $Res Function(_$CacheFailureImpl) then) =
      __$$CacheFailureImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String? message});
}

/// @nodoc
class __$$CacheFailureImplCopyWithImpl<$Res>
    extends _$FailureCopyWithImpl<$Res, _$CacheFailureImpl>
    implements _$$CacheFailureImplCopyWith<$Res> {
  __$$CacheFailureImplCopyWithImpl(
      _$CacheFailureImpl _value, $Res Function(_$CacheFailureImpl) _then)
      : super(_value, _then);

  /// Create a copy of Failure
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? message = freezed,
  }) {
    return _then(_$CacheFailureImpl(
      freezed == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc

class _$CacheFailureImpl implements CacheFailure {
  const _$CacheFailureImpl([this.message]);

  @override
  final String? message;

  @override
  String toString() {
    return 'Failure.cache(message: $message)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CacheFailureImpl &&
            (identical(other.message, message) || other.message == message));
  }

  @override
  int get hashCode => Object.hash(runtimeType, message);

  /// Create a copy of Failure
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$CacheFailureImplCopyWith<_$CacheFailureImpl> get copyWith =>
      __$$CacheFailureImplCopyWithImpl<_$CacheFailureImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String? message) server,
    required TResult Function(String? message) cache,
    required TResult Function(String? message) network,
    required TResult Function(String? message) invalidCredentials,
    required TResult Function(String? message) unexpected,
    required TResult Function(String? message) emailAlreadyInUse,
    required TResult Function(String? message) unauthenticated,
  }) {
    return cache(message);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String? message)? server,
    TResult? Function(String? message)? cache,
    TResult? Function(String? message)? network,
    TResult? Function(String? message)? invalidCredentials,
    TResult? Function(String? message)? unexpected,
    TResult? Function(String? message)? emailAlreadyInUse,
    TResult? Function(String? message)? unauthenticated,
  }) {
    return cache?.call(message);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String? message)? server,
    TResult Function(String? message)? cache,
    TResult Function(String? message)? network,
    TResult Function(String? message)? invalidCredentials,
    TResult Function(String? message)? unexpected,
    TResult Function(String? message)? emailAlreadyInUse,
    TResult Function(String? message)? unauthenticated,
    required TResult orElse(),
  }) {
    if (cache != null) {
      return cache(message);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(ServerFailure value) server,
    required TResult Function(CacheFailure value) cache,
    required TResult Function(NetworkFailure value) network,
    required TResult Function(InvalidCredentialsFailure value)
        invalidCredentials,
    required TResult Function(UnexpectedFailure value) unexpected,
    required TResult Function(EmailAlreadyInUseFailure value) emailAlreadyInUse,
    required TResult Function(UnauthenticatedFailure value) unauthenticated,
  }) {
    return cache(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(ServerFailure value)? server,
    TResult? Function(CacheFailure value)? cache,
    TResult? Function(NetworkFailure value)? network,
    TResult? Function(InvalidCredentialsFailure value)? invalidCredentials,
    TResult? Function(UnexpectedFailure value)? unexpected,
    TResult? Function(EmailAlreadyInUseFailure value)? emailAlreadyInUse,
    TResult? Function(UnauthenticatedFailure value)? unauthenticated,
  }) {
    return cache?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(ServerFailure value)? server,
    TResult Function(CacheFailure value)? cache,
    TResult Function(NetworkFailure value)? network,
    TResult Function(InvalidCredentialsFailure value)? invalidCredentials,
    TResult Function(UnexpectedFailure value)? unexpected,
    TResult Function(EmailAlreadyInUseFailure value)? emailAlreadyInUse,
    TResult Function(UnauthenticatedFailure value)? unauthenticated,
    required TResult orElse(),
  }) {
    if (cache != null) {
      return cache(this);
    }
    return orElse();
  }
}

abstract class CacheFailure implements Failure {
  const factory CacheFailure([final String? message]) = _$CacheFailureImpl;

  @override
  String? get message;

  /// Create a copy of Failure
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$CacheFailureImplCopyWith<_$CacheFailureImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$NetworkFailureImplCopyWith<$Res>
    implements $FailureCopyWith<$Res> {
  factory _$$NetworkFailureImplCopyWith(_$NetworkFailureImpl value,
          $Res Function(_$NetworkFailureImpl) then) =
      __$$NetworkFailureImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String? message});
}

/// @nodoc
class __$$NetworkFailureImplCopyWithImpl<$Res>
    extends _$FailureCopyWithImpl<$Res, _$NetworkFailureImpl>
    implements _$$NetworkFailureImplCopyWith<$Res> {
  __$$NetworkFailureImplCopyWithImpl(
      _$NetworkFailureImpl _value, $Res Function(_$NetworkFailureImpl) _then)
      : super(_value, _then);

  /// Create a copy of Failure
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? message = freezed,
  }) {
    return _then(_$NetworkFailureImpl(
      freezed == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc

class _$NetworkFailureImpl implements NetworkFailure {
  const _$NetworkFailureImpl([this.message]);

  @override
  final String? message;

  @override
  String toString() {
    return 'Failure.network(message: $message)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$NetworkFailureImpl &&
            (identical(other.message, message) || other.message == message));
  }

  @override
  int get hashCode => Object.hash(runtimeType, message);

  /// Create a copy of Failure
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$NetworkFailureImplCopyWith<_$NetworkFailureImpl> get copyWith =>
      __$$NetworkFailureImplCopyWithImpl<_$NetworkFailureImpl>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String? message) server,
    required TResult Function(String? message) cache,
    required TResult Function(String? message) network,
    required TResult Function(String? message) invalidCredentials,
    required TResult Function(String? message) unexpected,
    required TResult Function(String? message) emailAlreadyInUse,
    required TResult Function(String? message) unauthenticated,
  }) {
    return network(message);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String? message)? server,
    TResult? Function(String? message)? cache,
    TResult? Function(String? message)? network,
    TResult? Function(String? message)? invalidCredentials,
    TResult? Function(String? message)? unexpected,
    TResult? Function(String? message)? emailAlreadyInUse,
    TResult? Function(String? message)? unauthenticated,
  }) {
    return network?.call(message);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String? message)? server,
    TResult Function(String? message)? cache,
    TResult Function(String? message)? network,
    TResult Function(String? message)? invalidCredentials,
    TResult Function(String? message)? unexpected,
    TResult Function(String? message)? emailAlreadyInUse,
    TResult Function(String? message)? unauthenticated,
    required TResult orElse(),
  }) {
    if (network != null) {
      return network(message);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(ServerFailure value) server,
    required TResult Function(CacheFailure value) cache,
    required TResult Function(NetworkFailure value) network,
    required TResult Function(InvalidCredentialsFailure value)
        invalidCredentials,
    required TResult Function(UnexpectedFailure value) unexpected,
    required TResult Function(EmailAlreadyInUseFailure value) emailAlreadyInUse,
    required TResult Function(UnauthenticatedFailure value) unauthenticated,
  }) {
    return network(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(ServerFailure value)? server,
    TResult? Function(CacheFailure value)? cache,
    TResult? Function(NetworkFailure value)? network,
    TResult? Function(InvalidCredentialsFailure value)? invalidCredentials,
    TResult? Function(UnexpectedFailure value)? unexpected,
    TResult? Function(EmailAlreadyInUseFailure value)? emailAlreadyInUse,
    TResult? Function(UnauthenticatedFailure value)? unauthenticated,
  }) {
    return network?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(ServerFailure value)? server,
    TResult Function(CacheFailure value)? cache,
    TResult Function(NetworkFailure value)? network,
    TResult Function(InvalidCredentialsFailure value)? invalidCredentials,
    TResult Function(UnexpectedFailure value)? unexpected,
    TResult Function(EmailAlreadyInUseFailure value)? emailAlreadyInUse,
    TResult Function(UnauthenticatedFailure value)? unauthenticated,
    required TResult orElse(),
  }) {
    if (network != null) {
      return network(this);
    }
    return orElse();
  }
}

abstract class NetworkFailure implements Failure {
  const factory NetworkFailure([final String? message]) = _$NetworkFailureImpl;

  @override
  String? get message;

  /// Create a copy of Failure
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$NetworkFailureImplCopyWith<_$NetworkFailureImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$InvalidCredentialsFailureImplCopyWith<$Res>
    implements $FailureCopyWith<$Res> {
  factory _$$InvalidCredentialsFailureImplCopyWith(
          _$InvalidCredentialsFailureImpl value,
          $Res Function(_$InvalidCredentialsFailureImpl) then) =
      __$$InvalidCredentialsFailureImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String? message});
}

/// @nodoc
class __$$InvalidCredentialsFailureImplCopyWithImpl<$Res>
    extends _$FailureCopyWithImpl<$Res, _$InvalidCredentialsFailureImpl>
    implements _$$InvalidCredentialsFailureImplCopyWith<$Res> {
  __$$InvalidCredentialsFailureImplCopyWithImpl(
      _$InvalidCredentialsFailureImpl _value,
      $Res Function(_$InvalidCredentialsFailureImpl) _then)
      : super(_value, _then);

  /// Create a copy of Failure
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? message = freezed,
  }) {
    return _then(_$InvalidCredentialsFailureImpl(
      freezed == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc

class _$InvalidCredentialsFailureImpl implements InvalidCredentialsFailure {
  const _$InvalidCredentialsFailureImpl([this.message]);

  @override
  final String? message;

  @override
  String toString() {
    return 'Failure.invalidCredentials(message: $message)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$InvalidCredentialsFailureImpl &&
            (identical(other.message, message) || other.message == message));
  }

  @override
  int get hashCode => Object.hash(runtimeType, message);

  /// Create a copy of Failure
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$InvalidCredentialsFailureImplCopyWith<_$InvalidCredentialsFailureImpl>
      get copyWith => __$$InvalidCredentialsFailureImplCopyWithImpl<
          _$InvalidCredentialsFailureImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String? message) server,
    required TResult Function(String? message) cache,
    required TResult Function(String? message) network,
    required TResult Function(String? message) invalidCredentials,
    required TResult Function(String? message) unexpected,
    required TResult Function(String? message) emailAlreadyInUse,
    required TResult Function(String? message) unauthenticated,
  }) {
    return invalidCredentials(message);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String? message)? server,
    TResult? Function(String? message)? cache,
    TResult? Function(String? message)? network,
    TResult? Function(String? message)? invalidCredentials,
    TResult? Function(String? message)? unexpected,
    TResult? Function(String? message)? emailAlreadyInUse,
    TResult? Function(String? message)? unauthenticated,
  }) {
    return invalidCredentials?.call(message);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String? message)? server,
    TResult Function(String? message)? cache,
    TResult Function(String? message)? network,
    TResult Function(String? message)? invalidCredentials,
    TResult Function(String? message)? unexpected,
    TResult Function(String? message)? emailAlreadyInUse,
    TResult Function(String? message)? unauthenticated,
    required TResult orElse(),
  }) {
    if (invalidCredentials != null) {
      return invalidCredentials(message);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(ServerFailure value) server,
    required TResult Function(CacheFailure value) cache,
    required TResult Function(NetworkFailure value) network,
    required TResult Function(InvalidCredentialsFailure value)
        invalidCredentials,
    required TResult Function(UnexpectedFailure value) unexpected,
    required TResult Function(EmailAlreadyInUseFailure value) emailAlreadyInUse,
    required TResult Function(UnauthenticatedFailure value) unauthenticated,
  }) {
    return invalidCredentials(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(ServerFailure value)? server,
    TResult? Function(CacheFailure value)? cache,
    TResult? Function(NetworkFailure value)? network,
    TResult? Function(InvalidCredentialsFailure value)? invalidCredentials,
    TResult? Function(UnexpectedFailure value)? unexpected,
    TResult? Function(EmailAlreadyInUseFailure value)? emailAlreadyInUse,
    TResult? Function(UnauthenticatedFailure value)? unauthenticated,
  }) {
    return invalidCredentials?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(ServerFailure value)? server,
    TResult Function(CacheFailure value)? cache,
    TResult Function(NetworkFailure value)? network,
    TResult Function(InvalidCredentialsFailure value)? invalidCredentials,
    TResult Function(UnexpectedFailure value)? unexpected,
    TResult Function(EmailAlreadyInUseFailure value)? emailAlreadyInUse,
    TResult Function(UnauthenticatedFailure value)? unauthenticated,
    required TResult orElse(),
  }) {
    if (invalidCredentials != null) {
      return invalidCredentials(this);
    }
    return orElse();
  }
}

abstract class InvalidCredentialsFailure implements Failure {
  const factory InvalidCredentialsFailure([final String? message]) =
      _$InvalidCredentialsFailureImpl;

  @override
  String? get message;

  /// Create a copy of Failure
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$InvalidCredentialsFailureImplCopyWith<_$InvalidCredentialsFailureImpl>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$UnexpectedFailureImplCopyWith<$Res>
    implements $FailureCopyWith<$Res> {
  factory _$$UnexpectedFailureImplCopyWith(_$UnexpectedFailureImpl value,
          $Res Function(_$UnexpectedFailureImpl) then) =
      __$$UnexpectedFailureImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String? message});
}

/// @nodoc
class __$$UnexpectedFailureImplCopyWithImpl<$Res>
    extends _$FailureCopyWithImpl<$Res, _$UnexpectedFailureImpl>
    implements _$$UnexpectedFailureImplCopyWith<$Res> {
  __$$UnexpectedFailureImplCopyWithImpl(_$UnexpectedFailureImpl _value,
      $Res Function(_$UnexpectedFailureImpl) _then)
      : super(_value, _then);

  /// Create a copy of Failure
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? message = freezed,
  }) {
    return _then(_$UnexpectedFailureImpl(
      freezed == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc

class _$UnexpectedFailureImpl implements UnexpectedFailure {
  const _$UnexpectedFailureImpl([this.message]);

  @override
  final String? message;

  @override
  String toString() {
    return 'Failure.unexpected(message: $message)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$UnexpectedFailureImpl &&
            (identical(other.message, message) || other.message == message));
  }

  @override
  int get hashCode => Object.hash(runtimeType, message);

  /// Create a copy of Failure
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$UnexpectedFailureImplCopyWith<_$UnexpectedFailureImpl> get copyWith =>
      __$$UnexpectedFailureImplCopyWithImpl<_$UnexpectedFailureImpl>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String? message) server,
    required TResult Function(String? message) cache,
    required TResult Function(String? message) network,
    required TResult Function(String? message) invalidCredentials,
    required TResult Function(String? message) unexpected,
    required TResult Function(String? message) emailAlreadyInUse,
    required TResult Function(String? message) unauthenticated,
  }) {
    return unexpected(message);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String? message)? server,
    TResult? Function(String? message)? cache,
    TResult? Function(String? message)? network,
    TResult? Function(String? message)? invalidCredentials,
    TResult? Function(String? message)? unexpected,
    TResult? Function(String? message)? emailAlreadyInUse,
    TResult? Function(String? message)? unauthenticated,
  }) {
    return unexpected?.call(message);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String? message)? server,
    TResult Function(String? message)? cache,
    TResult Function(String? message)? network,
    TResult Function(String? message)? invalidCredentials,
    TResult Function(String? message)? unexpected,
    TResult Function(String? message)? emailAlreadyInUse,
    TResult Function(String? message)? unauthenticated,
    required TResult orElse(),
  }) {
    if (unexpected != null) {
      return unexpected(message);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(ServerFailure value) server,
    required TResult Function(CacheFailure value) cache,
    required TResult Function(NetworkFailure value) network,
    required TResult Function(InvalidCredentialsFailure value)
        invalidCredentials,
    required TResult Function(UnexpectedFailure value) unexpected,
    required TResult Function(EmailAlreadyInUseFailure value) emailAlreadyInUse,
    required TResult Function(UnauthenticatedFailure value) unauthenticated,
  }) {
    return unexpected(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(ServerFailure value)? server,
    TResult? Function(CacheFailure value)? cache,
    TResult? Function(NetworkFailure value)? network,
    TResult? Function(InvalidCredentialsFailure value)? invalidCredentials,
    TResult? Function(UnexpectedFailure value)? unexpected,
    TResult? Function(EmailAlreadyInUseFailure value)? emailAlreadyInUse,
    TResult? Function(UnauthenticatedFailure value)? unauthenticated,
  }) {
    return unexpected?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(ServerFailure value)? server,
    TResult Function(CacheFailure value)? cache,
    TResult Function(NetworkFailure value)? network,
    TResult Function(InvalidCredentialsFailure value)? invalidCredentials,
    TResult Function(UnexpectedFailure value)? unexpected,
    TResult Function(EmailAlreadyInUseFailure value)? emailAlreadyInUse,
    TResult Function(UnauthenticatedFailure value)? unauthenticated,
    required TResult orElse(),
  }) {
    if (unexpected != null) {
      return unexpected(this);
    }
    return orElse();
  }
}

abstract class UnexpectedFailure implements Failure {
  const factory UnexpectedFailure([final String? message]) =
      _$UnexpectedFailureImpl;

  @override
  String? get message;

  /// Create a copy of Failure
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$UnexpectedFailureImplCopyWith<_$UnexpectedFailureImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$EmailAlreadyInUseFailureImplCopyWith<$Res>
    implements $FailureCopyWith<$Res> {
  factory _$$EmailAlreadyInUseFailureImplCopyWith(
          _$EmailAlreadyInUseFailureImpl value,
          $Res Function(_$EmailAlreadyInUseFailureImpl) then) =
      __$$EmailAlreadyInUseFailureImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String? message});
}

/// @nodoc
class __$$EmailAlreadyInUseFailureImplCopyWithImpl<$Res>
    extends _$FailureCopyWithImpl<$Res, _$EmailAlreadyInUseFailureImpl>
    implements _$$EmailAlreadyInUseFailureImplCopyWith<$Res> {
  __$$EmailAlreadyInUseFailureImplCopyWithImpl(
      _$EmailAlreadyInUseFailureImpl _value,
      $Res Function(_$EmailAlreadyInUseFailureImpl) _then)
      : super(_value, _then);

  /// Create a copy of Failure
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? message = freezed,
  }) {
    return _then(_$EmailAlreadyInUseFailureImpl(
      freezed == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc

class _$EmailAlreadyInUseFailureImpl implements EmailAlreadyInUseFailure {
  const _$EmailAlreadyInUseFailureImpl([this.message]);

  @override
  final String? message;

  @override
  String toString() {
    return 'Failure.emailAlreadyInUse(message: $message)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$EmailAlreadyInUseFailureImpl &&
            (identical(other.message, message) || other.message == message));
  }

  @override
  int get hashCode => Object.hash(runtimeType, message);

  /// Create a copy of Failure
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$EmailAlreadyInUseFailureImplCopyWith<_$EmailAlreadyInUseFailureImpl>
      get copyWith => __$$EmailAlreadyInUseFailureImplCopyWithImpl<
          _$EmailAlreadyInUseFailureImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String? message) server,
    required TResult Function(String? message) cache,
    required TResult Function(String? message) network,
    required TResult Function(String? message) invalidCredentials,
    required TResult Function(String? message) unexpected,
    required TResult Function(String? message) emailAlreadyInUse,
    required TResult Function(String? message) unauthenticated,
  }) {
    return emailAlreadyInUse(message);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String? message)? server,
    TResult? Function(String? message)? cache,
    TResult? Function(String? message)? network,
    TResult? Function(String? message)? invalidCredentials,
    TResult? Function(String? message)? unexpected,
    TResult? Function(String? message)? emailAlreadyInUse,
    TResult? Function(String? message)? unauthenticated,
  }) {
    return emailAlreadyInUse?.call(message);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String? message)? server,
    TResult Function(String? message)? cache,
    TResult Function(String? message)? network,
    TResult Function(String? message)? invalidCredentials,
    TResult Function(String? message)? unexpected,
    TResult Function(String? message)? emailAlreadyInUse,
    TResult Function(String? message)? unauthenticated,
    required TResult orElse(),
  }) {
    if (emailAlreadyInUse != null) {
      return emailAlreadyInUse(message);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(ServerFailure value) server,
    required TResult Function(CacheFailure value) cache,
    required TResult Function(NetworkFailure value) network,
    required TResult Function(InvalidCredentialsFailure value)
        invalidCredentials,
    required TResult Function(UnexpectedFailure value) unexpected,
    required TResult Function(EmailAlreadyInUseFailure value) emailAlreadyInUse,
    required TResult Function(UnauthenticatedFailure value) unauthenticated,
  }) {
    return emailAlreadyInUse(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(ServerFailure value)? server,
    TResult? Function(CacheFailure value)? cache,
    TResult? Function(NetworkFailure value)? network,
    TResult? Function(InvalidCredentialsFailure value)? invalidCredentials,
    TResult? Function(UnexpectedFailure value)? unexpected,
    TResult? Function(EmailAlreadyInUseFailure value)? emailAlreadyInUse,
    TResult? Function(UnauthenticatedFailure value)? unauthenticated,
  }) {
    return emailAlreadyInUse?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(ServerFailure value)? server,
    TResult Function(CacheFailure value)? cache,
    TResult Function(NetworkFailure value)? network,
    TResult Function(InvalidCredentialsFailure value)? invalidCredentials,
    TResult Function(UnexpectedFailure value)? unexpected,
    TResult Function(EmailAlreadyInUseFailure value)? emailAlreadyInUse,
    TResult Function(UnauthenticatedFailure value)? unauthenticated,
    required TResult orElse(),
  }) {
    if (emailAlreadyInUse != null) {
      return emailAlreadyInUse(this);
    }
    return orElse();
  }
}

abstract class EmailAlreadyInUseFailure implements Failure {
  const factory EmailAlreadyInUseFailure([final String? message]) =
      _$EmailAlreadyInUseFailureImpl;

  @override
  String? get message;

  /// Create a copy of Failure
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$EmailAlreadyInUseFailureImplCopyWith<_$EmailAlreadyInUseFailureImpl>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$UnauthenticatedFailureImplCopyWith<$Res>
    implements $FailureCopyWith<$Res> {
  factory _$$UnauthenticatedFailureImplCopyWith(
          _$UnauthenticatedFailureImpl value,
          $Res Function(_$UnauthenticatedFailureImpl) then) =
      __$$UnauthenticatedFailureImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String? message});
}

/// @nodoc
class __$$UnauthenticatedFailureImplCopyWithImpl<$Res>
    extends _$FailureCopyWithImpl<$Res, _$UnauthenticatedFailureImpl>
    implements _$$UnauthenticatedFailureImplCopyWith<$Res> {
  __$$UnauthenticatedFailureImplCopyWithImpl(
      _$UnauthenticatedFailureImpl _value,
      $Res Function(_$UnauthenticatedFailureImpl) _then)
      : super(_value, _then);

  /// Create a copy of Failure
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? message = freezed,
  }) {
    return _then(_$UnauthenticatedFailureImpl(
      freezed == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc

class _$UnauthenticatedFailureImpl implements UnauthenticatedFailure {
  const _$UnauthenticatedFailureImpl([this.message]);

  @override
  final String? message;

  @override
  String toString() {
    return 'Failure.unauthenticated(message: $message)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$UnauthenticatedFailureImpl &&
            (identical(other.message, message) || other.message == message));
  }

  @override
  int get hashCode => Object.hash(runtimeType, message);

  /// Create a copy of Failure
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$UnauthenticatedFailureImplCopyWith<_$UnauthenticatedFailureImpl>
      get copyWith => __$$UnauthenticatedFailureImplCopyWithImpl<
          _$UnauthenticatedFailureImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String? message) server,
    required TResult Function(String? message) cache,
    required TResult Function(String? message) network,
    required TResult Function(String? message) invalidCredentials,
    required TResult Function(String? message) unexpected,
    required TResult Function(String? message) emailAlreadyInUse,
    required TResult Function(String? message) unauthenticated,
  }) {
    return unauthenticated(message);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String? message)? server,
    TResult? Function(String? message)? cache,
    TResult? Function(String? message)? network,
    TResult? Function(String? message)? invalidCredentials,
    TResult? Function(String? message)? unexpected,
    TResult? Function(String? message)? emailAlreadyInUse,
    TResult? Function(String? message)? unauthenticated,
  }) {
    return unauthenticated?.call(message);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String? message)? server,
    TResult Function(String? message)? cache,
    TResult Function(String? message)? network,
    TResult Function(String? message)? invalidCredentials,
    TResult Function(String? message)? unexpected,
    TResult Function(String? message)? emailAlreadyInUse,
    TResult Function(String? message)? unauthenticated,
    required TResult orElse(),
  }) {
    if (unauthenticated != null) {
      return unauthenticated(message);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(ServerFailure value) server,
    required TResult Function(CacheFailure value) cache,
    required TResult Function(NetworkFailure value) network,
    required TResult Function(InvalidCredentialsFailure value)
        invalidCredentials,
    required TResult Function(UnexpectedFailure value) unexpected,
    required TResult Function(EmailAlreadyInUseFailure value) emailAlreadyInUse,
    required TResult Function(UnauthenticatedFailure value) unauthenticated,
  }) {
    return unauthenticated(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(ServerFailure value)? server,
    TResult? Function(CacheFailure value)? cache,
    TResult? Function(NetworkFailure value)? network,
    TResult? Function(InvalidCredentialsFailure value)? invalidCredentials,
    TResult? Function(UnexpectedFailure value)? unexpected,
    TResult? Function(EmailAlreadyInUseFailure value)? emailAlreadyInUse,
    TResult? Function(UnauthenticatedFailure value)? unauthenticated,
  }) {
    return unauthenticated?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(ServerFailure value)? server,
    TResult Function(CacheFailure value)? cache,
    TResult Function(NetworkFailure value)? network,
    TResult Function(InvalidCredentialsFailure value)? invalidCredentials,
    TResult Function(UnexpectedFailure value)? unexpected,
    TResult Function(EmailAlreadyInUseFailure value)? emailAlreadyInUse,
    TResult Function(UnauthenticatedFailure value)? unauthenticated,
    required TResult orElse(),
  }) {
    if (unauthenticated != null) {
      return unauthenticated(this);
    }
    return orElse();
  }
}

abstract class UnauthenticatedFailure implements Failure {
  const factory UnauthenticatedFailure([final String? message]) =
      _$UnauthenticatedFailureImpl;

  @override
  String? get message;

  /// Create a copy of Failure
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$UnauthenticatedFailureImplCopyWith<_$UnauthenticatedFailureImpl>
      get copyWith => throw _privateConstructorUsedError;
}
