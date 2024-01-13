// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'bluetooth_connection_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$BluetoothConnectionState {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(DiscoveredDevice? device, bool isConnected)
        loaded,
    required TResult Function(dynamic error) error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(DiscoveredDevice? device, bool isConnected)? loaded,
    TResult? Function(dynamic error)? error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(DiscoveredDevice? device, bool isConnected)? loaded,
    TResult Function(dynamic error)? error,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(BluetoothConnectionStateInitial value) initial,
    required TResult Function(BluetoothConnectionStateLoading value) loading,
    required TResult Function(BluetoothConnectionStateLoaded value) loaded,
    required TResult Function(BluetoothConnectionStateError value) error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(BluetoothConnectionStateInitial value)? initial,
    TResult? Function(BluetoothConnectionStateLoading value)? loading,
    TResult? Function(BluetoothConnectionStateLoaded value)? loaded,
    TResult? Function(BluetoothConnectionStateError value)? error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(BluetoothConnectionStateInitial value)? initial,
    TResult Function(BluetoothConnectionStateLoading value)? loading,
    TResult Function(BluetoothConnectionStateLoaded value)? loaded,
    TResult Function(BluetoothConnectionStateError value)? error,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $BluetoothConnectionStateCopyWith<$Res> {
  factory $BluetoothConnectionStateCopyWith(BluetoothConnectionState value,
          $Res Function(BluetoothConnectionState) then) =
      _$BluetoothConnectionStateCopyWithImpl<$Res, BluetoothConnectionState>;
}

/// @nodoc
class _$BluetoothConnectionStateCopyWithImpl<$Res,
        $Val extends BluetoothConnectionState>
    implements $BluetoothConnectionStateCopyWith<$Res> {
  _$BluetoothConnectionStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$BluetoothConnectionStateInitialImplCopyWith<$Res> {
  factory _$$BluetoothConnectionStateInitialImplCopyWith(
          _$BluetoothConnectionStateInitialImpl value,
          $Res Function(_$BluetoothConnectionStateInitialImpl) then) =
      __$$BluetoothConnectionStateInitialImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$BluetoothConnectionStateInitialImplCopyWithImpl<$Res>
    extends _$BluetoothConnectionStateCopyWithImpl<$Res,
        _$BluetoothConnectionStateInitialImpl>
    implements _$$BluetoothConnectionStateInitialImplCopyWith<$Res> {
  __$$BluetoothConnectionStateInitialImplCopyWithImpl(
      _$BluetoothConnectionStateInitialImpl _value,
      $Res Function(_$BluetoothConnectionStateInitialImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$BluetoothConnectionStateInitialImpl
    with DiagnosticableTreeMixin
    implements BluetoothConnectionStateInitial {
  const _$BluetoothConnectionStateInitialImpl();

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'BluetoothConnectionState.initial()';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
        .add(DiagnosticsProperty('type', 'BluetoothConnectionState.initial'));
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$BluetoothConnectionStateInitialImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(DiscoveredDevice? device, bool isConnected)
        loaded,
    required TResult Function(dynamic error) error,
  }) {
    return initial();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(DiscoveredDevice? device, bool isConnected)? loaded,
    TResult? Function(dynamic error)? error,
  }) {
    return initial?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(DiscoveredDevice? device, bool isConnected)? loaded,
    TResult Function(dynamic error)? error,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(BluetoothConnectionStateInitial value) initial,
    required TResult Function(BluetoothConnectionStateLoading value) loading,
    required TResult Function(BluetoothConnectionStateLoaded value) loaded,
    required TResult Function(BluetoothConnectionStateError value) error,
  }) {
    return initial(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(BluetoothConnectionStateInitial value)? initial,
    TResult? Function(BluetoothConnectionStateLoading value)? loading,
    TResult? Function(BluetoothConnectionStateLoaded value)? loaded,
    TResult? Function(BluetoothConnectionStateError value)? error,
  }) {
    return initial?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(BluetoothConnectionStateInitial value)? initial,
    TResult Function(BluetoothConnectionStateLoading value)? loading,
    TResult Function(BluetoothConnectionStateLoaded value)? loaded,
    TResult Function(BluetoothConnectionStateError value)? error,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial(this);
    }
    return orElse();
  }
}

abstract class BluetoothConnectionStateInitial
    implements BluetoothConnectionState {
  const factory BluetoothConnectionStateInitial() =
      _$BluetoothConnectionStateInitialImpl;
}

/// @nodoc
abstract class _$$BluetoothConnectionStateLoadingImplCopyWith<$Res> {
  factory _$$BluetoothConnectionStateLoadingImplCopyWith(
          _$BluetoothConnectionStateLoadingImpl value,
          $Res Function(_$BluetoothConnectionStateLoadingImpl) then) =
      __$$BluetoothConnectionStateLoadingImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$BluetoothConnectionStateLoadingImplCopyWithImpl<$Res>
    extends _$BluetoothConnectionStateCopyWithImpl<$Res,
        _$BluetoothConnectionStateLoadingImpl>
    implements _$$BluetoothConnectionStateLoadingImplCopyWith<$Res> {
  __$$BluetoothConnectionStateLoadingImplCopyWithImpl(
      _$BluetoothConnectionStateLoadingImpl _value,
      $Res Function(_$BluetoothConnectionStateLoadingImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$BluetoothConnectionStateLoadingImpl
    with DiagnosticableTreeMixin
    implements BluetoothConnectionStateLoading {
  const _$BluetoothConnectionStateLoadingImpl();

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'BluetoothConnectionState.loading()';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
        .add(DiagnosticsProperty('type', 'BluetoothConnectionState.loading'));
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$BluetoothConnectionStateLoadingImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(DiscoveredDevice? device, bool isConnected)
        loaded,
    required TResult Function(dynamic error) error,
  }) {
    return loading();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(DiscoveredDevice? device, bool isConnected)? loaded,
    TResult? Function(dynamic error)? error,
  }) {
    return loading?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(DiscoveredDevice? device, bool isConnected)? loaded,
    TResult Function(dynamic error)? error,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(BluetoothConnectionStateInitial value) initial,
    required TResult Function(BluetoothConnectionStateLoading value) loading,
    required TResult Function(BluetoothConnectionStateLoaded value) loaded,
    required TResult Function(BluetoothConnectionStateError value) error,
  }) {
    return loading(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(BluetoothConnectionStateInitial value)? initial,
    TResult? Function(BluetoothConnectionStateLoading value)? loading,
    TResult? Function(BluetoothConnectionStateLoaded value)? loaded,
    TResult? Function(BluetoothConnectionStateError value)? error,
  }) {
    return loading?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(BluetoothConnectionStateInitial value)? initial,
    TResult Function(BluetoothConnectionStateLoading value)? loading,
    TResult Function(BluetoothConnectionStateLoaded value)? loaded,
    TResult Function(BluetoothConnectionStateError value)? error,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading(this);
    }
    return orElse();
  }
}

abstract class BluetoothConnectionStateLoading
    implements BluetoothConnectionState {
  const factory BluetoothConnectionStateLoading() =
      _$BluetoothConnectionStateLoadingImpl;
}

/// @nodoc
abstract class _$$BluetoothConnectionStateLoadedImplCopyWith<$Res> {
  factory _$$BluetoothConnectionStateLoadedImplCopyWith(
          _$BluetoothConnectionStateLoadedImpl value,
          $Res Function(_$BluetoothConnectionStateLoadedImpl) then) =
      __$$BluetoothConnectionStateLoadedImplCopyWithImpl<$Res>;
  @useResult
  $Res call({DiscoveredDevice? device, bool isConnected});
}

/// @nodoc
class __$$BluetoothConnectionStateLoadedImplCopyWithImpl<$Res>
    extends _$BluetoothConnectionStateCopyWithImpl<$Res,
        _$BluetoothConnectionStateLoadedImpl>
    implements _$$BluetoothConnectionStateLoadedImplCopyWith<$Res> {
  __$$BluetoothConnectionStateLoadedImplCopyWithImpl(
      _$BluetoothConnectionStateLoadedImpl _value,
      $Res Function(_$BluetoothConnectionStateLoadedImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? device = freezed,
    Object? isConnected = null,
  }) {
    return _then(_$BluetoothConnectionStateLoadedImpl(
      freezed == device
          ? _value.device
          : device // ignore: cast_nullable_to_non_nullable
              as DiscoveredDevice?,
      null == isConnected
          ? _value.isConnected
          : isConnected // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc

class _$BluetoothConnectionStateLoadedImpl
    with DiagnosticableTreeMixin
    implements BluetoothConnectionStateLoaded {
  const _$BluetoothConnectionStateLoadedImpl(this.device, this.isConnected);

  @override
  final DiscoveredDevice? device;
  @override
  final bool isConnected;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'BluetoothConnectionState.loaded(device: $device, isConnected: $isConnected)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'BluetoothConnectionState.loaded'))
      ..add(DiagnosticsProperty('device', device))
      ..add(DiagnosticsProperty('isConnected', isConnected));
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$BluetoothConnectionStateLoadedImpl &&
            (identical(other.device, device) || other.device == device) &&
            (identical(other.isConnected, isConnected) ||
                other.isConnected == isConnected));
  }

  @override
  int get hashCode => Object.hash(runtimeType, device, isConnected);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$BluetoothConnectionStateLoadedImplCopyWith<
          _$BluetoothConnectionStateLoadedImpl>
      get copyWith => __$$BluetoothConnectionStateLoadedImplCopyWithImpl<
          _$BluetoothConnectionStateLoadedImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(DiscoveredDevice? device, bool isConnected)
        loaded,
    required TResult Function(dynamic error) error,
  }) {
    return loaded(device, isConnected);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(DiscoveredDevice? device, bool isConnected)? loaded,
    TResult? Function(dynamic error)? error,
  }) {
    return loaded?.call(device, isConnected);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(DiscoveredDevice? device, bool isConnected)? loaded,
    TResult Function(dynamic error)? error,
    required TResult orElse(),
  }) {
    if (loaded != null) {
      return loaded(device, isConnected);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(BluetoothConnectionStateInitial value) initial,
    required TResult Function(BluetoothConnectionStateLoading value) loading,
    required TResult Function(BluetoothConnectionStateLoaded value) loaded,
    required TResult Function(BluetoothConnectionStateError value) error,
  }) {
    return loaded(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(BluetoothConnectionStateInitial value)? initial,
    TResult? Function(BluetoothConnectionStateLoading value)? loading,
    TResult? Function(BluetoothConnectionStateLoaded value)? loaded,
    TResult? Function(BluetoothConnectionStateError value)? error,
  }) {
    return loaded?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(BluetoothConnectionStateInitial value)? initial,
    TResult Function(BluetoothConnectionStateLoading value)? loading,
    TResult Function(BluetoothConnectionStateLoaded value)? loaded,
    TResult Function(BluetoothConnectionStateError value)? error,
    required TResult orElse(),
  }) {
    if (loaded != null) {
      return loaded(this);
    }
    return orElse();
  }
}

abstract class BluetoothConnectionStateLoaded
    implements BluetoothConnectionState {
  const factory BluetoothConnectionStateLoaded(
          final DiscoveredDevice? device, final bool isConnected) =
      _$BluetoothConnectionStateLoadedImpl;

  DiscoveredDevice? get device;
  bool get isConnected;
  @JsonKey(ignore: true)
  _$$BluetoothConnectionStateLoadedImplCopyWith<
          _$BluetoothConnectionStateLoadedImpl>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$BluetoothConnectionStateErrorImplCopyWith<$Res> {
  factory _$$BluetoothConnectionStateErrorImplCopyWith(
          _$BluetoothConnectionStateErrorImpl value,
          $Res Function(_$BluetoothConnectionStateErrorImpl) then) =
      __$$BluetoothConnectionStateErrorImplCopyWithImpl<$Res>;
  @useResult
  $Res call({dynamic error});
}

/// @nodoc
class __$$BluetoothConnectionStateErrorImplCopyWithImpl<$Res>
    extends _$BluetoothConnectionStateCopyWithImpl<$Res,
        _$BluetoothConnectionStateErrorImpl>
    implements _$$BluetoothConnectionStateErrorImplCopyWith<$Res> {
  __$$BluetoothConnectionStateErrorImplCopyWithImpl(
      _$BluetoothConnectionStateErrorImpl _value,
      $Res Function(_$BluetoothConnectionStateErrorImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? error = freezed,
  }) {
    return _then(_$BluetoothConnectionStateErrorImpl(
      error: freezed == error
          ? _value.error
          : error // ignore: cast_nullable_to_non_nullable
              as dynamic,
    ));
  }
}

/// @nodoc

class _$BluetoothConnectionStateErrorImpl
    with DiagnosticableTreeMixin
    implements BluetoothConnectionStateError {
  const _$BluetoothConnectionStateErrorImpl({required this.error});

  @override
  final dynamic error;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'BluetoothConnectionState.error(error: $error)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'BluetoothConnectionState.error'))
      ..add(DiagnosticsProperty('error', error));
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$BluetoothConnectionStateErrorImpl &&
            const DeepCollectionEquality().equals(other.error, error));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(error));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$BluetoothConnectionStateErrorImplCopyWith<
          _$BluetoothConnectionStateErrorImpl>
      get copyWith => __$$BluetoothConnectionStateErrorImplCopyWithImpl<
          _$BluetoothConnectionStateErrorImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(DiscoveredDevice? device, bool isConnected)
        loaded,
    required TResult Function(dynamic error) error,
  }) {
    return error(this.error);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(DiscoveredDevice? device, bool isConnected)? loaded,
    TResult? Function(dynamic error)? error,
  }) {
    return error?.call(this.error);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(DiscoveredDevice? device, bool isConnected)? loaded,
    TResult Function(dynamic error)? error,
    required TResult orElse(),
  }) {
    if (error != null) {
      return error(this.error);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(BluetoothConnectionStateInitial value) initial,
    required TResult Function(BluetoothConnectionStateLoading value) loading,
    required TResult Function(BluetoothConnectionStateLoaded value) loaded,
    required TResult Function(BluetoothConnectionStateError value) error,
  }) {
    return error(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(BluetoothConnectionStateInitial value)? initial,
    TResult? Function(BluetoothConnectionStateLoading value)? loading,
    TResult? Function(BluetoothConnectionStateLoaded value)? loaded,
    TResult? Function(BluetoothConnectionStateError value)? error,
  }) {
    return error?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(BluetoothConnectionStateInitial value)? initial,
    TResult Function(BluetoothConnectionStateLoading value)? loading,
    TResult Function(BluetoothConnectionStateLoaded value)? loaded,
    TResult Function(BluetoothConnectionStateError value)? error,
    required TResult orElse(),
  }) {
    if (error != null) {
      return error(this);
    }
    return orElse();
  }
}

abstract class BluetoothConnectionStateError
    implements BluetoothConnectionState {
  const factory BluetoothConnectionStateError({required final dynamic error}) =
      _$BluetoothConnectionStateErrorImpl;

  dynamic get error;
  @JsonKey(ignore: true)
  _$$BluetoothConnectionStateErrorImplCopyWith<
          _$BluetoothConnectionStateErrorImpl>
      get copyWith => throw _privateConstructorUsedError;
}
