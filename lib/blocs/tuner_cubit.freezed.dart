// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'tuner_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$TunerState {

 double get tuningThresholdInDecibels;
/// Create a copy of TunerState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$TunerStateCopyWith<TunerState> get copyWith => _$TunerStateCopyWithImpl<TunerState>(this as TunerState, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is TunerState&&(identical(other.tuningThresholdInDecibels, tuningThresholdInDecibels) || other.tuningThresholdInDecibels == tuningThresholdInDecibels));
}


@override
int get hashCode => Object.hash(runtimeType,tuningThresholdInDecibels);

@override
String toString() {
  return 'TunerState(tuningThresholdInDecibels: $tuningThresholdInDecibels)';
}


}

/// @nodoc
abstract mixin class $TunerStateCopyWith<$Res>  {
  factory $TunerStateCopyWith(TunerState value, $Res Function(TunerState) _then) = _$TunerStateCopyWithImpl;
@useResult
$Res call({
 double tuningThresholdInDecibels
});




}
/// @nodoc
class _$TunerStateCopyWithImpl<$Res>
    implements $TunerStateCopyWith<$Res> {
  _$TunerStateCopyWithImpl(this._self, this._then);

  final TunerState _self;
  final $Res Function(TunerState) _then;

/// Create a copy of TunerState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? tuningThresholdInDecibels = null,}) {
  return _then(_self.copyWith(
tuningThresholdInDecibels: null == tuningThresholdInDecibels ? _self.tuningThresholdInDecibels : tuningThresholdInDecibels // ignore: cast_nullable_to_non_nullable
as double,
  ));
}

}


/// Adds pattern-matching-related methods to [TunerState].
extension TunerStatePatterns on TunerState {
/// A variant of `map` that fallback to returning `orElse`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( _Initializing value)?  initializing,TResult Function( _Unsupported value)?  unsupported,TResult Function( _Initialized value)?  initialized,TResult Function( _Stopped value)?  stopped,TResult Function( _ErrorInitializing value)?  errorInitializing,TResult Function( _Tuning value)?  tuning,required TResult orElse(),}){
final _that = this;
switch (_that) {
case _Initializing() when initializing != null:
return initializing(_that);case _Unsupported() when unsupported != null:
return unsupported(_that);case _Initialized() when initialized != null:
return initialized(_that);case _Stopped() when stopped != null:
return stopped(_that);case _ErrorInitializing() when errorInitializing != null:
return errorInitializing(_that);case _Tuning() when tuning != null:
return tuning(_that);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// Callbacks receives the raw object, upcasted.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case final Subclass2 value:
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( _Initializing value)  initializing,required TResult Function( _Unsupported value)  unsupported,required TResult Function( _Initialized value)  initialized,required TResult Function( _Stopped value)  stopped,required TResult Function( _ErrorInitializing value)  errorInitializing,required TResult Function( _Tuning value)  tuning,}){
final _that = this;
switch (_that) {
case _Initializing():
return initializing(_that);case _Unsupported():
return unsupported(_that);case _Initialized():
return initialized(_that);case _Stopped():
return stopped(_that);case _ErrorInitializing():
return errorInitializing(_that);case _Tuning():
return tuning(_that);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `map` that fallback to returning `null`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( _Initializing value)?  initializing,TResult? Function( _Unsupported value)?  unsupported,TResult? Function( _Initialized value)?  initialized,TResult? Function( _Stopped value)?  stopped,TResult? Function( _ErrorInitializing value)?  errorInitializing,TResult? Function( _Tuning value)?  tuning,}){
final _that = this;
switch (_that) {
case _Initializing() when initializing != null:
return initializing(_that);case _Unsupported() when unsupported != null:
return unsupported(_that);case _Initialized() when initialized != null:
return initialized(_that);case _Stopped() when stopped != null:
return stopped(_that);case _ErrorInitializing() when errorInitializing != null:
return errorInitializing(_that);case _Tuning() when tuning != null:
return tuning(_that);case _:
  return null;

}
}
/// A variant of `when` that fallback to an `orElse` callback.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function( double tuningThresholdInDecibels)?  initializing,TResult Function( double tuningThresholdInDecibels)?  unsupported,TResult Function( double tuningThresholdInDecibels)?  initialized,TResult Function( double? calibrationOffset,  double tuningThresholdInDecibels,  int? lastOctave,  String? lastKey,  double? lastPosition)?  stopped,TResult Function( double tuningThresholdInDecibels,  String message)?  errorInitializing,TResult Function( String key,  int octave,  double position,  bool isTuned,  double? calibrationOffset,  double tuningThresholdInDecibels)?  tuning,required TResult orElse(),}) {final _that = this;
switch (_that) {
case _Initializing() when initializing != null:
return initializing(_that.tuningThresholdInDecibels);case _Unsupported() when unsupported != null:
return unsupported(_that.tuningThresholdInDecibels);case _Initialized() when initialized != null:
return initialized(_that.tuningThresholdInDecibels);case _Stopped() when stopped != null:
return stopped(_that.calibrationOffset,_that.tuningThresholdInDecibels,_that.lastOctave,_that.lastKey,_that.lastPosition);case _ErrorInitializing() when errorInitializing != null:
return errorInitializing(_that.tuningThresholdInDecibels,_that.message);case _Tuning() when tuning != null:
return tuning(_that.key,_that.octave,_that.position,_that.isTuned,_that.calibrationOffset,_that.tuningThresholdInDecibels);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// As opposed to `map`, this offers destructuring.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case Subclass2(:final field2):
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function( double tuningThresholdInDecibels)  initializing,required TResult Function( double tuningThresholdInDecibels)  unsupported,required TResult Function( double tuningThresholdInDecibels)  initialized,required TResult Function( double? calibrationOffset,  double tuningThresholdInDecibels,  int? lastOctave,  String? lastKey,  double? lastPosition)  stopped,required TResult Function( double tuningThresholdInDecibels,  String message)  errorInitializing,required TResult Function( String key,  int octave,  double position,  bool isTuned,  double? calibrationOffset,  double tuningThresholdInDecibels)  tuning,}) {final _that = this;
switch (_that) {
case _Initializing():
return initializing(_that.tuningThresholdInDecibels);case _Unsupported():
return unsupported(_that.tuningThresholdInDecibels);case _Initialized():
return initialized(_that.tuningThresholdInDecibels);case _Stopped():
return stopped(_that.calibrationOffset,_that.tuningThresholdInDecibels,_that.lastOctave,_that.lastKey,_that.lastPosition);case _ErrorInitializing():
return errorInitializing(_that.tuningThresholdInDecibels,_that.message);case _Tuning():
return tuning(_that.key,_that.octave,_that.position,_that.isTuned,_that.calibrationOffset,_that.tuningThresholdInDecibels);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `when` that fallback to returning `null`
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function( double tuningThresholdInDecibels)?  initializing,TResult? Function( double tuningThresholdInDecibels)?  unsupported,TResult? Function( double tuningThresholdInDecibels)?  initialized,TResult? Function( double? calibrationOffset,  double tuningThresholdInDecibels,  int? lastOctave,  String? lastKey,  double? lastPosition)?  stopped,TResult? Function( double tuningThresholdInDecibels,  String message)?  errorInitializing,TResult? Function( String key,  int octave,  double position,  bool isTuned,  double? calibrationOffset,  double tuningThresholdInDecibels)?  tuning,}) {final _that = this;
switch (_that) {
case _Initializing() when initializing != null:
return initializing(_that.tuningThresholdInDecibels);case _Unsupported() when unsupported != null:
return unsupported(_that.tuningThresholdInDecibels);case _Initialized() when initialized != null:
return initialized(_that.tuningThresholdInDecibels);case _Stopped() when stopped != null:
return stopped(_that.calibrationOffset,_that.tuningThresholdInDecibels,_that.lastOctave,_that.lastKey,_that.lastPosition);case _ErrorInitializing() when errorInitializing != null:
return errorInitializing(_that.tuningThresholdInDecibels,_that.message);case _Tuning() when tuning != null:
return tuning(_that.key,_that.octave,_that.position,_that.isTuned,_that.calibrationOffset,_that.tuningThresholdInDecibels);case _:
  return null;

}
}

}

/// @nodoc


class _Initializing implements TunerState {
  const _Initializing({required this.tuningThresholdInDecibels});
  

@override final  double tuningThresholdInDecibels;

/// Create a copy of TunerState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$InitializingCopyWith<_Initializing> get copyWith => __$InitializingCopyWithImpl<_Initializing>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Initializing&&(identical(other.tuningThresholdInDecibels, tuningThresholdInDecibels) || other.tuningThresholdInDecibels == tuningThresholdInDecibels));
}


@override
int get hashCode => Object.hash(runtimeType,tuningThresholdInDecibels);

@override
String toString() {
  return 'TunerState.initializing(tuningThresholdInDecibels: $tuningThresholdInDecibels)';
}


}

/// @nodoc
abstract mixin class _$InitializingCopyWith<$Res> implements $TunerStateCopyWith<$Res> {
  factory _$InitializingCopyWith(_Initializing value, $Res Function(_Initializing) _then) = __$InitializingCopyWithImpl;
@override @useResult
$Res call({
 double tuningThresholdInDecibels
});




}
/// @nodoc
class __$InitializingCopyWithImpl<$Res>
    implements _$InitializingCopyWith<$Res> {
  __$InitializingCopyWithImpl(this._self, this._then);

  final _Initializing _self;
  final $Res Function(_Initializing) _then;

/// Create a copy of TunerState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? tuningThresholdInDecibels = null,}) {
  return _then(_Initializing(
tuningThresholdInDecibels: null == tuningThresholdInDecibels ? _self.tuningThresholdInDecibels : tuningThresholdInDecibels // ignore: cast_nullable_to_non_nullable
as double,
  ));
}


}

/// @nodoc


class _Unsupported implements TunerState {
  const _Unsupported({required this.tuningThresholdInDecibels});
  

@override final  double tuningThresholdInDecibels;

/// Create a copy of TunerState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$UnsupportedCopyWith<_Unsupported> get copyWith => __$UnsupportedCopyWithImpl<_Unsupported>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Unsupported&&(identical(other.tuningThresholdInDecibels, tuningThresholdInDecibels) || other.tuningThresholdInDecibels == tuningThresholdInDecibels));
}


@override
int get hashCode => Object.hash(runtimeType,tuningThresholdInDecibels);

@override
String toString() {
  return 'TunerState.unsupported(tuningThresholdInDecibels: $tuningThresholdInDecibels)';
}


}

/// @nodoc
abstract mixin class _$UnsupportedCopyWith<$Res> implements $TunerStateCopyWith<$Res> {
  factory _$UnsupportedCopyWith(_Unsupported value, $Res Function(_Unsupported) _then) = __$UnsupportedCopyWithImpl;
@override @useResult
$Res call({
 double tuningThresholdInDecibels
});




}
/// @nodoc
class __$UnsupportedCopyWithImpl<$Res>
    implements _$UnsupportedCopyWith<$Res> {
  __$UnsupportedCopyWithImpl(this._self, this._then);

  final _Unsupported _self;
  final $Res Function(_Unsupported) _then;

/// Create a copy of TunerState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? tuningThresholdInDecibels = null,}) {
  return _then(_Unsupported(
tuningThresholdInDecibels: null == tuningThresholdInDecibels ? _self.tuningThresholdInDecibels : tuningThresholdInDecibels // ignore: cast_nullable_to_non_nullable
as double,
  ));
}


}

/// @nodoc


class _Initialized implements TunerState {
  const _Initialized({required this.tuningThresholdInDecibels});
  

@override final  double tuningThresholdInDecibels;

/// Create a copy of TunerState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$InitializedCopyWith<_Initialized> get copyWith => __$InitializedCopyWithImpl<_Initialized>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Initialized&&(identical(other.tuningThresholdInDecibels, tuningThresholdInDecibels) || other.tuningThresholdInDecibels == tuningThresholdInDecibels));
}


@override
int get hashCode => Object.hash(runtimeType,tuningThresholdInDecibels);

@override
String toString() {
  return 'TunerState.initialized(tuningThresholdInDecibels: $tuningThresholdInDecibels)';
}


}

/// @nodoc
abstract mixin class _$InitializedCopyWith<$Res> implements $TunerStateCopyWith<$Res> {
  factory _$InitializedCopyWith(_Initialized value, $Res Function(_Initialized) _then) = __$InitializedCopyWithImpl;
@override @useResult
$Res call({
 double tuningThresholdInDecibels
});




}
/// @nodoc
class __$InitializedCopyWithImpl<$Res>
    implements _$InitializedCopyWith<$Res> {
  __$InitializedCopyWithImpl(this._self, this._then);

  final _Initialized _self;
  final $Res Function(_Initialized) _then;

/// Create a copy of TunerState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? tuningThresholdInDecibels = null,}) {
  return _then(_Initialized(
tuningThresholdInDecibels: null == tuningThresholdInDecibels ? _self.tuningThresholdInDecibels : tuningThresholdInDecibels // ignore: cast_nullable_to_non_nullable
as double,
  ));
}


}

/// @nodoc


class _Stopped implements TunerState {
  const _Stopped({required this.calibrationOffset, required this.tuningThresholdInDecibels, this.lastOctave, this.lastKey, this.lastPosition});
  

 final  double? calibrationOffset;
@override final  double tuningThresholdInDecibels;
 final  int? lastOctave;
 final  String? lastKey;
 final  double? lastPosition;

/// Create a copy of TunerState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$StoppedCopyWith<_Stopped> get copyWith => __$StoppedCopyWithImpl<_Stopped>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Stopped&&(identical(other.calibrationOffset, calibrationOffset) || other.calibrationOffset == calibrationOffset)&&(identical(other.tuningThresholdInDecibels, tuningThresholdInDecibels) || other.tuningThresholdInDecibels == tuningThresholdInDecibels)&&(identical(other.lastOctave, lastOctave) || other.lastOctave == lastOctave)&&(identical(other.lastKey, lastKey) || other.lastKey == lastKey)&&(identical(other.lastPosition, lastPosition) || other.lastPosition == lastPosition));
}


@override
int get hashCode => Object.hash(runtimeType,calibrationOffset,tuningThresholdInDecibels,lastOctave,lastKey,lastPosition);

@override
String toString() {
  return 'TunerState.stopped(calibrationOffset: $calibrationOffset, tuningThresholdInDecibels: $tuningThresholdInDecibels, lastOctave: $lastOctave, lastKey: $lastKey, lastPosition: $lastPosition)';
}


}

/// @nodoc
abstract mixin class _$StoppedCopyWith<$Res> implements $TunerStateCopyWith<$Res> {
  factory _$StoppedCopyWith(_Stopped value, $Res Function(_Stopped) _then) = __$StoppedCopyWithImpl;
@override @useResult
$Res call({
 double? calibrationOffset, double tuningThresholdInDecibels, int? lastOctave, String? lastKey, double? lastPosition
});




}
/// @nodoc
class __$StoppedCopyWithImpl<$Res>
    implements _$StoppedCopyWith<$Res> {
  __$StoppedCopyWithImpl(this._self, this._then);

  final _Stopped _self;
  final $Res Function(_Stopped) _then;

/// Create a copy of TunerState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? calibrationOffset = freezed,Object? tuningThresholdInDecibels = null,Object? lastOctave = freezed,Object? lastKey = freezed,Object? lastPosition = freezed,}) {
  return _then(_Stopped(
calibrationOffset: freezed == calibrationOffset ? _self.calibrationOffset : calibrationOffset // ignore: cast_nullable_to_non_nullable
as double?,tuningThresholdInDecibels: null == tuningThresholdInDecibels ? _self.tuningThresholdInDecibels : tuningThresholdInDecibels // ignore: cast_nullable_to_non_nullable
as double,lastOctave: freezed == lastOctave ? _self.lastOctave : lastOctave // ignore: cast_nullable_to_non_nullable
as int?,lastKey: freezed == lastKey ? _self.lastKey : lastKey // ignore: cast_nullable_to_non_nullable
as String?,lastPosition: freezed == lastPosition ? _self.lastPosition : lastPosition // ignore: cast_nullable_to_non_nullable
as double?,
  ));
}


}

/// @nodoc


class _ErrorInitializing implements TunerState {
  const _ErrorInitializing({required this.tuningThresholdInDecibels, required this.message});
  

@override final  double tuningThresholdInDecibels;
 final  String message;

/// Create a copy of TunerState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ErrorInitializingCopyWith<_ErrorInitializing> get copyWith => __$ErrorInitializingCopyWithImpl<_ErrorInitializing>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ErrorInitializing&&(identical(other.tuningThresholdInDecibels, tuningThresholdInDecibels) || other.tuningThresholdInDecibels == tuningThresholdInDecibels)&&(identical(other.message, message) || other.message == message));
}


@override
int get hashCode => Object.hash(runtimeType,tuningThresholdInDecibels,message);

@override
String toString() {
  return 'TunerState.errorInitializing(tuningThresholdInDecibels: $tuningThresholdInDecibels, message: $message)';
}


}

/// @nodoc
abstract mixin class _$ErrorInitializingCopyWith<$Res> implements $TunerStateCopyWith<$Res> {
  factory _$ErrorInitializingCopyWith(_ErrorInitializing value, $Res Function(_ErrorInitializing) _then) = __$ErrorInitializingCopyWithImpl;
@override @useResult
$Res call({
 double tuningThresholdInDecibels, String message
});




}
/// @nodoc
class __$ErrorInitializingCopyWithImpl<$Res>
    implements _$ErrorInitializingCopyWith<$Res> {
  __$ErrorInitializingCopyWithImpl(this._self, this._then);

  final _ErrorInitializing _self;
  final $Res Function(_ErrorInitializing) _then;

/// Create a copy of TunerState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? tuningThresholdInDecibels = null,Object? message = null,}) {
  return _then(_ErrorInitializing(
tuningThresholdInDecibels: null == tuningThresholdInDecibels ? _self.tuningThresholdInDecibels : tuningThresholdInDecibels // ignore: cast_nullable_to_non_nullable
as double,message: null == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

/// @nodoc


class _Tuning implements TunerState {
  const _Tuning({required this.key, required this.octave, required this.position, required this.isTuned, required this.calibrationOffset, required this.tuningThresholdInDecibels});
  

 final  String key;
 final  int octave;
 final  double position;
 final  bool isTuned;
 final  double? calibrationOffset;
@override final  double tuningThresholdInDecibels;

/// Create a copy of TunerState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$TuningCopyWith<_Tuning> get copyWith => __$TuningCopyWithImpl<_Tuning>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Tuning&&(identical(other.key, key) || other.key == key)&&(identical(other.octave, octave) || other.octave == octave)&&(identical(other.position, position) || other.position == position)&&(identical(other.isTuned, isTuned) || other.isTuned == isTuned)&&(identical(other.calibrationOffset, calibrationOffset) || other.calibrationOffset == calibrationOffset)&&(identical(other.tuningThresholdInDecibels, tuningThresholdInDecibels) || other.tuningThresholdInDecibels == tuningThresholdInDecibels));
}


@override
int get hashCode => Object.hash(runtimeType,key,octave,position,isTuned,calibrationOffset,tuningThresholdInDecibels);

@override
String toString() {
  return 'TunerState.tuning(key: $key, octave: $octave, position: $position, isTuned: $isTuned, calibrationOffset: $calibrationOffset, tuningThresholdInDecibels: $tuningThresholdInDecibels)';
}


}

/// @nodoc
abstract mixin class _$TuningCopyWith<$Res> implements $TunerStateCopyWith<$Res> {
  factory _$TuningCopyWith(_Tuning value, $Res Function(_Tuning) _then) = __$TuningCopyWithImpl;
@override @useResult
$Res call({
 String key, int octave, double position, bool isTuned, double? calibrationOffset, double tuningThresholdInDecibels
});




}
/// @nodoc
class __$TuningCopyWithImpl<$Res>
    implements _$TuningCopyWith<$Res> {
  __$TuningCopyWithImpl(this._self, this._then);

  final _Tuning _self;
  final $Res Function(_Tuning) _then;

/// Create a copy of TunerState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? key = null,Object? octave = null,Object? position = null,Object? isTuned = null,Object? calibrationOffset = freezed,Object? tuningThresholdInDecibels = null,}) {
  return _then(_Tuning(
key: null == key ? _self.key : key // ignore: cast_nullable_to_non_nullable
as String,octave: null == octave ? _self.octave : octave // ignore: cast_nullable_to_non_nullable
as int,position: null == position ? _self.position : position // ignore: cast_nullable_to_non_nullable
as double,isTuned: null == isTuned ? _self.isTuned : isTuned // ignore: cast_nullable_to_non_nullable
as bool,calibrationOffset: freezed == calibrationOffset ? _self.calibrationOffset : calibrationOffset // ignore: cast_nullable_to_non_nullable
as double?,tuningThresholdInDecibels: null == tuningThresholdInDecibels ? _self.tuningThresholdInDecibels : tuningThresholdInDecibels // ignore: cast_nullable_to_non_nullable
as double,
  ));
}


}

// dart format on
