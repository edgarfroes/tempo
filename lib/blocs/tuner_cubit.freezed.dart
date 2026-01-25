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





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is TunerState);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'TunerState()';
}


}

/// @nodoc
class $TunerStateCopyWith<$Res>  {
$TunerStateCopyWith(TunerState _, $Res Function(TunerState) __);
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( _Initializing value)?  initializing,TResult Function( _Initialized value)?  initialized,TResult Function( _Stopped value)?  stopped,TResult Function( _ErrorInitializing value)?  errorInitializing,TResult Function( _Tuning value)?  tuning,required TResult orElse(),}){
final _that = this;
switch (_that) {
case _Initializing() when initializing != null:
return initializing(_that);case _Initialized() when initialized != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( _Initializing value)  initializing,required TResult Function( _Initialized value)  initialized,required TResult Function( _Stopped value)  stopped,required TResult Function( _ErrorInitializing value)  errorInitializing,required TResult Function( _Tuning value)  tuning,}){
final _that = this;
switch (_that) {
case _Initializing():
return initializing(_that);case _Initialized():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( _Initializing value)?  initializing,TResult? Function( _Initialized value)?  initialized,TResult? Function( _Stopped value)?  stopped,TResult? Function( _ErrorInitializing value)?  errorInitializing,TResult? Function( _Tuning value)?  tuning,}){
final _that = this;
switch (_that) {
case _Initializing() when initializing != null:
return initializing(_that);case _Initialized() when initialized != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function()?  initializing,TResult Function()?  initialized,TResult Function()?  stopped,TResult Function( String message)?  errorInitializing,TResult Function( String key,  int octave,  double position,  bool isTuned)?  tuning,required TResult orElse(),}) {final _that = this;
switch (_that) {
case _Initializing() when initializing != null:
return initializing();case _Initialized() when initialized != null:
return initialized();case _Stopped() when stopped != null:
return stopped();case _ErrorInitializing() when errorInitializing != null:
return errorInitializing(_that.message);case _Tuning() when tuning != null:
return tuning(_that.key,_that.octave,_that.position,_that.isTuned);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function()  initializing,required TResult Function()  initialized,required TResult Function()  stopped,required TResult Function( String message)  errorInitializing,required TResult Function( String key,  int octave,  double position,  bool isTuned)  tuning,}) {final _that = this;
switch (_that) {
case _Initializing():
return initializing();case _Initialized():
return initialized();case _Stopped():
return stopped();case _ErrorInitializing():
return errorInitializing(_that.message);case _Tuning():
return tuning(_that.key,_that.octave,_that.position,_that.isTuned);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function()?  initializing,TResult? Function()?  initialized,TResult? Function()?  stopped,TResult? Function( String message)?  errorInitializing,TResult? Function( String key,  int octave,  double position,  bool isTuned)?  tuning,}) {final _that = this;
switch (_that) {
case _Initializing() when initializing != null:
return initializing();case _Initialized() when initialized != null:
return initialized();case _Stopped() when stopped != null:
return stopped();case _ErrorInitializing() when errorInitializing != null:
return errorInitializing(_that.message);case _Tuning() when tuning != null:
return tuning(_that.key,_that.octave,_that.position,_that.isTuned);case _:
  return null;

}
}

}

/// @nodoc


class _Initializing implements TunerState {
  const _Initializing();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Initializing);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'TunerState.initializing()';
}


}




/// @nodoc


class _Initialized implements TunerState {
  const _Initialized();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Initialized);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'TunerState.initialized()';
}


}




/// @nodoc


class _Stopped implements TunerState {
  const _Stopped();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Stopped);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'TunerState.stopped()';
}


}




/// @nodoc


class _ErrorInitializing implements TunerState {
  const _ErrorInitializing({required this.message});
  

 final  String message;

/// Create a copy of TunerState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ErrorInitializingCopyWith<_ErrorInitializing> get copyWith => __$ErrorInitializingCopyWithImpl<_ErrorInitializing>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ErrorInitializing&&(identical(other.message, message) || other.message == message));
}


@override
int get hashCode => Object.hash(runtimeType,message);

@override
String toString() {
  return 'TunerState.errorInitializing(message: $message)';
}


}

/// @nodoc
abstract mixin class _$ErrorInitializingCopyWith<$Res> implements $TunerStateCopyWith<$Res> {
  factory _$ErrorInitializingCopyWith(_ErrorInitializing value, $Res Function(_ErrorInitializing) _then) = __$ErrorInitializingCopyWithImpl;
@useResult
$Res call({
 String message
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
@pragma('vm:prefer-inline') $Res call({Object? message = null,}) {
  return _then(_ErrorInitializing(
message: null == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

/// @nodoc


class _Tuning implements TunerState {
  const _Tuning({required this.key, required this.octave, required this.position, required this.isTuned});
  

 final  String key;
 final  int octave;
 final  double position;
 final  bool isTuned;

/// Create a copy of TunerState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$TuningCopyWith<_Tuning> get copyWith => __$TuningCopyWithImpl<_Tuning>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Tuning&&(identical(other.key, key) || other.key == key)&&(identical(other.octave, octave) || other.octave == octave)&&(identical(other.position, position) || other.position == position)&&(identical(other.isTuned, isTuned) || other.isTuned == isTuned));
}


@override
int get hashCode => Object.hash(runtimeType,key,octave,position,isTuned);

@override
String toString() {
  return 'TunerState.tuning(key: $key, octave: $octave, position: $position, isTuned: $isTuned)';
}


}

/// @nodoc
abstract mixin class _$TuningCopyWith<$Res> implements $TunerStateCopyWith<$Res> {
  factory _$TuningCopyWith(_Tuning value, $Res Function(_Tuning) _then) = __$TuningCopyWithImpl;
@useResult
$Res call({
 String key, int octave, double position, bool isTuned
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
@pragma('vm:prefer-inline') $Res call({Object? key = null,Object? octave = null,Object? position = null,Object? isTuned = null,}) {
  return _then(_Tuning(
key: null == key ? _self.key : key // ignore: cast_nullable_to_non_nullable
as String,octave: null == octave ? _self.octave : octave // ignore: cast_nullable_to_non_nullable
as int,position: null == position ? _self.position : position // ignore: cast_nullable_to_non_nullable
as double,isTuned: null == isTuned ? _self.isTuned : isTuned // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}


}

// dart format on
