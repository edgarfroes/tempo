// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'permission_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$PermissionState {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is PermissionState);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'PermissionState()';
}


}

/// @nodoc
class $PermissionStateCopyWith<$Res>  {
$PermissionStateCopyWith(PermissionState _, $Res Function(PermissionState) __);
}


/// Adds pattern-matching-related methods to [PermissionState].
extension PermissionStatePatterns on PermissionState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( _Initial value)?  initial,TResult Function( _Disclaimer value)?  disclaimer,TResult Function( _Unknown value)?  unknown,TResult Function( _Denied value)?  denied,TResult Function( _PermanentlyDenied value)?  permanentlyDenied,TResult Function( _Requesting value)?  requesting,TResult Function( _FinishedRequesting value)?  finishedRequesting,TResult Function( _Granted value)?  granted,required TResult orElse(),}){
final _that = this;
switch (_that) {
case _Initial() when initial != null:
return initial(_that);case _Disclaimer() when disclaimer != null:
return disclaimer(_that);case _Unknown() when unknown != null:
return unknown(_that);case _Denied() when denied != null:
return denied(_that);case _PermanentlyDenied() when permanentlyDenied != null:
return permanentlyDenied(_that);case _Requesting() when requesting != null:
return requesting(_that);case _FinishedRequesting() when finishedRequesting != null:
return finishedRequesting(_that);case _Granted() when granted != null:
return granted(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( _Initial value)  initial,required TResult Function( _Disclaimer value)  disclaimer,required TResult Function( _Unknown value)  unknown,required TResult Function( _Denied value)  denied,required TResult Function( _PermanentlyDenied value)  permanentlyDenied,required TResult Function( _Requesting value)  requesting,required TResult Function( _FinishedRequesting value)  finishedRequesting,required TResult Function( _Granted value)  granted,}){
final _that = this;
switch (_that) {
case _Initial():
return initial(_that);case _Disclaimer():
return disclaimer(_that);case _Unknown():
return unknown(_that);case _Denied():
return denied(_that);case _PermanentlyDenied():
return permanentlyDenied(_that);case _Requesting():
return requesting(_that);case _FinishedRequesting():
return finishedRequesting(_that);case _Granted():
return granted(_that);case _:
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( _Initial value)?  initial,TResult? Function( _Disclaimer value)?  disclaimer,TResult? Function( _Unknown value)?  unknown,TResult? Function( _Denied value)?  denied,TResult? Function( _PermanentlyDenied value)?  permanentlyDenied,TResult? Function( _Requesting value)?  requesting,TResult? Function( _FinishedRequesting value)?  finishedRequesting,TResult? Function( _Granted value)?  granted,}){
final _that = this;
switch (_that) {
case _Initial() when initial != null:
return initial(_that);case _Disclaimer() when disclaimer != null:
return disclaimer(_that);case _Unknown() when unknown != null:
return unknown(_that);case _Denied() when denied != null:
return denied(_that);case _PermanentlyDenied() when permanentlyDenied != null:
return permanentlyDenied(_that);case _Requesting() when requesting != null:
return requesting(_that);case _FinishedRequesting() when finishedRequesting != null:
return finishedRequesting(_that);case _Granted() when granted != null:
return granted(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function()?  initial,TResult Function( Permission permission)?  disclaimer,TResult Function()?  unknown,TResult Function()?  denied,TResult Function()?  permanentlyDenied,TResult Function()?  requesting,TResult Function()?  finishedRequesting,TResult Function()?  granted,required TResult orElse(),}) {final _that = this;
switch (_that) {
case _Initial() when initial != null:
return initial();case _Disclaimer() when disclaimer != null:
return disclaimer(_that.permission);case _Unknown() when unknown != null:
return unknown();case _Denied() when denied != null:
return denied();case _PermanentlyDenied() when permanentlyDenied != null:
return permanentlyDenied();case _Requesting() when requesting != null:
return requesting();case _FinishedRequesting() when finishedRequesting != null:
return finishedRequesting();case _Granted() when granted != null:
return granted();case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function()  initial,required TResult Function( Permission permission)  disclaimer,required TResult Function()  unknown,required TResult Function()  denied,required TResult Function()  permanentlyDenied,required TResult Function()  requesting,required TResult Function()  finishedRequesting,required TResult Function()  granted,}) {final _that = this;
switch (_that) {
case _Initial():
return initial();case _Disclaimer():
return disclaimer(_that.permission);case _Unknown():
return unknown();case _Denied():
return denied();case _PermanentlyDenied():
return permanentlyDenied();case _Requesting():
return requesting();case _FinishedRequesting():
return finishedRequesting();case _Granted():
return granted();case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function()?  initial,TResult? Function( Permission permission)?  disclaimer,TResult? Function()?  unknown,TResult? Function()?  denied,TResult? Function()?  permanentlyDenied,TResult? Function()?  requesting,TResult? Function()?  finishedRequesting,TResult? Function()?  granted,}) {final _that = this;
switch (_that) {
case _Initial() when initial != null:
return initial();case _Disclaimer() when disclaimer != null:
return disclaimer(_that.permission);case _Unknown() when unknown != null:
return unknown();case _Denied() when denied != null:
return denied();case _PermanentlyDenied() when permanentlyDenied != null:
return permanentlyDenied();case _Requesting() when requesting != null:
return requesting();case _FinishedRequesting() when finishedRequesting != null:
return finishedRequesting();case _Granted() when granted != null:
return granted();case _:
  return null;

}
}

}

/// @nodoc


class _Initial implements PermissionState {
  const _Initial();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Initial);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'PermissionState.initial()';
}


}




/// @nodoc


class _Disclaimer implements PermissionState {
  const _Disclaimer({required this.permission});
  

 final  Permission permission;

/// Create a copy of PermissionState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$DisclaimerCopyWith<_Disclaimer> get copyWith => __$DisclaimerCopyWithImpl<_Disclaimer>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Disclaimer&&(identical(other.permission, permission) || other.permission == permission));
}


@override
int get hashCode => Object.hash(runtimeType,permission);

@override
String toString() {
  return 'PermissionState.disclaimer(permission: $permission)';
}


}

/// @nodoc
abstract mixin class _$DisclaimerCopyWith<$Res> implements $PermissionStateCopyWith<$Res> {
  factory _$DisclaimerCopyWith(_Disclaimer value, $Res Function(_Disclaimer) _then) = __$DisclaimerCopyWithImpl;
@useResult
$Res call({
 Permission permission
});


$PermissionCopyWith<$Res> get permission;

}
/// @nodoc
class __$DisclaimerCopyWithImpl<$Res>
    implements _$DisclaimerCopyWith<$Res> {
  __$DisclaimerCopyWithImpl(this._self, this._then);

  final _Disclaimer _self;
  final $Res Function(_Disclaimer) _then;

/// Create a copy of PermissionState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? permission = null,}) {
  return _then(_Disclaimer(
permission: null == permission ? _self.permission : permission // ignore: cast_nullable_to_non_nullable
as Permission,
  ));
}

/// Create a copy of PermissionState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$PermissionCopyWith<$Res> get permission {
  
  return $PermissionCopyWith<$Res>(_self.permission, (value) {
    return _then(_self.copyWith(permission: value));
  });
}
}

/// @nodoc


class _Unknown implements PermissionState {
  const _Unknown();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Unknown);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'PermissionState.unknown()';
}


}




/// @nodoc


class _Denied implements PermissionState {
  const _Denied();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Denied);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'PermissionState.denied()';
}


}




/// @nodoc


class _PermanentlyDenied implements PermissionState {
  const _PermanentlyDenied();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _PermanentlyDenied);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'PermissionState.permanentlyDenied()';
}


}




/// @nodoc


class _Requesting implements PermissionState {
  const _Requesting();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Requesting);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'PermissionState.requesting()';
}


}




/// @nodoc


class _FinishedRequesting implements PermissionState {
  const _FinishedRequesting();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _FinishedRequesting);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'PermissionState.finishedRequesting()';
}


}




/// @nodoc


class _Granted implements PermissionState {
  const _Granted();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Granted);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'PermissionState.granted()';
}


}




/// @nodoc
mixin _$Permission {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Permission);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'Permission()';
}


}

/// @nodoc
class $PermissionCopyWith<$Res>  {
$PermissionCopyWith(Permission _, $Res Function(Permission) __);
}


/// Adds pattern-matching-related methods to [Permission].
extension PermissionPatterns on Permission {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( _MicrophonePermission value)?  microphone,required TResult orElse(),}){
final _that = this;
switch (_that) {
case _MicrophonePermission() when microphone != null:
return microphone(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( _MicrophonePermission value)  microphone,}){
final _that = this;
switch (_that) {
case _MicrophonePermission():
return microphone(_that);case _:
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( _MicrophonePermission value)?  microphone,}){
final _that = this;
switch (_that) {
case _MicrophonePermission() when microphone != null:
return microphone(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function()?  microphone,required TResult orElse(),}) {final _that = this;
switch (_that) {
case _MicrophonePermission() when microphone != null:
return microphone();case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function()  microphone,}) {final _that = this;
switch (_that) {
case _MicrophonePermission():
return microphone();case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function()?  microphone,}) {final _that = this;
switch (_that) {
case _MicrophonePermission() when microphone != null:
return microphone();case _:
  return null;

}
}

}

/// @nodoc


class _MicrophonePermission implements Permission {
   _MicrophonePermission();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _MicrophonePermission);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'Permission.microphone()';
}


}




// dart format on
