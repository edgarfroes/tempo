// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'meter_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$MeterRefreshRate {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is MeterRefreshRate);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'MeterRefreshRate()';
}


}

/// @nodoc
class $MeterRefreshRateCopyWith<$Res>  {
$MeterRefreshRateCopyWith(MeterRefreshRate _, $Res Function(MeterRefreshRate) __);
}


/// Adds pattern-matching-related methods to [MeterRefreshRate].
extension MeterRefreshRatePatterns on MeterRefreshRate {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( _Slow value)?  slow,TResult Function( _Fast value)?  fast,required TResult orElse(),}){
final _that = this;
switch (_that) {
case _Slow() when slow != null:
return slow(_that);case _Fast() when fast != null:
return fast(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( _Slow value)  slow,required TResult Function( _Fast value)  fast,}){
final _that = this;
switch (_that) {
case _Slow():
return slow(_that);case _Fast():
return fast(_that);case _:
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( _Slow value)?  slow,TResult? Function( _Fast value)?  fast,}){
final _that = this;
switch (_that) {
case _Slow() when slow != null:
return slow(_that);case _Fast() when fast != null:
return fast(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function()?  slow,TResult Function()?  fast,required TResult orElse(),}) {final _that = this;
switch (_that) {
case _Slow() when slow != null:
return slow();case _Fast() when fast != null:
return fast();case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function()  slow,required TResult Function()  fast,}) {final _that = this;
switch (_that) {
case _Slow():
return slow();case _Fast():
return fast();case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function()?  slow,TResult? Function()?  fast,}) {final _that = this;
switch (_that) {
case _Slow() when slow != null:
return slow();case _Fast() when fast != null:
return fast();case _:
  return null;

}
}

}

/// @nodoc


class _Slow implements MeterRefreshRate {
  const _Slow();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Slow);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'MeterRefreshRate.slow()';
}


}




/// @nodoc


class _Fast implements MeterRefreshRate {
  const _Fast();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Fast);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'MeterRefreshRate.fast()';
}


}




// dart format on
