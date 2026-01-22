// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'tap_to_bpm_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$TapToBpmState {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is TapToBpmState);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'TapToBpmState()';
}


}

/// @nodoc
class $TapToBpmStateCopyWith<$Res>  {
$TapToBpmStateCopyWith(TapToBpmState _, $Res Function(TapToBpmState) __);
}


/// Adds pattern-matching-related methods to [TapToBpmState].
extension TapToBpmStatePatterns on TapToBpmState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( _Initial value)?  initial,TResult Function( _DidFirstTap value)?  didFirstTap,TResult Function( _WaitingNextTap value)?  waitingNextTap,TResult Function( _Feedbacking value)?  startingTapFeedback,TResult Function( _FinishedFeedback value)?  finishedTapFeedback,TResult Function( _Success value)?  success,TResult Function( _StartedCountdown value)?  startedCountdown,TResult Function( _FinishedCountdown value)?  finishedCountdown,TResult Function( _ResetedCountdown value)?  resetedCountdown,TResult Function( _ChangedAverageBPM value)?  changedAverageBPM,required TResult orElse(),}){
final _that = this;
switch (_that) {
case _Initial() when initial != null:
return initial(_that);case _DidFirstTap() when didFirstTap != null:
return didFirstTap(_that);case _WaitingNextTap() when waitingNextTap != null:
return waitingNextTap(_that);case _Feedbacking() when startingTapFeedback != null:
return startingTapFeedback(_that);case _FinishedFeedback() when finishedTapFeedback != null:
return finishedTapFeedback(_that);case _Success() when success != null:
return success(_that);case _StartedCountdown() when startedCountdown != null:
return startedCountdown(_that);case _FinishedCountdown() when finishedCountdown != null:
return finishedCountdown(_that);case _ResetedCountdown() when resetedCountdown != null:
return resetedCountdown(_that);case _ChangedAverageBPM() when changedAverageBPM != null:
return changedAverageBPM(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( _Initial value)  initial,required TResult Function( _DidFirstTap value)  didFirstTap,required TResult Function( _WaitingNextTap value)  waitingNextTap,required TResult Function( _Feedbacking value)  startingTapFeedback,required TResult Function( _FinishedFeedback value)  finishedTapFeedback,required TResult Function( _Success value)  success,required TResult Function( _StartedCountdown value)  startedCountdown,required TResult Function( _FinishedCountdown value)  finishedCountdown,required TResult Function( _ResetedCountdown value)  resetedCountdown,required TResult Function( _ChangedAverageBPM value)  changedAverageBPM,}){
final _that = this;
switch (_that) {
case _Initial():
return initial(_that);case _DidFirstTap():
return didFirstTap(_that);case _WaitingNextTap():
return waitingNextTap(_that);case _Feedbacking():
return startingTapFeedback(_that);case _FinishedFeedback():
return finishedTapFeedback(_that);case _Success():
return success(_that);case _StartedCountdown():
return startedCountdown(_that);case _FinishedCountdown():
return finishedCountdown(_that);case _ResetedCountdown():
return resetedCountdown(_that);case _ChangedAverageBPM():
return changedAverageBPM(_that);case _:
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( _Initial value)?  initial,TResult? Function( _DidFirstTap value)?  didFirstTap,TResult? Function( _WaitingNextTap value)?  waitingNextTap,TResult? Function( _Feedbacking value)?  startingTapFeedback,TResult? Function( _FinishedFeedback value)?  finishedTapFeedback,TResult? Function( _Success value)?  success,TResult? Function( _StartedCountdown value)?  startedCountdown,TResult? Function( _FinishedCountdown value)?  finishedCountdown,TResult? Function( _ResetedCountdown value)?  resetedCountdown,TResult? Function( _ChangedAverageBPM value)?  changedAverageBPM,}){
final _that = this;
switch (_that) {
case _Initial() when initial != null:
return initial(_that);case _DidFirstTap() when didFirstTap != null:
return didFirstTap(_that);case _WaitingNextTap() when waitingNextTap != null:
return waitingNextTap(_that);case _Feedbacking() when startingTapFeedback != null:
return startingTapFeedback(_that);case _FinishedFeedback() when finishedTapFeedback != null:
return finishedTapFeedback(_that);case _Success() when success != null:
return success(_that);case _StartedCountdown() when startedCountdown != null:
return startedCountdown(_that);case _FinishedCountdown() when finishedCountdown != null:
return finishedCountdown(_that);case _ResetedCountdown() when resetedCountdown != null:
return resetedCountdown(_that);case _ChangedAverageBPM() when changedAverageBPM != null:
return changedAverageBPM(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function()?  initial,TResult Function()?  didFirstTap,TResult Function( int? bpm)?  waitingNextTap,TResult Function()?  startingTapFeedback,TResult Function()?  finishedTapFeedback,TResult Function( int bpm)?  success,TResult Function( Duration duration)?  startedCountdown,TResult Function()?  finishedCountdown,TResult Function( Duration duration)?  resetedCountdown,TResult Function( int bpm)?  changedAverageBPM,required TResult orElse(),}) {final _that = this;
switch (_that) {
case _Initial() when initial != null:
return initial();case _DidFirstTap() when didFirstTap != null:
return didFirstTap();case _WaitingNextTap() when waitingNextTap != null:
return waitingNextTap(_that.bpm);case _Feedbacking() when startingTapFeedback != null:
return startingTapFeedback();case _FinishedFeedback() when finishedTapFeedback != null:
return finishedTapFeedback();case _Success() when success != null:
return success(_that.bpm);case _StartedCountdown() when startedCountdown != null:
return startedCountdown(_that.duration);case _FinishedCountdown() when finishedCountdown != null:
return finishedCountdown();case _ResetedCountdown() when resetedCountdown != null:
return resetedCountdown(_that.duration);case _ChangedAverageBPM() when changedAverageBPM != null:
return changedAverageBPM(_that.bpm);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function()  initial,required TResult Function()  didFirstTap,required TResult Function( int? bpm)  waitingNextTap,required TResult Function()  startingTapFeedback,required TResult Function()  finishedTapFeedback,required TResult Function( int bpm)  success,required TResult Function( Duration duration)  startedCountdown,required TResult Function()  finishedCountdown,required TResult Function( Duration duration)  resetedCountdown,required TResult Function( int bpm)  changedAverageBPM,}) {final _that = this;
switch (_that) {
case _Initial():
return initial();case _DidFirstTap():
return didFirstTap();case _WaitingNextTap():
return waitingNextTap(_that.bpm);case _Feedbacking():
return startingTapFeedback();case _FinishedFeedback():
return finishedTapFeedback();case _Success():
return success(_that.bpm);case _StartedCountdown():
return startedCountdown(_that.duration);case _FinishedCountdown():
return finishedCountdown();case _ResetedCountdown():
return resetedCountdown(_that.duration);case _ChangedAverageBPM():
return changedAverageBPM(_that.bpm);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function()?  initial,TResult? Function()?  didFirstTap,TResult? Function( int? bpm)?  waitingNextTap,TResult? Function()?  startingTapFeedback,TResult? Function()?  finishedTapFeedback,TResult? Function( int bpm)?  success,TResult? Function( Duration duration)?  startedCountdown,TResult? Function()?  finishedCountdown,TResult? Function( Duration duration)?  resetedCountdown,TResult? Function( int bpm)?  changedAverageBPM,}) {final _that = this;
switch (_that) {
case _Initial() when initial != null:
return initial();case _DidFirstTap() when didFirstTap != null:
return didFirstTap();case _WaitingNextTap() when waitingNextTap != null:
return waitingNextTap(_that.bpm);case _Feedbacking() when startingTapFeedback != null:
return startingTapFeedback();case _FinishedFeedback() when finishedTapFeedback != null:
return finishedTapFeedback();case _Success() when success != null:
return success(_that.bpm);case _StartedCountdown() when startedCountdown != null:
return startedCountdown(_that.duration);case _FinishedCountdown() when finishedCountdown != null:
return finishedCountdown();case _ResetedCountdown() when resetedCountdown != null:
return resetedCountdown(_that.duration);case _ChangedAverageBPM() when changedAverageBPM != null:
return changedAverageBPM(_that.bpm);case _:
  return null;

}
}

}

/// @nodoc


class _Initial implements TapToBpmState {
  const _Initial();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Initial);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'TapToBpmState.initial()';
}


}




/// @nodoc


class _DidFirstTap implements TapToBpmState {
  const _DidFirstTap();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _DidFirstTap);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'TapToBpmState.didFirstTap()';
}


}




/// @nodoc


class _WaitingNextTap implements TapToBpmState {
  const _WaitingNextTap({this.bpm = null});
  

@JsonKey() final  int? bpm;

/// Create a copy of TapToBpmState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$WaitingNextTapCopyWith<_WaitingNextTap> get copyWith => __$WaitingNextTapCopyWithImpl<_WaitingNextTap>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _WaitingNextTap&&(identical(other.bpm, bpm) || other.bpm == bpm));
}


@override
int get hashCode => Object.hash(runtimeType,bpm);

@override
String toString() {
  return 'TapToBpmState.waitingNextTap(bpm: $bpm)';
}


}

/// @nodoc
abstract mixin class _$WaitingNextTapCopyWith<$Res> implements $TapToBpmStateCopyWith<$Res> {
  factory _$WaitingNextTapCopyWith(_WaitingNextTap value, $Res Function(_WaitingNextTap) _then) = __$WaitingNextTapCopyWithImpl;
@useResult
$Res call({
 int? bpm
});




}
/// @nodoc
class __$WaitingNextTapCopyWithImpl<$Res>
    implements _$WaitingNextTapCopyWith<$Res> {
  __$WaitingNextTapCopyWithImpl(this._self, this._then);

  final _WaitingNextTap _self;
  final $Res Function(_WaitingNextTap) _then;

/// Create a copy of TapToBpmState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? bpm = freezed,}) {
  return _then(_WaitingNextTap(
bpm: freezed == bpm ? _self.bpm : bpm // ignore: cast_nullable_to_non_nullable
as int?,
  ));
}


}

/// @nodoc


class _Feedbacking implements TapToBpmState {
  const _Feedbacking();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Feedbacking);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'TapToBpmState.startingTapFeedback()';
}


}




/// @nodoc


class _FinishedFeedback implements TapToBpmState {
  const _FinishedFeedback();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _FinishedFeedback);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'TapToBpmState.finishedTapFeedback()';
}


}




/// @nodoc


class _Success implements TapToBpmState {
  const _Success({required this.bpm});
  

 final  int bpm;

/// Create a copy of TapToBpmState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$SuccessCopyWith<_Success> get copyWith => __$SuccessCopyWithImpl<_Success>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Success&&(identical(other.bpm, bpm) || other.bpm == bpm));
}


@override
int get hashCode => Object.hash(runtimeType,bpm);

@override
String toString() {
  return 'TapToBpmState.success(bpm: $bpm)';
}


}

/// @nodoc
abstract mixin class _$SuccessCopyWith<$Res> implements $TapToBpmStateCopyWith<$Res> {
  factory _$SuccessCopyWith(_Success value, $Res Function(_Success) _then) = __$SuccessCopyWithImpl;
@useResult
$Res call({
 int bpm
});




}
/// @nodoc
class __$SuccessCopyWithImpl<$Res>
    implements _$SuccessCopyWith<$Res> {
  __$SuccessCopyWithImpl(this._self, this._then);

  final _Success _self;
  final $Res Function(_Success) _then;

/// Create a copy of TapToBpmState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? bpm = null,}) {
  return _then(_Success(
bpm: null == bpm ? _self.bpm : bpm // ignore: cast_nullable_to_non_nullable
as int,
  ));
}


}

/// @nodoc


class _StartedCountdown implements TapToBpmState {
  const _StartedCountdown({required this.duration});
  

 final  Duration duration;

/// Create a copy of TapToBpmState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$StartedCountdownCopyWith<_StartedCountdown> get copyWith => __$StartedCountdownCopyWithImpl<_StartedCountdown>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _StartedCountdown&&(identical(other.duration, duration) || other.duration == duration));
}


@override
int get hashCode => Object.hash(runtimeType,duration);

@override
String toString() {
  return 'TapToBpmState.startedCountdown(duration: $duration)';
}


}

/// @nodoc
abstract mixin class _$StartedCountdownCopyWith<$Res> implements $TapToBpmStateCopyWith<$Res> {
  factory _$StartedCountdownCopyWith(_StartedCountdown value, $Res Function(_StartedCountdown) _then) = __$StartedCountdownCopyWithImpl;
@useResult
$Res call({
 Duration duration
});




}
/// @nodoc
class __$StartedCountdownCopyWithImpl<$Res>
    implements _$StartedCountdownCopyWith<$Res> {
  __$StartedCountdownCopyWithImpl(this._self, this._then);

  final _StartedCountdown _self;
  final $Res Function(_StartedCountdown) _then;

/// Create a copy of TapToBpmState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? duration = null,}) {
  return _then(_StartedCountdown(
duration: null == duration ? _self.duration : duration // ignore: cast_nullable_to_non_nullable
as Duration,
  ));
}


}

/// @nodoc


class _FinishedCountdown implements TapToBpmState {
  const _FinishedCountdown();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _FinishedCountdown);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'TapToBpmState.finishedCountdown()';
}


}




/// @nodoc


class _ResetedCountdown implements TapToBpmState {
  const _ResetedCountdown({required this.duration});
  

 final  Duration duration;

/// Create a copy of TapToBpmState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ResetedCountdownCopyWith<_ResetedCountdown> get copyWith => __$ResetedCountdownCopyWithImpl<_ResetedCountdown>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ResetedCountdown&&(identical(other.duration, duration) || other.duration == duration));
}


@override
int get hashCode => Object.hash(runtimeType,duration);

@override
String toString() {
  return 'TapToBpmState.resetedCountdown(duration: $duration)';
}


}

/// @nodoc
abstract mixin class _$ResetedCountdownCopyWith<$Res> implements $TapToBpmStateCopyWith<$Res> {
  factory _$ResetedCountdownCopyWith(_ResetedCountdown value, $Res Function(_ResetedCountdown) _then) = __$ResetedCountdownCopyWithImpl;
@useResult
$Res call({
 Duration duration
});




}
/// @nodoc
class __$ResetedCountdownCopyWithImpl<$Res>
    implements _$ResetedCountdownCopyWith<$Res> {
  __$ResetedCountdownCopyWithImpl(this._self, this._then);

  final _ResetedCountdown _self;
  final $Res Function(_ResetedCountdown) _then;

/// Create a copy of TapToBpmState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? duration = null,}) {
  return _then(_ResetedCountdown(
duration: null == duration ? _self.duration : duration // ignore: cast_nullable_to_non_nullable
as Duration,
  ));
}


}

/// @nodoc


class _ChangedAverageBPM implements TapToBpmState {
  const _ChangedAverageBPM({required this.bpm});
  

 final  int bpm;

/// Create a copy of TapToBpmState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ChangedAverageBPMCopyWith<_ChangedAverageBPM> get copyWith => __$ChangedAverageBPMCopyWithImpl<_ChangedAverageBPM>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ChangedAverageBPM&&(identical(other.bpm, bpm) || other.bpm == bpm));
}


@override
int get hashCode => Object.hash(runtimeType,bpm);

@override
String toString() {
  return 'TapToBpmState.changedAverageBPM(bpm: $bpm)';
}


}

/// @nodoc
abstract mixin class _$ChangedAverageBPMCopyWith<$Res> implements $TapToBpmStateCopyWith<$Res> {
  factory _$ChangedAverageBPMCopyWith(_ChangedAverageBPM value, $Res Function(_ChangedAverageBPM) _then) = __$ChangedAverageBPMCopyWithImpl;
@useResult
$Res call({
 int bpm
});




}
/// @nodoc
class __$ChangedAverageBPMCopyWithImpl<$Res>
    implements _$ChangedAverageBPMCopyWith<$Res> {
  __$ChangedAverageBPMCopyWithImpl(this._self, this._then);

  final _ChangedAverageBPM _self;
  final $Res Function(_ChangedAverageBPM) _then;

/// Create a copy of TapToBpmState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? bpm = null,}) {
  return _then(_ChangedAverageBPM(
bpm: null == bpm ? _self.bpm : bpm // ignore: cast_nullable_to_non_nullable
as int,
  ));
}


}

/// @nodoc
mixin _$TapToBpmEvent {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is TapToBpmEvent);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'TapToBpmEvent()';
}


}

/// @nodoc
class $TapToBpmEventCopyWith<$Res>  {
$TapToBpmEventCopyWith(TapToBpmEvent _, $Res Function(TapToBpmEvent) __);
}


/// Adds pattern-matching-related methods to [TapToBpmEvent].
extension TapToBpmEventPatterns on TapToBpmEvent {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( _FirstTap value)?  firstTap,TResult Function( _NextTap value)?  nextTap,required TResult orElse(),}){
final _that = this;
switch (_that) {
case _FirstTap() when firstTap != null:
return firstTap(_that);case _NextTap() when nextTap != null:
return nextTap(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( _FirstTap value)  firstTap,required TResult Function( _NextTap value)  nextTap,}){
final _that = this;
switch (_that) {
case _FirstTap():
return firstTap(_that);case _NextTap():
return nextTap(_that);case _:
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( _FirstTap value)?  firstTap,TResult? Function( _NextTap value)?  nextTap,}){
final _that = this;
switch (_that) {
case _FirstTap() when firstTap != null:
return firstTap(_that);case _NextTap() when nextTap != null:
return nextTap(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function()?  firstTap,TResult Function()?  nextTap,required TResult orElse(),}) {final _that = this;
switch (_that) {
case _FirstTap() when firstTap != null:
return firstTap();case _NextTap() when nextTap != null:
return nextTap();case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function()  firstTap,required TResult Function()  nextTap,}) {final _that = this;
switch (_that) {
case _FirstTap():
return firstTap();case _NextTap():
return nextTap();case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function()?  firstTap,TResult? Function()?  nextTap,}) {final _that = this;
switch (_that) {
case _FirstTap() when firstTap != null:
return firstTap();case _NextTap() when nextTap != null:
return nextTap();case _:
  return null;

}
}

}

/// @nodoc


class _FirstTap implements TapToBpmEvent {
  const _FirstTap();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _FirstTap);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'TapToBpmEvent.firstTap()';
}


}




/// @nodoc


class _NextTap implements TapToBpmEvent {
  const _NextTap();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _NextTap);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'TapToBpmEvent.nextTap()';
}


}




// dart format on
