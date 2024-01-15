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
    required TResult Function(List<DiscoveredDevice> devices) observing,
    required TResult Function() connecting,
    required TResult Function() connected,
    required TResult Function(List<int> imuData, List<int> objectTempData,
            List<int> sensorTempData)
        dataReceived,
    required TResult Function() disconnecting,
    required TResult Function() disconnected,
    required TResult Function(String message) error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function(List<DiscoveredDevice> devices)? observing,
    TResult? Function()? connecting,
    TResult? Function()? connected,
    TResult? Function(List<int> imuData, List<int> objectTempData,
            List<int> sensorTempData)?
        dataReceived,
    TResult? Function()? disconnecting,
    TResult? Function()? disconnected,
    TResult? Function(String message)? error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function(List<DiscoveredDevice> devices)? observing,
    TResult Function()? connecting,
    TResult Function()? connected,
    TResult Function(List<int> imuData, List<int> objectTempData,
            List<int> sensorTempData)?
        dataReceived,
    TResult Function()? disconnecting,
    TResult Function()? disconnected,
    TResult Function(String message)? error,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(BluetoothConnectionStateInitial value) initial,
    required TResult Function(BluetoothConnectionStateObserving value)
        observing,
    required TResult Function(BluetoothConnectionStateConnecting value)
        connecting,
    required TResult Function(BluetoothConnectionStateConnected value)
        connected,
    required TResult Function(BluetoothConnectionStateDataReceived value)
        dataReceived,
    required TResult Function(BluetoothConnectionStateDisconnecting value)
        disconnecting,
    required TResult Function(BluetoothConnectionStateDisconnected value)
        disconnected,
    required TResult Function(BluetoothConnectionStateError value) error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(BluetoothConnectionStateInitial value)? initial,
    TResult? Function(BluetoothConnectionStateObserving value)? observing,
    TResult? Function(BluetoothConnectionStateConnecting value)? connecting,
    TResult? Function(BluetoothConnectionStateConnected value)? connected,
    TResult? Function(BluetoothConnectionStateDataReceived value)? dataReceived,
    TResult? Function(BluetoothConnectionStateDisconnecting value)?
        disconnecting,
    TResult? Function(BluetoothConnectionStateDisconnected value)? disconnected,
    TResult? Function(BluetoothConnectionStateError value)? error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(BluetoothConnectionStateInitial value)? initial,
    TResult Function(BluetoothConnectionStateObserving value)? observing,
    TResult Function(BluetoothConnectionStateConnecting value)? connecting,
    TResult Function(BluetoothConnectionStateConnected value)? connected,
    TResult Function(BluetoothConnectionStateDataReceived value)? dataReceived,
    TResult Function(BluetoothConnectionStateDisconnecting value)?
        disconnecting,
    TResult Function(BluetoothConnectionStateDisconnected value)? disconnected,
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
    required TResult Function(List<DiscoveredDevice> devices) observing,
    required TResult Function() connecting,
    required TResult Function() connected,
    required TResult Function(List<int> imuData, List<int> objectTempData,
            List<int> sensorTempData)
        dataReceived,
    required TResult Function() disconnecting,
    required TResult Function() disconnected,
    required TResult Function(String message) error,
  }) {
    return initial();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function(List<DiscoveredDevice> devices)? observing,
    TResult? Function()? connecting,
    TResult? Function()? connected,
    TResult? Function(List<int> imuData, List<int> objectTempData,
            List<int> sensorTempData)?
        dataReceived,
    TResult? Function()? disconnecting,
    TResult? Function()? disconnected,
    TResult? Function(String message)? error,
  }) {
    return initial?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function(List<DiscoveredDevice> devices)? observing,
    TResult Function()? connecting,
    TResult Function()? connected,
    TResult Function(List<int> imuData, List<int> objectTempData,
            List<int> sensorTempData)?
        dataReceived,
    TResult Function()? disconnecting,
    TResult Function()? disconnected,
    TResult Function(String message)? error,
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
    required TResult Function(BluetoothConnectionStateObserving value)
        observing,
    required TResult Function(BluetoothConnectionStateConnecting value)
        connecting,
    required TResult Function(BluetoothConnectionStateConnected value)
        connected,
    required TResult Function(BluetoothConnectionStateDataReceived value)
        dataReceived,
    required TResult Function(BluetoothConnectionStateDisconnecting value)
        disconnecting,
    required TResult Function(BluetoothConnectionStateDisconnected value)
        disconnected,
    required TResult Function(BluetoothConnectionStateError value) error,
  }) {
    return initial(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(BluetoothConnectionStateInitial value)? initial,
    TResult? Function(BluetoothConnectionStateObserving value)? observing,
    TResult? Function(BluetoothConnectionStateConnecting value)? connecting,
    TResult? Function(BluetoothConnectionStateConnected value)? connected,
    TResult? Function(BluetoothConnectionStateDataReceived value)? dataReceived,
    TResult? Function(BluetoothConnectionStateDisconnecting value)?
        disconnecting,
    TResult? Function(BluetoothConnectionStateDisconnected value)? disconnected,
    TResult? Function(BluetoothConnectionStateError value)? error,
  }) {
    return initial?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(BluetoothConnectionStateInitial value)? initial,
    TResult Function(BluetoothConnectionStateObserving value)? observing,
    TResult Function(BluetoothConnectionStateConnecting value)? connecting,
    TResult Function(BluetoothConnectionStateConnected value)? connected,
    TResult Function(BluetoothConnectionStateDataReceived value)? dataReceived,
    TResult Function(BluetoothConnectionStateDisconnecting value)?
        disconnecting,
    TResult Function(BluetoothConnectionStateDisconnected value)? disconnected,
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
abstract class _$$BluetoothConnectionStateObservingImplCopyWith<$Res> {
  factory _$$BluetoothConnectionStateObservingImplCopyWith(
          _$BluetoothConnectionStateObservingImpl value,
          $Res Function(_$BluetoothConnectionStateObservingImpl) then) =
      __$$BluetoothConnectionStateObservingImplCopyWithImpl<$Res>;
  @useResult
  $Res call({List<DiscoveredDevice> devices});
}

/// @nodoc
class __$$BluetoothConnectionStateObservingImplCopyWithImpl<$Res>
    extends _$BluetoothConnectionStateCopyWithImpl<$Res,
        _$BluetoothConnectionStateObservingImpl>
    implements _$$BluetoothConnectionStateObservingImplCopyWith<$Res> {
  __$$BluetoothConnectionStateObservingImplCopyWithImpl(
      _$BluetoothConnectionStateObservingImpl _value,
      $Res Function(_$BluetoothConnectionStateObservingImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? devices = null,
  }) {
    return _then(_$BluetoothConnectionStateObservingImpl(
      devices: null == devices
          ? _value._devices
          : devices // ignore: cast_nullable_to_non_nullable
              as List<DiscoveredDevice>,
    ));
  }
}

/// @nodoc

class _$BluetoothConnectionStateObservingImpl
    with DiagnosticableTreeMixin
    implements BluetoothConnectionStateObserving {
  const _$BluetoothConnectionStateObservingImpl(
      {required final List<DiscoveredDevice> devices})
      : _devices = devices;

  final List<DiscoveredDevice> _devices;
  @override
  List<DiscoveredDevice> get devices {
    if (_devices is EqualUnmodifiableListView) return _devices;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_devices);
  }

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'BluetoothConnectionState.observing(devices: $devices)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'BluetoothConnectionState.observing'))
      ..add(DiagnosticsProperty('devices', devices));
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$BluetoothConnectionStateObservingImpl &&
            const DeepCollectionEquality().equals(other._devices, _devices));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(_devices));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$BluetoothConnectionStateObservingImplCopyWith<
          _$BluetoothConnectionStateObservingImpl>
      get copyWith => __$$BluetoothConnectionStateObservingImplCopyWithImpl<
          _$BluetoothConnectionStateObservingImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function(List<DiscoveredDevice> devices) observing,
    required TResult Function() connecting,
    required TResult Function() connected,
    required TResult Function(List<int> imuData, List<int> objectTempData,
            List<int> sensorTempData)
        dataReceived,
    required TResult Function() disconnecting,
    required TResult Function() disconnected,
    required TResult Function(String message) error,
  }) {
    return observing(devices);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function(List<DiscoveredDevice> devices)? observing,
    TResult? Function()? connecting,
    TResult? Function()? connected,
    TResult? Function(List<int> imuData, List<int> objectTempData,
            List<int> sensorTempData)?
        dataReceived,
    TResult? Function()? disconnecting,
    TResult? Function()? disconnected,
    TResult? Function(String message)? error,
  }) {
    return observing?.call(devices);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function(List<DiscoveredDevice> devices)? observing,
    TResult Function()? connecting,
    TResult Function()? connected,
    TResult Function(List<int> imuData, List<int> objectTempData,
            List<int> sensorTempData)?
        dataReceived,
    TResult Function()? disconnecting,
    TResult Function()? disconnected,
    TResult Function(String message)? error,
    required TResult orElse(),
  }) {
    if (observing != null) {
      return observing(devices);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(BluetoothConnectionStateInitial value) initial,
    required TResult Function(BluetoothConnectionStateObserving value)
        observing,
    required TResult Function(BluetoothConnectionStateConnecting value)
        connecting,
    required TResult Function(BluetoothConnectionStateConnected value)
        connected,
    required TResult Function(BluetoothConnectionStateDataReceived value)
        dataReceived,
    required TResult Function(BluetoothConnectionStateDisconnecting value)
        disconnecting,
    required TResult Function(BluetoothConnectionStateDisconnected value)
        disconnected,
    required TResult Function(BluetoothConnectionStateError value) error,
  }) {
    return observing(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(BluetoothConnectionStateInitial value)? initial,
    TResult? Function(BluetoothConnectionStateObserving value)? observing,
    TResult? Function(BluetoothConnectionStateConnecting value)? connecting,
    TResult? Function(BluetoothConnectionStateConnected value)? connected,
    TResult? Function(BluetoothConnectionStateDataReceived value)? dataReceived,
    TResult? Function(BluetoothConnectionStateDisconnecting value)?
        disconnecting,
    TResult? Function(BluetoothConnectionStateDisconnected value)? disconnected,
    TResult? Function(BluetoothConnectionStateError value)? error,
  }) {
    return observing?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(BluetoothConnectionStateInitial value)? initial,
    TResult Function(BluetoothConnectionStateObserving value)? observing,
    TResult Function(BluetoothConnectionStateConnecting value)? connecting,
    TResult Function(BluetoothConnectionStateConnected value)? connected,
    TResult Function(BluetoothConnectionStateDataReceived value)? dataReceived,
    TResult Function(BluetoothConnectionStateDisconnecting value)?
        disconnecting,
    TResult Function(BluetoothConnectionStateDisconnected value)? disconnected,
    TResult Function(BluetoothConnectionStateError value)? error,
    required TResult orElse(),
  }) {
    if (observing != null) {
      return observing(this);
    }
    return orElse();
  }
}

abstract class BluetoothConnectionStateObserving
    implements BluetoothConnectionState {
  const factory BluetoothConnectionStateObserving(
          {required final List<DiscoveredDevice> devices}) =
      _$BluetoothConnectionStateObservingImpl;

  List<DiscoveredDevice> get devices;
  @JsonKey(ignore: true)
  _$$BluetoothConnectionStateObservingImplCopyWith<
          _$BluetoothConnectionStateObservingImpl>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$BluetoothConnectionStateConnectingImplCopyWith<$Res> {
  factory _$$BluetoothConnectionStateConnectingImplCopyWith(
          _$BluetoothConnectionStateConnectingImpl value,
          $Res Function(_$BluetoothConnectionStateConnectingImpl) then) =
      __$$BluetoothConnectionStateConnectingImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$BluetoothConnectionStateConnectingImplCopyWithImpl<$Res>
    extends _$BluetoothConnectionStateCopyWithImpl<$Res,
        _$BluetoothConnectionStateConnectingImpl>
    implements _$$BluetoothConnectionStateConnectingImplCopyWith<$Res> {
  __$$BluetoothConnectionStateConnectingImplCopyWithImpl(
      _$BluetoothConnectionStateConnectingImpl _value,
      $Res Function(_$BluetoothConnectionStateConnectingImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$BluetoothConnectionStateConnectingImpl
    with DiagnosticableTreeMixin
    implements BluetoothConnectionStateConnecting {
  const _$BluetoothConnectionStateConnectingImpl();

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'BluetoothConnectionState.connecting()';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties.add(
        DiagnosticsProperty('type', 'BluetoothConnectionState.connecting'));
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$BluetoothConnectionStateConnectingImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function(List<DiscoveredDevice> devices) observing,
    required TResult Function() connecting,
    required TResult Function() connected,
    required TResult Function(List<int> imuData, List<int> objectTempData,
            List<int> sensorTempData)
        dataReceived,
    required TResult Function() disconnecting,
    required TResult Function() disconnected,
    required TResult Function(String message) error,
  }) {
    return connecting();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function(List<DiscoveredDevice> devices)? observing,
    TResult? Function()? connecting,
    TResult? Function()? connected,
    TResult? Function(List<int> imuData, List<int> objectTempData,
            List<int> sensorTempData)?
        dataReceived,
    TResult? Function()? disconnecting,
    TResult? Function()? disconnected,
    TResult? Function(String message)? error,
  }) {
    return connecting?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function(List<DiscoveredDevice> devices)? observing,
    TResult Function()? connecting,
    TResult Function()? connected,
    TResult Function(List<int> imuData, List<int> objectTempData,
            List<int> sensorTempData)?
        dataReceived,
    TResult Function()? disconnecting,
    TResult Function()? disconnected,
    TResult Function(String message)? error,
    required TResult orElse(),
  }) {
    if (connecting != null) {
      return connecting();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(BluetoothConnectionStateInitial value) initial,
    required TResult Function(BluetoothConnectionStateObserving value)
        observing,
    required TResult Function(BluetoothConnectionStateConnecting value)
        connecting,
    required TResult Function(BluetoothConnectionStateConnected value)
        connected,
    required TResult Function(BluetoothConnectionStateDataReceived value)
        dataReceived,
    required TResult Function(BluetoothConnectionStateDisconnecting value)
        disconnecting,
    required TResult Function(BluetoothConnectionStateDisconnected value)
        disconnected,
    required TResult Function(BluetoothConnectionStateError value) error,
  }) {
    return connecting(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(BluetoothConnectionStateInitial value)? initial,
    TResult? Function(BluetoothConnectionStateObserving value)? observing,
    TResult? Function(BluetoothConnectionStateConnecting value)? connecting,
    TResult? Function(BluetoothConnectionStateConnected value)? connected,
    TResult? Function(BluetoothConnectionStateDataReceived value)? dataReceived,
    TResult? Function(BluetoothConnectionStateDisconnecting value)?
        disconnecting,
    TResult? Function(BluetoothConnectionStateDisconnected value)? disconnected,
    TResult? Function(BluetoothConnectionStateError value)? error,
  }) {
    return connecting?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(BluetoothConnectionStateInitial value)? initial,
    TResult Function(BluetoothConnectionStateObserving value)? observing,
    TResult Function(BluetoothConnectionStateConnecting value)? connecting,
    TResult Function(BluetoothConnectionStateConnected value)? connected,
    TResult Function(BluetoothConnectionStateDataReceived value)? dataReceived,
    TResult Function(BluetoothConnectionStateDisconnecting value)?
        disconnecting,
    TResult Function(BluetoothConnectionStateDisconnected value)? disconnected,
    TResult Function(BluetoothConnectionStateError value)? error,
    required TResult orElse(),
  }) {
    if (connecting != null) {
      return connecting(this);
    }
    return orElse();
  }
}

abstract class BluetoothConnectionStateConnecting
    implements BluetoothConnectionState {
  const factory BluetoothConnectionStateConnecting() =
      _$BluetoothConnectionStateConnectingImpl;
}

/// @nodoc
abstract class _$$BluetoothConnectionStateConnectedImplCopyWith<$Res> {
  factory _$$BluetoothConnectionStateConnectedImplCopyWith(
          _$BluetoothConnectionStateConnectedImpl value,
          $Res Function(_$BluetoothConnectionStateConnectedImpl) then) =
      __$$BluetoothConnectionStateConnectedImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$BluetoothConnectionStateConnectedImplCopyWithImpl<$Res>
    extends _$BluetoothConnectionStateCopyWithImpl<$Res,
        _$BluetoothConnectionStateConnectedImpl>
    implements _$$BluetoothConnectionStateConnectedImplCopyWith<$Res> {
  __$$BluetoothConnectionStateConnectedImplCopyWithImpl(
      _$BluetoothConnectionStateConnectedImpl _value,
      $Res Function(_$BluetoothConnectionStateConnectedImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$BluetoothConnectionStateConnectedImpl
    with DiagnosticableTreeMixin
    implements BluetoothConnectionStateConnected {
  const _$BluetoothConnectionStateConnectedImpl();

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'BluetoothConnectionState.connected()';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
        .add(DiagnosticsProperty('type', 'BluetoothConnectionState.connected'));
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$BluetoothConnectionStateConnectedImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function(List<DiscoveredDevice> devices) observing,
    required TResult Function() connecting,
    required TResult Function() connected,
    required TResult Function(List<int> imuData, List<int> objectTempData,
            List<int> sensorTempData)
        dataReceived,
    required TResult Function() disconnecting,
    required TResult Function() disconnected,
    required TResult Function(String message) error,
  }) {
    return connected();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function(List<DiscoveredDevice> devices)? observing,
    TResult? Function()? connecting,
    TResult? Function()? connected,
    TResult? Function(List<int> imuData, List<int> objectTempData,
            List<int> sensorTempData)?
        dataReceived,
    TResult? Function()? disconnecting,
    TResult? Function()? disconnected,
    TResult? Function(String message)? error,
  }) {
    return connected?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function(List<DiscoveredDevice> devices)? observing,
    TResult Function()? connecting,
    TResult Function()? connected,
    TResult Function(List<int> imuData, List<int> objectTempData,
            List<int> sensorTempData)?
        dataReceived,
    TResult Function()? disconnecting,
    TResult Function()? disconnected,
    TResult Function(String message)? error,
    required TResult orElse(),
  }) {
    if (connected != null) {
      return connected();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(BluetoothConnectionStateInitial value) initial,
    required TResult Function(BluetoothConnectionStateObserving value)
        observing,
    required TResult Function(BluetoothConnectionStateConnecting value)
        connecting,
    required TResult Function(BluetoothConnectionStateConnected value)
        connected,
    required TResult Function(BluetoothConnectionStateDataReceived value)
        dataReceived,
    required TResult Function(BluetoothConnectionStateDisconnecting value)
        disconnecting,
    required TResult Function(BluetoothConnectionStateDisconnected value)
        disconnected,
    required TResult Function(BluetoothConnectionStateError value) error,
  }) {
    return connected(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(BluetoothConnectionStateInitial value)? initial,
    TResult? Function(BluetoothConnectionStateObserving value)? observing,
    TResult? Function(BluetoothConnectionStateConnecting value)? connecting,
    TResult? Function(BluetoothConnectionStateConnected value)? connected,
    TResult? Function(BluetoothConnectionStateDataReceived value)? dataReceived,
    TResult? Function(BluetoothConnectionStateDisconnecting value)?
        disconnecting,
    TResult? Function(BluetoothConnectionStateDisconnected value)? disconnected,
    TResult? Function(BluetoothConnectionStateError value)? error,
  }) {
    return connected?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(BluetoothConnectionStateInitial value)? initial,
    TResult Function(BluetoothConnectionStateObserving value)? observing,
    TResult Function(BluetoothConnectionStateConnecting value)? connecting,
    TResult Function(BluetoothConnectionStateConnected value)? connected,
    TResult Function(BluetoothConnectionStateDataReceived value)? dataReceived,
    TResult Function(BluetoothConnectionStateDisconnecting value)?
        disconnecting,
    TResult Function(BluetoothConnectionStateDisconnected value)? disconnected,
    TResult Function(BluetoothConnectionStateError value)? error,
    required TResult orElse(),
  }) {
    if (connected != null) {
      return connected(this);
    }
    return orElse();
  }
}

abstract class BluetoothConnectionStateConnected
    implements BluetoothConnectionState {
  const factory BluetoothConnectionStateConnected() =
      _$BluetoothConnectionStateConnectedImpl;
}

/// @nodoc
abstract class _$$BluetoothConnectionStateDataReceivedImplCopyWith<$Res> {
  factory _$$BluetoothConnectionStateDataReceivedImplCopyWith(
          _$BluetoothConnectionStateDataReceivedImpl value,
          $Res Function(_$BluetoothConnectionStateDataReceivedImpl) then) =
      __$$BluetoothConnectionStateDataReceivedImplCopyWithImpl<$Res>;
  @useResult
  $Res call(
      {List<int> imuData, List<int> objectTempData, List<int> sensorTempData});
}

/// @nodoc
class __$$BluetoothConnectionStateDataReceivedImplCopyWithImpl<$Res>
    extends _$BluetoothConnectionStateCopyWithImpl<$Res,
        _$BluetoothConnectionStateDataReceivedImpl>
    implements _$$BluetoothConnectionStateDataReceivedImplCopyWith<$Res> {
  __$$BluetoothConnectionStateDataReceivedImplCopyWithImpl(
      _$BluetoothConnectionStateDataReceivedImpl _value,
      $Res Function(_$BluetoothConnectionStateDataReceivedImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? imuData = null,
    Object? objectTempData = null,
    Object? sensorTempData = null,
  }) {
    return _then(_$BluetoothConnectionStateDataReceivedImpl(
      imuData: null == imuData
          ? _value._imuData
          : imuData // ignore: cast_nullable_to_non_nullable
              as List<int>,
      objectTempData: null == objectTempData
          ? _value._objectTempData
          : objectTempData // ignore: cast_nullable_to_non_nullable
              as List<int>,
      sensorTempData: null == sensorTempData
          ? _value._sensorTempData
          : sensorTempData // ignore: cast_nullable_to_non_nullable
              as List<int>,
    ));
  }
}

/// @nodoc

class _$BluetoothConnectionStateDataReceivedImpl
    with DiagnosticableTreeMixin
    implements BluetoothConnectionStateDataReceived {
  const _$BluetoothConnectionStateDataReceivedImpl(
      {required final List<int> imuData,
      required final List<int> objectTempData,
      required final List<int> sensorTempData})
      : _imuData = imuData,
        _objectTempData = objectTempData,
        _sensorTempData = sensorTempData;

  final List<int> _imuData;
  @override
  List<int> get imuData {
    if (_imuData is EqualUnmodifiableListView) return _imuData;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_imuData);
  }

  final List<int> _objectTempData;
  @override
  List<int> get objectTempData {
    if (_objectTempData is EqualUnmodifiableListView) return _objectTempData;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_objectTempData);
  }

  final List<int> _sensorTempData;
  @override
  List<int> get sensorTempData {
    if (_sensorTempData is EqualUnmodifiableListView) return _sensorTempData;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_sensorTempData);
  }

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'BluetoothConnectionState.dataReceived(imuData: $imuData, objectTempData: $objectTempData, sensorTempData: $sensorTempData)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(
          DiagnosticsProperty('type', 'BluetoothConnectionState.dataReceived'))
      ..add(DiagnosticsProperty('imuData', imuData))
      ..add(DiagnosticsProperty('objectTempData', objectTempData))
      ..add(DiagnosticsProperty('sensorTempData', sensorTempData));
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$BluetoothConnectionStateDataReceivedImpl &&
            const DeepCollectionEquality().equals(other._imuData, _imuData) &&
            const DeepCollectionEquality()
                .equals(other._objectTempData, _objectTempData) &&
            const DeepCollectionEquality()
                .equals(other._sensorTempData, _sensorTempData));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(_imuData),
      const DeepCollectionEquality().hash(_objectTempData),
      const DeepCollectionEquality().hash(_sensorTempData));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$BluetoothConnectionStateDataReceivedImplCopyWith<
          _$BluetoothConnectionStateDataReceivedImpl>
      get copyWith => __$$BluetoothConnectionStateDataReceivedImplCopyWithImpl<
          _$BluetoothConnectionStateDataReceivedImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function(List<DiscoveredDevice> devices) observing,
    required TResult Function() connecting,
    required TResult Function() connected,
    required TResult Function(List<int> imuData, List<int> objectTempData,
            List<int> sensorTempData)
        dataReceived,
    required TResult Function() disconnecting,
    required TResult Function() disconnected,
    required TResult Function(String message) error,
  }) {
    return dataReceived(imuData, objectTempData, sensorTempData);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function(List<DiscoveredDevice> devices)? observing,
    TResult? Function()? connecting,
    TResult? Function()? connected,
    TResult? Function(List<int> imuData, List<int> objectTempData,
            List<int> sensorTempData)?
        dataReceived,
    TResult? Function()? disconnecting,
    TResult? Function()? disconnected,
    TResult? Function(String message)? error,
  }) {
    return dataReceived?.call(imuData, objectTempData, sensorTempData);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function(List<DiscoveredDevice> devices)? observing,
    TResult Function()? connecting,
    TResult Function()? connected,
    TResult Function(List<int> imuData, List<int> objectTempData,
            List<int> sensorTempData)?
        dataReceived,
    TResult Function()? disconnecting,
    TResult Function()? disconnected,
    TResult Function(String message)? error,
    required TResult orElse(),
  }) {
    if (dataReceived != null) {
      return dataReceived(imuData, objectTempData, sensorTempData);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(BluetoothConnectionStateInitial value) initial,
    required TResult Function(BluetoothConnectionStateObserving value)
        observing,
    required TResult Function(BluetoothConnectionStateConnecting value)
        connecting,
    required TResult Function(BluetoothConnectionStateConnected value)
        connected,
    required TResult Function(BluetoothConnectionStateDataReceived value)
        dataReceived,
    required TResult Function(BluetoothConnectionStateDisconnecting value)
        disconnecting,
    required TResult Function(BluetoothConnectionStateDisconnected value)
        disconnected,
    required TResult Function(BluetoothConnectionStateError value) error,
  }) {
    return dataReceived(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(BluetoothConnectionStateInitial value)? initial,
    TResult? Function(BluetoothConnectionStateObserving value)? observing,
    TResult? Function(BluetoothConnectionStateConnecting value)? connecting,
    TResult? Function(BluetoothConnectionStateConnected value)? connected,
    TResult? Function(BluetoothConnectionStateDataReceived value)? dataReceived,
    TResult? Function(BluetoothConnectionStateDisconnecting value)?
        disconnecting,
    TResult? Function(BluetoothConnectionStateDisconnected value)? disconnected,
    TResult? Function(BluetoothConnectionStateError value)? error,
  }) {
    return dataReceived?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(BluetoothConnectionStateInitial value)? initial,
    TResult Function(BluetoothConnectionStateObserving value)? observing,
    TResult Function(BluetoothConnectionStateConnecting value)? connecting,
    TResult Function(BluetoothConnectionStateConnected value)? connected,
    TResult Function(BluetoothConnectionStateDataReceived value)? dataReceived,
    TResult Function(BluetoothConnectionStateDisconnecting value)?
        disconnecting,
    TResult Function(BluetoothConnectionStateDisconnected value)? disconnected,
    TResult Function(BluetoothConnectionStateError value)? error,
    required TResult orElse(),
  }) {
    if (dataReceived != null) {
      return dataReceived(this);
    }
    return orElse();
  }
}

abstract class BluetoothConnectionStateDataReceived
    implements BluetoothConnectionState {
  const factory BluetoothConnectionStateDataReceived(
          {required final List<int> imuData,
          required final List<int> objectTempData,
          required final List<int> sensorTempData}) =
      _$BluetoothConnectionStateDataReceivedImpl;

  List<int> get imuData;
  List<int> get objectTempData;
  List<int> get sensorTempData;
  @JsonKey(ignore: true)
  _$$BluetoothConnectionStateDataReceivedImplCopyWith<
          _$BluetoothConnectionStateDataReceivedImpl>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$BluetoothConnectionStateDisconnectingImplCopyWith<$Res> {
  factory _$$BluetoothConnectionStateDisconnectingImplCopyWith(
          _$BluetoothConnectionStateDisconnectingImpl value,
          $Res Function(_$BluetoothConnectionStateDisconnectingImpl) then) =
      __$$BluetoothConnectionStateDisconnectingImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$BluetoothConnectionStateDisconnectingImplCopyWithImpl<$Res>
    extends _$BluetoothConnectionStateCopyWithImpl<$Res,
        _$BluetoothConnectionStateDisconnectingImpl>
    implements _$$BluetoothConnectionStateDisconnectingImplCopyWith<$Res> {
  __$$BluetoothConnectionStateDisconnectingImplCopyWithImpl(
      _$BluetoothConnectionStateDisconnectingImpl _value,
      $Res Function(_$BluetoothConnectionStateDisconnectingImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$BluetoothConnectionStateDisconnectingImpl
    with DiagnosticableTreeMixin
    implements BluetoothConnectionStateDisconnecting {
  const _$BluetoothConnectionStateDisconnectingImpl();

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'BluetoothConnectionState.disconnecting()';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties.add(
        DiagnosticsProperty('type', 'BluetoothConnectionState.disconnecting'));
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$BluetoothConnectionStateDisconnectingImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function(List<DiscoveredDevice> devices) observing,
    required TResult Function() connecting,
    required TResult Function() connected,
    required TResult Function(List<int> imuData, List<int> objectTempData,
            List<int> sensorTempData)
        dataReceived,
    required TResult Function() disconnecting,
    required TResult Function() disconnected,
    required TResult Function(String message) error,
  }) {
    return disconnecting();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function(List<DiscoveredDevice> devices)? observing,
    TResult? Function()? connecting,
    TResult? Function()? connected,
    TResult? Function(List<int> imuData, List<int> objectTempData,
            List<int> sensorTempData)?
        dataReceived,
    TResult? Function()? disconnecting,
    TResult? Function()? disconnected,
    TResult? Function(String message)? error,
  }) {
    return disconnecting?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function(List<DiscoveredDevice> devices)? observing,
    TResult Function()? connecting,
    TResult Function()? connected,
    TResult Function(List<int> imuData, List<int> objectTempData,
            List<int> sensorTempData)?
        dataReceived,
    TResult Function()? disconnecting,
    TResult Function()? disconnected,
    TResult Function(String message)? error,
    required TResult orElse(),
  }) {
    if (disconnecting != null) {
      return disconnecting();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(BluetoothConnectionStateInitial value) initial,
    required TResult Function(BluetoothConnectionStateObserving value)
        observing,
    required TResult Function(BluetoothConnectionStateConnecting value)
        connecting,
    required TResult Function(BluetoothConnectionStateConnected value)
        connected,
    required TResult Function(BluetoothConnectionStateDataReceived value)
        dataReceived,
    required TResult Function(BluetoothConnectionStateDisconnecting value)
        disconnecting,
    required TResult Function(BluetoothConnectionStateDisconnected value)
        disconnected,
    required TResult Function(BluetoothConnectionStateError value) error,
  }) {
    return disconnecting(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(BluetoothConnectionStateInitial value)? initial,
    TResult? Function(BluetoothConnectionStateObserving value)? observing,
    TResult? Function(BluetoothConnectionStateConnecting value)? connecting,
    TResult? Function(BluetoothConnectionStateConnected value)? connected,
    TResult? Function(BluetoothConnectionStateDataReceived value)? dataReceived,
    TResult? Function(BluetoothConnectionStateDisconnecting value)?
        disconnecting,
    TResult? Function(BluetoothConnectionStateDisconnected value)? disconnected,
    TResult? Function(BluetoothConnectionStateError value)? error,
  }) {
    return disconnecting?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(BluetoothConnectionStateInitial value)? initial,
    TResult Function(BluetoothConnectionStateObserving value)? observing,
    TResult Function(BluetoothConnectionStateConnecting value)? connecting,
    TResult Function(BluetoothConnectionStateConnected value)? connected,
    TResult Function(BluetoothConnectionStateDataReceived value)? dataReceived,
    TResult Function(BluetoothConnectionStateDisconnecting value)?
        disconnecting,
    TResult Function(BluetoothConnectionStateDisconnected value)? disconnected,
    TResult Function(BluetoothConnectionStateError value)? error,
    required TResult orElse(),
  }) {
    if (disconnecting != null) {
      return disconnecting(this);
    }
    return orElse();
  }
}

abstract class BluetoothConnectionStateDisconnecting
    implements BluetoothConnectionState {
  const factory BluetoothConnectionStateDisconnecting() =
      _$BluetoothConnectionStateDisconnectingImpl;
}

/// @nodoc
abstract class _$$BluetoothConnectionStateDisconnectedImplCopyWith<$Res> {
  factory _$$BluetoothConnectionStateDisconnectedImplCopyWith(
          _$BluetoothConnectionStateDisconnectedImpl value,
          $Res Function(_$BluetoothConnectionStateDisconnectedImpl) then) =
      __$$BluetoothConnectionStateDisconnectedImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$BluetoothConnectionStateDisconnectedImplCopyWithImpl<$Res>
    extends _$BluetoothConnectionStateCopyWithImpl<$Res,
        _$BluetoothConnectionStateDisconnectedImpl>
    implements _$$BluetoothConnectionStateDisconnectedImplCopyWith<$Res> {
  __$$BluetoothConnectionStateDisconnectedImplCopyWithImpl(
      _$BluetoothConnectionStateDisconnectedImpl _value,
      $Res Function(_$BluetoothConnectionStateDisconnectedImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$BluetoothConnectionStateDisconnectedImpl
    with DiagnosticableTreeMixin
    implements BluetoothConnectionStateDisconnected {
  const _$BluetoothConnectionStateDisconnectedImpl();

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'BluetoothConnectionState.disconnected()';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties.add(
        DiagnosticsProperty('type', 'BluetoothConnectionState.disconnected'));
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$BluetoothConnectionStateDisconnectedImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function(List<DiscoveredDevice> devices) observing,
    required TResult Function() connecting,
    required TResult Function() connected,
    required TResult Function(List<int> imuData, List<int> objectTempData,
            List<int> sensorTempData)
        dataReceived,
    required TResult Function() disconnecting,
    required TResult Function() disconnected,
    required TResult Function(String message) error,
  }) {
    return disconnected();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function(List<DiscoveredDevice> devices)? observing,
    TResult? Function()? connecting,
    TResult? Function()? connected,
    TResult? Function(List<int> imuData, List<int> objectTempData,
            List<int> sensorTempData)?
        dataReceived,
    TResult? Function()? disconnecting,
    TResult? Function()? disconnected,
    TResult? Function(String message)? error,
  }) {
    return disconnected?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function(List<DiscoveredDevice> devices)? observing,
    TResult Function()? connecting,
    TResult Function()? connected,
    TResult Function(List<int> imuData, List<int> objectTempData,
            List<int> sensorTempData)?
        dataReceived,
    TResult Function()? disconnecting,
    TResult Function()? disconnected,
    TResult Function(String message)? error,
    required TResult orElse(),
  }) {
    if (disconnected != null) {
      return disconnected();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(BluetoothConnectionStateInitial value) initial,
    required TResult Function(BluetoothConnectionStateObserving value)
        observing,
    required TResult Function(BluetoothConnectionStateConnecting value)
        connecting,
    required TResult Function(BluetoothConnectionStateConnected value)
        connected,
    required TResult Function(BluetoothConnectionStateDataReceived value)
        dataReceived,
    required TResult Function(BluetoothConnectionStateDisconnecting value)
        disconnecting,
    required TResult Function(BluetoothConnectionStateDisconnected value)
        disconnected,
    required TResult Function(BluetoothConnectionStateError value) error,
  }) {
    return disconnected(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(BluetoothConnectionStateInitial value)? initial,
    TResult? Function(BluetoothConnectionStateObserving value)? observing,
    TResult? Function(BluetoothConnectionStateConnecting value)? connecting,
    TResult? Function(BluetoothConnectionStateConnected value)? connected,
    TResult? Function(BluetoothConnectionStateDataReceived value)? dataReceived,
    TResult? Function(BluetoothConnectionStateDisconnecting value)?
        disconnecting,
    TResult? Function(BluetoothConnectionStateDisconnected value)? disconnected,
    TResult? Function(BluetoothConnectionStateError value)? error,
  }) {
    return disconnected?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(BluetoothConnectionStateInitial value)? initial,
    TResult Function(BluetoothConnectionStateObserving value)? observing,
    TResult Function(BluetoothConnectionStateConnecting value)? connecting,
    TResult Function(BluetoothConnectionStateConnected value)? connected,
    TResult Function(BluetoothConnectionStateDataReceived value)? dataReceived,
    TResult Function(BluetoothConnectionStateDisconnecting value)?
        disconnecting,
    TResult Function(BluetoothConnectionStateDisconnected value)? disconnected,
    TResult Function(BluetoothConnectionStateError value)? error,
    required TResult orElse(),
  }) {
    if (disconnected != null) {
      return disconnected(this);
    }
    return orElse();
  }
}

abstract class BluetoothConnectionStateDisconnected
    implements BluetoothConnectionState {
  const factory BluetoothConnectionStateDisconnected() =
      _$BluetoothConnectionStateDisconnectedImpl;
}

/// @nodoc
abstract class _$$BluetoothConnectionStateErrorImplCopyWith<$Res> {
  factory _$$BluetoothConnectionStateErrorImplCopyWith(
          _$BluetoothConnectionStateErrorImpl value,
          $Res Function(_$BluetoothConnectionStateErrorImpl) then) =
      __$$BluetoothConnectionStateErrorImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String message});
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
    Object? message = null,
  }) {
    return _then(_$BluetoothConnectionStateErrorImpl(
      null == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$BluetoothConnectionStateErrorImpl
    with DiagnosticableTreeMixin
    implements BluetoothConnectionStateError {
  const _$BluetoothConnectionStateErrorImpl(this.message);

  @override
  final String message;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'BluetoothConnectionState.error(message: $message)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'BluetoothConnectionState.error'))
      ..add(DiagnosticsProperty('message', message));
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$BluetoothConnectionStateErrorImpl &&
            (identical(other.message, message) || other.message == message));
  }

  @override
  int get hashCode => Object.hash(runtimeType, message);

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
    required TResult Function(List<DiscoveredDevice> devices) observing,
    required TResult Function() connecting,
    required TResult Function() connected,
    required TResult Function(List<int> imuData, List<int> objectTempData,
            List<int> sensorTempData)
        dataReceived,
    required TResult Function() disconnecting,
    required TResult Function() disconnected,
    required TResult Function(String message) error,
  }) {
    return error(message);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function(List<DiscoveredDevice> devices)? observing,
    TResult? Function()? connecting,
    TResult? Function()? connected,
    TResult? Function(List<int> imuData, List<int> objectTempData,
            List<int> sensorTempData)?
        dataReceived,
    TResult? Function()? disconnecting,
    TResult? Function()? disconnected,
    TResult? Function(String message)? error,
  }) {
    return error?.call(message);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function(List<DiscoveredDevice> devices)? observing,
    TResult Function()? connecting,
    TResult Function()? connected,
    TResult Function(List<int> imuData, List<int> objectTempData,
            List<int> sensorTempData)?
        dataReceived,
    TResult Function()? disconnecting,
    TResult Function()? disconnected,
    TResult Function(String message)? error,
    required TResult orElse(),
  }) {
    if (error != null) {
      return error(message);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(BluetoothConnectionStateInitial value) initial,
    required TResult Function(BluetoothConnectionStateObserving value)
        observing,
    required TResult Function(BluetoothConnectionStateConnecting value)
        connecting,
    required TResult Function(BluetoothConnectionStateConnected value)
        connected,
    required TResult Function(BluetoothConnectionStateDataReceived value)
        dataReceived,
    required TResult Function(BluetoothConnectionStateDisconnecting value)
        disconnecting,
    required TResult Function(BluetoothConnectionStateDisconnected value)
        disconnected,
    required TResult Function(BluetoothConnectionStateError value) error,
  }) {
    return error(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(BluetoothConnectionStateInitial value)? initial,
    TResult? Function(BluetoothConnectionStateObserving value)? observing,
    TResult? Function(BluetoothConnectionStateConnecting value)? connecting,
    TResult? Function(BluetoothConnectionStateConnected value)? connected,
    TResult? Function(BluetoothConnectionStateDataReceived value)? dataReceived,
    TResult? Function(BluetoothConnectionStateDisconnecting value)?
        disconnecting,
    TResult? Function(BluetoothConnectionStateDisconnected value)? disconnected,
    TResult? Function(BluetoothConnectionStateError value)? error,
  }) {
    return error?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(BluetoothConnectionStateInitial value)? initial,
    TResult Function(BluetoothConnectionStateObserving value)? observing,
    TResult Function(BluetoothConnectionStateConnecting value)? connecting,
    TResult Function(BluetoothConnectionStateConnected value)? connected,
    TResult Function(BluetoothConnectionStateDataReceived value)? dataReceived,
    TResult Function(BluetoothConnectionStateDisconnecting value)?
        disconnecting,
    TResult Function(BluetoothConnectionStateDisconnected value)? disconnected,
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
  const factory BluetoothConnectionStateError(final String message) =
      _$BluetoothConnectionStateErrorImpl;

  String get message;
  @JsonKey(ignore: true)
  _$$BluetoothConnectionStateErrorImplCopyWith<
          _$BluetoothConnectionStateErrorImpl>
      get copyWith => throw _privateConstructorUsedError;
}
