// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'workout_tracker_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$WorkoutTrackerState {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function(int exerciseCounter) counting,
    required TResult Function(String message) error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function(int exerciseCounter)? counting,
    TResult? Function(String message)? error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function(int exerciseCounter)? counting,
    TResult Function(String message)? error,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(WorkoutTrackerStateInitial value) initial,
    required TResult Function(WorkoutTrackerStateCounting value) counting,
    required TResult Function(WorkoutTrackerStateError value) error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(WorkoutTrackerStateInitial value)? initial,
    TResult? Function(WorkoutTrackerStateCounting value)? counting,
    TResult? Function(WorkoutTrackerStateError value)? error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(WorkoutTrackerStateInitial value)? initial,
    TResult Function(WorkoutTrackerStateCounting value)? counting,
    TResult Function(WorkoutTrackerStateError value)? error,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $WorkoutTrackerStateCopyWith<$Res> {
  factory $WorkoutTrackerStateCopyWith(
          WorkoutTrackerState value, $Res Function(WorkoutTrackerState) then) =
      _$WorkoutTrackerStateCopyWithImpl<$Res, WorkoutTrackerState>;
}

/// @nodoc
class _$WorkoutTrackerStateCopyWithImpl<$Res, $Val extends WorkoutTrackerState>
    implements $WorkoutTrackerStateCopyWith<$Res> {
  _$WorkoutTrackerStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$WorkoutTrackerStateInitialImplCopyWith<$Res> {
  factory _$$WorkoutTrackerStateInitialImplCopyWith(
          _$WorkoutTrackerStateInitialImpl value,
          $Res Function(_$WorkoutTrackerStateInitialImpl) then) =
      __$$WorkoutTrackerStateInitialImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$WorkoutTrackerStateInitialImplCopyWithImpl<$Res>
    extends _$WorkoutTrackerStateCopyWithImpl<$Res,
        _$WorkoutTrackerStateInitialImpl>
    implements _$$WorkoutTrackerStateInitialImplCopyWith<$Res> {
  __$$WorkoutTrackerStateInitialImplCopyWithImpl(
      _$WorkoutTrackerStateInitialImpl _value,
      $Res Function(_$WorkoutTrackerStateInitialImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$WorkoutTrackerStateInitialImpl implements WorkoutTrackerStateInitial {
  const _$WorkoutTrackerStateInitialImpl();

  @override
  String toString() {
    return 'WorkoutTrackerState.initial()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$WorkoutTrackerStateInitialImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function(int exerciseCounter) counting,
    required TResult Function(String message) error,
  }) {
    return initial();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function(int exerciseCounter)? counting,
    TResult? Function(String message)? error,
  }) {
    return initial?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function(int exerciseCounter)? counting,
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
    required TResult Function(WorkoutTrackerStateInitial value) initial,
    required TResult Function(WorkoutTrackerStateCounting value) counting,
    required TResult Function(WorkoutTrackerStateError value) error,
  }) {
    return initial(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(WorkoutTrackerStateInitial value)? initial,
    TResult? Function(WorkoutTrackerStateCounting value)? counting,
    TResult? Function(WorkoutTrackerStateError value)? error,
  }) {
    return initial?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(WorkoutTrackerStateInitial value)? initial,
    TResult Function(WorkoutTrackerStateCounting value)? counting,
    TResult Function(WorkoutTrackerStateError value)? error,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial(this);
    }
    return orElse();
  }
}

abstract class WorkoutTrackerStateInitial implements WorkoutTrackerState {
  const factory WorkoutTrackerStateInitial() = _$WorkoutTrackerStateInitialImpl;
}

/// @nodoc
abstract class _$$WorkoutTrackerStateCountingImplCopyWith<$Res> {
  factory _$$WorkoutTrackerStateCountingImplCopyWith(
          _$WorkoutTrackerStateCountingImpl value,
          $Res Function(_$WorkoutTrackerStateCountingImpl) then) =
      __$$WorkoutTrackerStateCountingImplCopyWithImpl<$Res>;
  @useResult
  $Res call({int exerciseCounter});
}

/// @nodoc
class __$$WorkoutTrackerStateCountingImplCopyWithImpl<$Res>
    extends _$WorkoutTrackerStateCopyWithImpl<$Res,
        _$WorkoutTrackerStateCountingImpl>
    implements _$$WorkoutTrackerStateCountingImplCopyWith<$Res> {
  __$$WorkoutTrackerStateCountingImplCopyWithImpl(
      _$WorkoutTrackerStateCountingImpl _value,
      $Res Function(_$WorkoutTrackerStateCountingImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? exerciseCounter = null,
  }) {
    return _then(_$WorkoutTrackerStateCountingImpl(
      exerciseCounter: null == exerciseCounter
          ? _value.exerciseCounter
          : exerciseCounter // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc

class _$WorkoutTrackerStateCountingImpl implements WorkoutTrackerStateCounting {
  const _$WorkoutTrackerStateCountingImpl({required this.exerciseCounter});

  @override
  final int exerciseCounter;

  @override
  String toString() {
    return 'WorkoutTrackerState.counting(exerciseCounter: $exerciseCounter)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$WorkoutTrackerStateCountingImpl &&
            (identical(other.exerciseCounter, exerciseCounter) ||
                other.exerciseCounter == exerciseCounter));
  }

  @override
  int get hashCode => Object.hash(runtimeType, exerciseCounter);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$WorkoutTrackerStateCountingImplCopyWith<_$WorkoutTrackerStateCountingImpl>
      get copyWith => __$$WorkoutTrackerStateCountingImplCopyWithImpl<
          _$WorkoutTrackerStateCountingImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function(int exerciseCounter) counting,
    required TResult Function(String message) error,
  }) {
    return counting(exerciseCounter);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function(int exerciseCounter)? counting,
    TResult? Function(String message)? error,
  }) {
    return counting?.call(exerciseCounter);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function(int exerciseCounter)? counting,
    TResult Function(String message)? error,
    required TResult orElse(),
  }) {
    if (counting != null) {
      return counting(exerciseCounter);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(WorkoutTrackerStateInitial value) initial,
    required TResult Function(WorkoutTrackerStateCounting value) counting,
    required TResult Function(WorkoutTrackerStateError value) error,
  }) {
    return counting(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(WorkoutTrackerStateInitial value)? initial,
    TResult? Function(WorkoutTrackerStateCounting value)? counting,
    TResult? Function(WorkoutTrackerStateError value)? error,
  }) {
    return counting?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(WorkoutTrackerStateInitial value)? initial,
    TResult Function(WorkoutTrackerStateCounting value)? counting,
    TResult Function(WorkoutTrackerStateError value)? error,
    required TResult orElse(),
  }) {
    if (counting != null) {
      return counting(this);
    }
    return orElse();
  }
}

abstract class WorkoutTrackerStateCounting implements WorkoutTrackerState {
  const factory WorkoutTrackerStateCounting(
      {required final int exerciseCounter}) = _$WorkoutTrackerStateCountingImpl;

  int get exerciseCounter;
  @JsonKey(ignore: true)
  _$$WorkoutTrackerStateCountingImplCopyWith<_$WorkoutTrackerStateCountingImpl>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$WorkoutTrackerStateErrorImplCopyWith<$Res> {
  factory _$$WorkoutTrackerStateErrorImplCopyWith(
          _$WorkoutTrackerStateErrorImpl value,
          $Res Function(_$WorkoutTrackerStateErrorImpl) then) =
      __$$WorkoutTrackerStateErrorImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String message});
}

/// @nodoc
class __$$WorkoutTrackerStateErrorImplCopyWithImpl<$Res>
    extends _$WorkoutTrackerStateCopyWithImpl<$Res,
        _$WorkoutTrackerStateErrorImpl>
    implements _$$WorkoutTrackerStateErrorImplCopyWith<$Res> {
  __$$WorkoutTrackerStateErrorImplCopyWithImpl(
      _$WorkoutTrackerStateErrorImpl _value,
      $Res Function(_$WorkoutTrackerStateErrorImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? message = null,
  }) {
    return _then(_$WorkoutTrackerStateErrorImpl(
      null == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$WorkoutTrackerStateErrorImpl implements WorkoutTrackerStateError {
  const _$WorkoutTrackerStateErrorImpl(this.message);

  @override
  final String message;

  @override
  String toString() {
    return 'WorkoutTrackerState.error(message: $message)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$WorkoutTrackerStateErrorImpl &&
            (identical(other.message, message) || other.message == message));
  }

  @override
  int get hashCode => Object.hash(runtimeType, message);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$WorkoutTrackerStateErrorImplCopyWith<_$WorkoutTrackerStateErrorImpl>
      get copyWith => __$$WorkoutTrackerStateErrorImplCopyWithImpl<
          _$WorkoutTrackerStateErrorImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function(int exerciseCounter) counting,
    required TResult Function(String message) error,
  }) {
    return error(message);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function(int exerciseCounter)? counting,
    TResult? Function(String message)? error,
  }) {
    return error?.call(message);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function(int exerciseCounter)? counting,
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
    required TResult Function(WorkoutTrackerStateInitial value) initial,
    required TResult Function(WorkoutTrackerStateCounting value) counting,
    required TResult Function(WorkoutTrackerStateError value) error,
  }) {
    return error(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(WorkoutTrackerStateInitial value)? initial,
    TResult? Function(WorkoutTrackerStateCounting value)? counting,
    TResult? Function(WorkoutTrackerStateError value)? error,
  }) {
    return error?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(WorkoutTrackerStateInitial value)? initial,
    TResult Function(WorkoutTrackerStateCounting value)? counting,
    TResult Function(WorkoutTrackerStateError value)? error,
    required TResult orElse(),
  }) {
    if (error != null) {
      return error(this);
    }
    return orElse();
  }
}

abstract class WorkoutTrackerStateError implements WorkoutTrackerState {
  const factory WorkoutTrackerStateError(final String message) =
      _$WorkoutTrackerStateErrorImpl;

  String get message;
  @JsonKey(ignore: true)
  _$$WorkoutTrackerStateErrorImplCopyWith<_$WorkoutTrackerStateErrorImpl>
      get copyWith => throw _privateConstructorUsedError;
}
