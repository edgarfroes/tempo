// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'tone_calibration_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$ToneCalibrationState {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ToneCalibrationState);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'ToneCalibrationState()';
}


}

/// @nodoc
class $ToneCalibrationStateCopyWith<$Res>  {
$ToneCalibrationStateCopyWith(ToneCalibrationState _, $Res Function(ToneCalibrationState) __);
}


/// Adds pattern-matching-related methods to [ToneCalibrationState].
extension ToneCalibrationStatePatterns on ToneCalibrationState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( _Initializing value)?  initializing,TResult Function( _ErrorInitializing value)?  errorInitializing,TResult Function( _WaitingCalibration value)?  waitingCalibration,TResult Function( _DisplayingInstructions value)?  displayingInstructions,TResult Function( _Calibrating value)?  calibrating,TResult Function( _Analyzing value)?  analyzing,TResult Function( _BadCalibration value)?  badCalibration,TResult Function( _ErrorCalibrating value)?  errorCalibrating,TResult Function( _Calibrated value)?  calibrated,TResult Function( _CalibrationInterrupted value)?  interrupted,required TResult orElse(),}){
final _that = this;
switch (_that) {
case _Initializing() when initializing != null:
return initializing(_that);case _ErrorInitializing() when errorInitializing != null:
return errorInitializing(_that);case _WaitingCalibration() when waitingCalibration != null:
return waitingCalibration(_that);case _DisplayingInstructions() when displayingInstructions != null:
return displayingInstructions(_that);case _Calibrating() when calibrating != null:
return calibrating(_that);case _Analyzing() when analyzing != null:
return analyzing(_that);case _BadCalibration() when badCalibration != null:
return badCalibration(_that);case _ErrorCalibrating() when errorCalibrating != null:
return errorCalibrating(_that);case _Calibrated() when calibrated != null:
return calibrated(_that);case _CalibrationInterrupted() when interrupted != null:
return interrupted(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( _Initializing value)  initializing,required TResult Function( _ErrorInitializing value)  errorInitializing,required TResult Function( _WaitingCalibration value)  waitingCalibration,required TResult Function( _DisplayingInstructions value)  displayingInstructions,required TResult Function( _Calibrating value)  calibrating,required TResult Function( _Analyzing value)  analyzing,required TResult Function( _BadCalibration value)  badCalibration,required TResult Function( _ErrorCalibrating value)  errorCalibrating,required TResult Function( _Calibrated value)  calibrated,required TResult Function( _CalibrationInterrupted value)  interrupted,}){
final _that = this;
switch (_that) {
case _Initializing():
return initializing(_that);case _ErrorInitializing():
return errorInitializing(_that);case _WaitingCalibration():
return waitingCalibration(_that);case _DisplayingInstructions():
return displayingInstructions(_that);case _Calibrating():
return calibrating(_that);case _Analyzing():
return analyzing(_that);case _BadCalibration():
return badCalibration(_that);case _ErrorCalibrating():
return errorCalibrating(_that);case _Calibrated():
return calibrated(_that);case _CalibrationInterrupted():
return interrupted(_that);case _:
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( _Initializing value)?  initializing,TResult? Function( _ErrorInitializing value)?  errorInitializing,TResult? Function( _WaitingCalibration value)?  waitingCalibration,TResult? Function( _DisplayingInstructions value)?  displayingInstructions,TResult? Function( _Calibrating value)?  calibrating,TResult? Function( _Analyzing value)?  analyzing,TResult? Function( _BadCalibration value)?  badCalibration,TResult? Function( _ErrorCalibrating value)?  errorCalibrating,TResult? Function( _Calibrated value)?  calibrated,TResult? Function( _CalibrationInterrupted value)?  interrupted,}){
final _that = this;
switch (_that) {
case _Initializing() when initializing != null:
return initializing(_that);case _ErrorInitializing() when errorInitializing != null:
return errorInitializing(_that);case _WaitingCalibration() when waitingCalibration != null:
return waitingCalibration(_that);case _DisplayingInstructions() when displayingInstructions != null:
return displayingInstructions(_that);case _Calibrating() when calibrating != null:
return calibrating(_that);case _Analyzing() when analyzing != null:
return analyzing(_that);case _BadCalibration() when badCalibration != null:
return badCalibration(_that);case _ErrorCalibrating() when errorCalibrating != null:
return errorCalibrating(_that);case _Calibrated() when calibrated != null:
return calibrated(_that);case _CalibrationInterrupted() when interrupted != null:
return interrupted(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function()?  initializing,TResult Function( String message)?  errorInitializing,TResult Function()?  waitingCalibration,TResult Function()?  displayingInstructions,TResult Function()?  calibrating,TResult Function()?  analyzing,TResult Function()?  badCalibration,TResult Function( String message)?  errorCalibrating,TResult Function( double offset)?  calibrated,TResult Function()?  interrupted,required TResult orElse(),}) {final _that = this;
switch (_that) {
case _Initializing() when initializing != null:
return initializing();case _ErrorInitializing() when errorInitializing != null:
return errorInitializing(_that.message);case _WaitingCalibration() when waitingCalibration != null:
return waitingCalibration();case _DisplayingInstructions() when displayingInstructions != null:
return displayingInstructions();case _Calibrating() when calibrating != null:
return calibrating();case _Analyzing() when analyzing != null:
return analyzing();case _BadCalibration() when badCalibration != null:
return badCalibration();case _ErrorCalibrating() when errorCalibrating != null:
return errorCalibrating(_that.message);case _Calibrated() when calibrated != null:
return calibrated(_that.offset);case _CalibrationInterrupted() when interrupted != null:
return interrupted();case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function()  initializing,required TResult Function( String message)  errorInitializing,required TResult Function()  waitingCalibration,required TResult Function()  displayingInstructions,required TResult Function()  calibrating,required TResult Function()  analyzing,required TResult Function()  badCalibration,required TResult Function( String message)  errorCalibrating,required TResult Function( double offset)  calibrated,required TResult Function()  interrupted,}) {final _that = this;
switch (_that) {
case _Initializing():
return initializing();case _ErrorInitializing():
return errorInitializing(_that.message);case _WaitingCalibration():
return waitingCalibration();case _DisplayingInstructions():
return displayingInstructions();case _Calibrating():
return calibrating();case _Analyzing():
return analyzing();case _BadCalibration():
return badCalibration();case _ErrorCalibrating():
return errorCalibrating(_that.message);case _Calibrated():
return calibrated(_that.offset);case _CalibrationInterrupted():
return interrupted();case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function()?  initializing,TResult? Function( String message)?  errorInitializing,TResult? Function()?  waitingCalibration,TResult? Function()?  displayingInstructions,TResult? Function()?  calibrating,TResult? Function()?  analyzing,TResult? Function()?  badCalibration,TResult? Function( String message)?  errorCalibrating,TResult? Function( double offset)?  calibrated,TResult? Function()?  interrupted,}) {final _that = this;
switch (_that) {
case _Initializing() when initializing != null:
return initializing();case _ErrorInitializing() when errorInitializing != null:
return errorInitializing(_that.message);case _WaitingCalibration() when waitingCalibration != null:
return waitingCalibration();case _DisplayingInstructions() when displayingInstructions != null:
return displayingInstructions();case _Calibrating() when calibrating != null:
return calibrating();case _Analyzing() when analyzing != null:
return analyzing();case _BadCalibration() when badCalibration != null:
return badCalibration();case _ErrorCalibrating() when errorCalibrating != null:
return errorCalibrating(_that.message);case _Calibrated() when calibrated != null:
return calibrated(_that.offset);case _CalibrationInterrupted() when interrupted != null:
return interrupted();case _:
  return null;

}
}

}

/// @nodoc


class _Initializing implements ToneCalibrationState {
  const _Initializing();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Initializing);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'ToneCalibrationState.initializing()';
}


}




/// @nodoc


class _ErrorInitializing implements ToneCalibrationState {
  const _ErrorInitializing({required this.message});
  

 final  String message;

/// Create a copy of ToneCalibrationState
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
  return 'ToneCalibrationState.errorInitializing(message: $message)';
}


}

/// @nodoc
abstract mixin class _$ErrorInitializingCopyWith<$Res> implements $ToneCalibrationStateCopyWith<$Res> {
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

/// Create a copy of ToneCalibrationState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? message = null,}) {
  return _then(_ErrorInitializing(
message: null == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

/// @nodoc


class _WaitingCalibration implements ToneCalibrationState {
  const _WaitingCalibration();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _WaitingCalibration);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'ToneCalibrationState.waitingCalibration()';
}


}




/// @nodoc


class _DisplayingInstructions implements ToneCalibrationState {
  const _DisplayingInstructions();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _DisplayingInstructions);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'ToneCalibrationState.displayingInstructions()';
}


}




/// @nodoc


class _Calibrating implements ToneCalibrationState {
  const _Calibrating();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Calibrating);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'ToneCalibrationState.calibrating()';
}


}




/// @nodoc


class _Analyzing implements ToneCalibrationState {
  const _Analyzing();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Analyzing);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'ToneCalibrationState.analyzing()';
}


}




/// @nodoc


class _BadCalibration implements ToneCalibrationState {
  const _BadCalibration();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _BadCalibration);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'ToneCalibrationState.badCalibration()';
}


}




/// @nodoc


class _ErrorCalibrating implements ToneCalibrationState {
  const _ErrorCalibrating({required this.message});
  

 final  String message;

/// Create a copy of ToneCalibrationState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ErrorCalibratingCopyWith<_ErrorCalibrating> get copyWith => __$ErrorCalibratingCopyWithImpl<_ErrorCalibrating>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ErrorCalibrating&&(identical(other.message, message) || other.message == message));
}


@override
int get hashCode => Object.hash(runtimeType,message);

@override
String toString() {
  return 'ToneCalibrationState.errorCalibrating(message: $message)';
}


}

/// @nodoc
abstract mixin class _$ErrorCalibratingCopyWith<$Res> implements $ToneCalibrationStateCopyWith<$Res> {
  factory _$ErrorCalibratingCopyWith(_ErrorCalibrating value, $Res Function(_ErrorCalibrating) _then) = __$ErrorCalibratingCopyWithImpl;
@useResult
$Res call({
 String message
});




}
/// @nodoc
class __$ErrorCalibratingCopyWithImpl<$Res>
    implements _$ErrorCalibratingCopyWith<$Res> {
  __$ErrorCalibratingCopyWithImpl(this._self, this._then);

  final _ErrorCalibrating _self;
  final $Res Function(_ErrorCalibrating) _then;

/// Create a copy of ToneCalibrationState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? message = null,}) {
  return _then(_ErrorCalibrating(
message: null == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

/// @nodoc


class _Calibrated implements ToneCalibrationState {
  const _Calibrated({required this.offset});
  

 final  double offset;

/// Create a copy of ToneCalibrationState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$CalibratedCopyWith<_Calibrated> get copyWith => __$CalibratedCopyWithImpl<_Calibrated>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Calibrated&&(identical(other.offset, offset) || other.offset == offset));
}


@override
int get hashCode => Object.hash(runtimeType,offset);

@override
String toString() {
  return 'ToneCalibrationState.calibrated(offset: $offset)';
}


}

/// @nodoc
abstract mixin class _$CalibratedCopyWith<$Res> implements $ToneCalibrationStateCopyWith<$Res> {
  factory _$CalibratedCopyWith(_Calibrated value, $Res Function(_Calibrated) _then) = __$CalibratedCopyWithImpl;
@useResult
$Res call({
 double offset
});




}
/// @nodoc
class __$CalibratedCopyWithImpl<$Res>
    implements _$CalibratedCopyWith<$Res> {
  __$CalibratedCopyWithImpl(this._self, this._then);

  final _Calibrated _self;
  final $Res Function(_Calibrated) _then;

/// Create a copy of ToneCalibrationState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? offset = null,}) {
  return _then(_Calibrated(
offset: null == offset ? _self.offset : offset // ignore: cast_nullable_to_non_nullable
as double,
  ));
}


}

/// @nodoc


class _CalibrationInterrupted implements ToneCalibrationState {
  const _CalibrationInterrupted();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _CalibrationInterrupted);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'ToneCalibrationState.interrupted()';
}


}




// dart format on
