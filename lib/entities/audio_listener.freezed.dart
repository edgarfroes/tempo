// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'audio_listener.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$AudioListener {

 dynamic Function(Never) get listener;  Function(Object e) get onError;
/// Create a copy of AudioListener
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$AudioListenerCopyWith<AudioListener> get copyWith => _$AudioListenerCopyWithImpl<AudioListener>(this as AudioListener, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is AudioListener&&(identical(other.listener, listener) || other.listener == listener)&&(identical(other.onError, onError) || other.onError == onError));
}


@override
int get hashCode => Object.hash(runtimeType,listener,onError);

@override
String toString() {
  return 'AudioListener(listener: $listener, onError: $onError)';
}


}

/// @nodoc
abstract mixin class $AudioListenerCopyWith<$Res>  {
  factory $AudioListenerCopyWith(AudioListener value, $Res Function(AudioListener) _then) = _$AudioListenerCopyWithImpl;
@useResult
$Res call({
 dynamic Function(Object) onError
});




}
/// @nodoc
class _$AudioListenerCopyWithImpl<$Res>
    implements $AudioListenerCopyWith<$Res> {
  _$AudioListenerCopyWithImpl(this._self, this._then);

  final AudioListener _self;
  final $Res Function(AudioListener) _then;

/// Create a copy of AudioListener
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? onError = null,}) {
  return _then(_self.copyWith(
onError: null == onError ? _self.onError : onError // ignore: cast_nullable_to_non_nullable
as dynamic Function(Object),
  ));
}

}


/// Adds pattern-matching-related methods to [AudioListener].
extension AudioListenerPatterns on AudioListener {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( _Meter value)?  meter,TResult Function( _Capture value)?  capture,TResult Function( _Spectrum value)?  spectrum,required TResult orElse(),}){
final _that = this;
switch (_that) {
case _Meter() when meter != null:
return meter(_that);case _Capture() when capture != null:
return capture(_that);case _Spectrum() when spectrum != null:
return spectrum(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( _Meter value)  meter,required TResult Function( _Capture value)  capture,required TResult Function( _Spectrum value)  spectrum,}){
final _that = this;
switch (_that) {
case _Meter():
return meter(_that);case _Capture():
return capture(_that);case _Spectrum():
return spectrum(_that);case _:
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( _Meter value)?  meter,TResult? Function( _Capture value)?  capture,TResult? Function( _Spectrum value)?  spectrum,}){
final _that = this;
switch (_that) {
case _Meter() when meter != null:
return meter(_that);case _Capture() when capture != null:
return capture(_that);case _Spectrum() when spectrum != null:
return spectrum(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function(  Function(double decibels) listener,   Function(Object e) onError)?  meter,TResult Function(  Function(Float32List buffer) listener,   Function(Object e) onError)?  capture,TResult Function(  Function(List<Frequency> spectrum) listener,   Function(Object e) onError)?  spectrum,required TResult orElse(),}) {final _that = this;
switch (_that) {
case _Meter() when meter != null:
return meter(_that.listener,_that.onError);case _Capture() when capture != null:
return capture(_that.listener,_that.onError);case _Spectrum() when spectrum != null:
return spectrum(_that.listener,_that.onError);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function(  Function(double decibels) listener,   Function(Object e) onError)  meter,required TResult Function(  Function(Float32List buffer) listener,   Function(Object e) onError)  capture,required TResult Function(  Function(List<Frequency> spectrum) listener,   Function(Object e) onError)  spectrum,}) {final _that = this;
switch (_that) {
case _Meter():
return meter(_that.listener,_that.onError);case _Capture():
return capture(_that.listener,_that.onError);case _Spectrum():
return spectrum(_that.listener,_that.onError);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function(  Function(double decibels) listener,   Function(Object e) onError)?  meter,TResult? Function(  Function(Float32List buffer) listener,   Function(Object e) onError)?  capture,TResult? Function(  Function(List<Frequency> spectrum) listener,   Function(Object e) onError)?  spectrum,}) {final _that = this;
switch (_that) {
case _Meter() when meter != null:
return meter(_that.listener,_that.onError);case _Capture() when capture != null:
return capture(_that.listener,_that.onError);case _Spectrum() when spectrum != null:
return spectrum(_that.listener,_that.onError);case _:
  return null;

}
}

}

/// @nodoc


class _Meter extends AudioListener {
   _Meter({required this.listener, required this.onError}): super._();
  

@override final   Function(double decibels) listener;
@override final   Function(Object e) onError;

/// Create a copy of AudioListener
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$MeterCopyWith<_Meter> get copyWith => __$MeterCopyWithImpl<_Meter>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Meter&&(identical(other.listener, listener) || other.listener == listener)&&(identical(other.onError, onError) || other.onError == onError));
}


@override
int get hashCode => Object.hash(runtimeType,listener,onError);

@override
String toString() {
  return 'AudioListener.meter(listener: $listener, onError: $onError)';
}


}

/// @nodoc
abstract mixin class _$MeterCopyWith<$Res> implements $AudioListenerCopyWith<$Res> {
  factory _$MeterCopyWith(_Meter value, $Res Function(_Meter) _then) = __$MeterCopyWithImpl;
@override @useResult
$Res call({
  Function(double decibels) listener,  Function(Object e) onError
});




}
/// @nodoc
class __$MeterCopyWithImpl<$Res>
    implements _$MeterCopyWith<$Res> {
  __$MeterCopyWithImpl(this._self, this._then);

  final _Meter _self;
  final $Res Function(_Meter) _then;

/// Create a copy of AudioListener
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? listener = null,Object? onError = null,}) {
  return _then(_Meter(
listener: null == listener ? _self.listener : listener // ignore: cast_nullable_to_non_nullable
as  Function(double decibels),onError: null == onError ? _self.onError : onError // ignore: cast_nullable_to_non_nullable
as  Function(Object e),
  ));
}


}

/// @nodoc


class _Capture extends AudioListener {
   _Capture({required this.listener, required this.onError}): super._();
  

@override final   Function(Float32List buffer) listener;
@override final   Function(Object e) onError;

/// Create a copy of AudioListener
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$CaptureCopyWith<_Capture> get copyWith => __$CaptureCopyWithImpl<_Capture>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Capture&&(identical(other.listener, listener) || other.listener == listener)&&(identical(other.onError, onError) || other.onError == onError));
}


@override
int get hashCode => Object.hash(runtimeType,listener,onError);

@override
String toString() {
  return 'AudioListener.capture(listener: $listener, onError: $onError)';
}


}

/// @nodoc
abstract mixin class _$CaptureCopyWith<$Res> implements $AudioListenerCopyWith<$Res> {
  factory _$CaptureCopyWith(_Capture value, $Res Function(_Capture) _then) = __$CaptureCopyWithImpl;
@override @useResult
$Res call({
  Function(Float32List buffer) listener,  Function(Object e) onError
});




}
/// @nodoc
class __$CaptureCopyWithImpl<$Res>
    implements _$CaptureCopyWith<$Res> {
  __$CaptureCopyWithImpl(this._self, this._then);

  final _Capture _self;
  final $Res Function(_Capture) _then;

/// Create a copy of AudioListener
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? listener = null,Object? onError = null,}) {
  return _then(_Capture(
listener: null == listener ? _self.listener : listener // ignore: cast_nullable_to_non_nullable
as  Function(Float32List buffer),onError: null == onError ? _self.onError : onError // ignore: cast_nullable_to_non_nullable
as  Function(Object e),
  ));
}


}

/// @nodoc


class _Spectrum extends AudioListener {
   _Spectrum({required this.listener, required this.onError}): super._();
  

@override final   Function(List<Frequency> spectrum) listener;
@override final   Function(Object e) onError;

/// Create a copy of AudioListener
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$SpectrumCopyWith<_Spectrum> get copyWith => __$SpectrumCopyWithImpl<_Spectrum>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Spectrum&&(identical(other.listener, listener) || other.listener == listener)&&(identical(other.onError, onError) || other.onError == onError));
}


@override
int get hashCode => Object.hash(runtimeType,listener,onError);

@override
String toString() {
  return 'AudioListener.spectrum(listener: $listener, onError: $onError)';
}


}

/// @nodoc
abstract mixin class _$SpectrumCopyWith<$Res> implements $AudioListenerCopyWith<$Res> {
  factory _$SpectrumCopyWith(_Spectrum value, $Res Function(_Spectrum) _then) = __$SpectrumCopyWithImpl;
@override @useResult
$Res call({
  Function(List<Frequency> spectrum) listener,  Function(Object e) onError
});




}
/// @nodoc
class __$SpectrumCopyWithImpl<$Res>
    implements _$SpectrumCopyWith<$Res> {
  __$SpectrumCopyWithImpl(this._self, this._then);

  final _Spectrum _self;
  final $Res Function(_Spectrum) _then;

/// Create a copy of AudioListener
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? listener = null,Object? onError = null,}) {
  return _then(_Spectrum(
listener: null == listener ? _self.listener : listener // ignore: cast_nullable_to_non_nullable
as  Function(List<Frequency> spectrum),onError: null == onError ? _self.onError : onError // ignore: cast_nullable_to_non_nullable
as  Function(Object e),
  ));
}


}

// dart format on
