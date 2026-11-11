// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'tracker_detail_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$TrackerReadResponse {

 Tracker? get value; bool? get success;
/// Create a copy of TrackerReadResponse
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$TrackerReadResponseCopyWith<TrackerReadResponse> get copyWith => _$TrackerReadResponseCopyWithImpl<TrackerReadResponse>(this as TrackerReadResponse, _$identity);

  /// Serializes this TrackerReadResponse to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is TrackerReadResponse&&(identical(other.value, value) || other.value == value)&&(identical(other.success, success) || other.success == success));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,value,success);

@override
String toString() {
  return 'TrackerReadResponse(value: $value, success: $success)';
}


}

/// @nodoc
abstract mixin class $TrackerReadResponseCopyWith<$Res>  {
  factory $TrackerReadResponseCopyWith(TrackerReadResponse value, $Res Function(TrackerReadResponse) _then) = _$TrackerReadResponseCopyWithImpl;
@useResult
$Res call({
 Tracker? value, bool? success
});


$TrackerCopyWith<$Res>? get value;

}
/// @nodoc
class _$TrackerReadResponseCopyWithImpl<$Res>
    implements $TrackerReadResponseCopyWith<$Res> {
  _$TrackerReadResponseCopyWithImpl(this._self, this._then);

  final TrackerReadResponse _self;
  final $Res Function(TrackerReadResponse) _then;

/// Create a copy of TrackerReadResponse
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? value = freezed,Object? success = freezed,}) {
  return _then(_self.copyWith(
value: freezed == value ? _self.value : value // ignore: cast_nullable_to_non_nullable
as Tracker?,success: freezed == success ? _self.success : success // ignore: cast_nullable_to_non_nullable
as bool?,
  ));
}
/// Create a copy of TrackerReadResponse
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$TrackerCopyWith<$Res>? get value {
    if (_self.value == null) {
    return null;
  }

  return $TrackerCopyWith<$Res>(_self.value!, (value) {
    return _then(_self.copyWith(value: value));
  });
}
}


/// Adds pattern-matching-related methods to [TrackerReadResponse].
extension TrackerReadResponsePatterns on TrackerReadResponse {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _TrackerReadResponse value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _TrackerReadResponse() when $default != null:
return $default(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _TrackerReadResponse value)  $default,){
final _that = this;
switch (_that) {
case _TrackerReadResponse():
return $default(_that);case _:
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _TrackerReadResponse value)?  $default,){
final _that = this;
switch (_that) {
case _TrackerReadResponse() when $default != null:
return $default(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( Tracker? value,  bool? success)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _TrackerReadResponse() when $default != null:
return $default(_that.value,_that.success);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( Tracker? value,  bool? success)  $default,) {final _that = this;
switch (_that) {
case _TrackerReadResponse():
return $default(_that.value,_that.success);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( Tracker? value,  bool? success)?  $default,) {final _that = this;
switch (_that) {
case _TrackerReadResponse() when $default != null:
return $default(_that.value,_that.success);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _TrackerReadResponse implements TrackerReadResponse {
  const _TrackerReadResponse({this.value, this.success});
  factory _TrackerReadResponse.fromJson(Map<String, dynamic> json) => _$TrackerReadResponseFromJson(json);

@override final  Tracker? value;
@override final  bool? success;

/// Create a copy of TrackerReadResponse
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$TrackerReadResponseCopyWith<_TrackerReadResponse> get copyWith => __$TrackerReadResponseCopyWithImpl<_TrackerReadResponse>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$TrackerReadResponseToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _TrackerReadResponse&&(identical(other.value, value) || other.value == value)&&(identical(other.success, success) || other.success == success));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,value,success);

@override
String toString() {
  return 'TrackerReadResponse(value: $value, success: $success)';
}


}

/// @nodoc
abstract mixin class _$TrackerReadResponseCopyWith<$Res> implements $TrackerReadResponseCopyWith<$Res> {
  factory _$TrackerReadResponseCopyWith(_TrackerReadResponse value, $Res Function(_TrackerReadResponse) _then) = __$TrackerReadResponseCopyWithImpl;
@override @useResult
$Res call({
 Tracker? value, bool? success
});


@override $TrackerCopyWith<$Res>? get value;

}
/// @nodoc
class __$TrackerReadResponseCopyWithImpl<$Res>
    implements _$TrackerReadResponseCopyWith<$Res> {
  __$TrackerReadResponseCopyWithImpl(this._self, this._then);

  final _TrackerReadResponse _self;
  final $Res Function(_TrackerReadResponse) _then;

/// Create a copy of TrackerReadResponse
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? value = freezed,Object? success = freezed,}) {
  return _then(_TrackerReadResponse(
value: freezed == value ? _self.value : value // ignore: cast_nullable_to_non_nullable
as Tracker?,success: freezed == success ? _self.success : success // ignore: cast_nullable_to_non_nullable
as bool?,
  ));
}

/// Create a copy of TrackerReadResponse
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$TrackerCopyWith<$Res>? get value {
    if (_self.value == null) {
    return null;
  }

  return $TrackerCopyWith<$Res>(_self.value!, (value) {
    return _then(_self.copyWith(value: value));
  });
}
}

// dart format on
