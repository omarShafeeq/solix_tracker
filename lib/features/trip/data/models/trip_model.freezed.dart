// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'trip_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$TripPoint {

@FlexibleDoubleConverter() double? get lat;@FlexibleDoubleConverter() double? get lng; String? get address;@FlexibleIntConverter() int? get satellites;@FlexibleDoubleConverter() double? get mileage;@FlexibleDoubleConverter() double? get heading;@FlexibleDoubleConverter() double? get speed; bool? get buffered;@FlexibleDoubleConverter() double? get alt;@JsonKey(name: 'get_time') String? get getTime;
/// Create a copy of TripPoint
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$TripPointCopyWith<TripPoint> get copyWith => _$TripPointCopyWithImpl<TripPoint>(this as TripPoint, _$identity);

  /// Serializes this TripPoint to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is TripPoint&&(identical(other.lat, lat) || other.lat == lat)&&(identical(other.lng, lng) || other.lng == lng)&&(identical(other.address, address) || other.address == address)&&(identical(other.satellites, satellites) || other.satellites == satellites)&&(identical(other.mileage, mileage) || other.mileage == mileage)&&(identical(other.heading, heading) || other.heading == heading)&&(identical(other.speed, speed) || other.speed == speed)&&(identical(other.buffered, buffered) || other.buffered == buffered)&&(identical(other.alt, alt) || other.alt == alt)&&(identical(other.getTime, getTime) || other.getTime == getTime));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,lat,lng,address,satellites,mileage,heading,speed,buffered,alt,getTime);

@override
String toString() {
  return 'TripPoint(lat: $lat, lng: $lng, address: $address, satellites: $satellites, mileage: $mileage, heading: $heading, speed: $speed, buffered: $buffered, alt: $alt, getTime: $getTime)';
}


}

/// @nodoc
abstract mixin class $TripPointCopyWith<$Res>  {
  factory $TripPointCopyWith(TripPoint value, $Res Function(TripPoint) _then) = _$TripPointCopyWithImpl;
@useResult
$Res call({
@FlexibleDoubleConverter() double? lat,@FlexibleDoubleConverter() double? lng, String? address,@FlexibleIntConverter() int? satellites,@FlexibleDoubleConverter() double? mileage,@FlexibleDoubleConverter() double? heading,@FlexibleDoubleConverter() double? speed, bool? buffered,@FlexibleDoubleConverter() double? alt,@JsonKey(name: 'get_time') String? getTime
});




}
/// @nodoc
class _$TripPointCopyWithImpl<$Res>
    implements $TripPointCopyWith<$Res> {
  _$TripPointCopyWithImpl(this._self, this._then);

  final TripPoint _self;
  final $Res Function(TripPoint) _then;

/// Create a copy of TripPoint
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? lat = freezed,Object? lng = freezed,Object? address = freezed,Object? satellites = freezed,Object? mileage = freezed,Object? heading = freezed,Object? speed = freezed,Object? buffered = freezed,Object? alt = freezed,Object? getTime = freezed,}) {
  return _then(_self.copyWith(
lat: freezed == lat ? _self.lat : lat // ignore: cast_nullable_to_non_nullable
as double?,lng: freezed == lng ? _self.lng : lng // ignore: cast_nullable_to_non_nullable
as double?,address: freezed == address ? _self.address : address // ignore: cast_nullable_to_non_nullable
as String?,satellites: freezed == satellites ? _self.satellites : satellites // ignore: cast_nullable_to_non_nullable
as int?,mileage: freezed == mileage ? _self.mileage : mileage // ignore: cast_nullable_to_non_nullable
as double?,heading: freezed == heading ? _self.heading : heading // ignore: cast_nullable_to_non_nullable
as double?,speed: freezed == speed ? _self.speed : speed // ignore: cast_nullable_to_non_nullable
as double?,buffered: freezed == buffered ? _self.buffered : buffered // ignore: cast_nullable_to_non_nullable
as bool?,alt: freezed == alt ? _self.alt : alt // ignore: cast_nullable_to_non_nullable
as double?,getTime: freezed == getTime ? _self.getTime : getTime // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [TripPoint].
extension TripPointPatterns on TripPoint {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _TripPoint value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _TripPoint() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _TripPoint value)  $default,){
final _that = this;
switch (_that) {
case _TripPoint():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _TripPoint value)?  $default,){
final _that = this;
switch (_that) {
case _TripPoint() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function(@FlexibleDoubleConverter()  double? lat, @FlexibleDoubleConverter()  double? lng,  String? address, @FlexibleIntConverter()  int? satellites, @FlexibleDoubleConverter()  double? mileage, @FlexibleDoubleConverter()  double? heading, @FlexibleDoubleConverter()  double? speed,  bool? buffered, @FlexibleDoubleConverter()  double? alt, @JsonKey(name: 'get_time')  String? getTime)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _TripPoint() when $default != null:
return $default(_that.lat,_that.lng,_that.address,_that.satellites,_that.mileage,_that.heading,_that.speed,_that.buffered,_that.alt,_that.getTime);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function(@FlexibleDoubleConverter()  double? lat, @FlexibleDoubleConverter()  double? lng,  String? address, @FlexibleIntConverter()  int? satellites, @FlexibleDoubleConverter()  double? mileage, @FlexibleDoubleConverter()  double? heading, @FlexibleDoubleConverter()  double? speed,  bool? buffered, @FlexibleDoubleConverter()  double? alt, @JsonKey(name: 'get_time')  String? getTime)  $default,) {final _that = this;
switch (_that) {
case _TripPoint():
return $default(_that.lat,_that.lng,_that.address,_that.satellites,_that.mileage,_that.heading,_that.speed,_that.buffered,_that.alt,_that.getTime);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function(@FlexibleDoubleConverter()  double? lat, @FlexibleDoubleConverter()  double? lng,  String? address, @FlexibleIntConverter()  int? satellites, @FlexibleDoubleConverter()  double? mileage, @FlexibleDoubleConverter()  double? heading, @FlexibleDoubleConverter()  double? speed,  bool? buffered, @FlexibleDoubleConverter()  double? alt, @JsonKey(name: 'get_time')  String? getTime)?  $default,) {final _that = this;
switch (_that) {
case _TripPoint() when $default != null:
return $default(_that.lat,_that.lng,_that.address,_that.satellites,_that.mileage,_that.heading,_that.speed,_that.buffered,_that.alt,_that.getTime);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _TripPoint implements TripPoint {
  const _TripPoint({@FlexibleDoubleConverter() this.lat, @FlexibleDoubleConverter() this.lng, this.address, @FlexibleIntConverter() this.satellites, @FlexibleDoubleConverter() this.mileage, @FlexibleDoubleConverter() this.heading, @FlexibleDoubleConverter() this.speed, this.buffered, @FlexibleDoubleConverter() this.alt, @JsonKey(name: 'get_time') this.getTime});
  factory _TripPoint.fromJson(Map<String, dynamic> json) => _$TripPointFromJson(json);

@override@FlexibleDoubleConverter() final  double? lat;
@override@FlexibleDoubleConverter() final  double? lng;
@override final  String? address;
@override@FlexibleIntConverter() final  int? satellites;
@override@FlexibleDoubleConverter() final  double? mileage;
@override@FlexibleDoubleConverter() final  double? heading;
@override@FlexibleDoubleConverter() final  double? speed;
@override final  bool? buffered;
@override@FlexibleDoubleConverter() final  double? alt;
@override@JsonKey(name: 'get_time') final  String? getTime;

/// Create a copy of TripPoint
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$TripPointCopyWith<_TripPoint> get copyWith => __$TripPointCopyWithImpl<_TripPoint>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$TripPointToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _TripPoint&&(identical(other.lat, lat) || other.lat == lat)&&(identical(other.lng, lng) || other.lng == lng)&&(identical(other.address, address) || other.address == address)&&(identical(other.satellites, satellites) || other.satellites == satellites)&&(identical(other.mileage, mileage) || other.mileage == mileage)&&(identical(other.heading, heading) || other.heading == heading)&&(identical(other.speed, speed) || other.speed == speed)&&(identical(other.buffered, buffered) || other.buffered == buffered)&&(identical(other.alt, alt) || other.alt == alt)&&(identical(other.getTime, getTime) || other.getTime == getTime));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,lat,lng,address,satellites,mileage,heading,speed,buffered,alt,getTime);

@override
String toString() {
  return 'TripPoint(lat: $lat, lng: $lng, address: $address, satellites: $satellites, mileage: $mileage, heading: $heading, speed: $speed, buffered: $buffered, alt: $alt, getTime: $getTime)';
}


}

/// @nodoc
abstract mixin class _$TripPointCopyWith<$Res> implements $TripPointCopyWith<$Res> {
  factory _$TripPointCopyWith(_TripPoint value, $Res Function(_TripPoint) _then) = __$TripPointCopyWithImpl;
@override @useResult
$Res call({
@FlexibleDoubleConverter() double? lat,@FlexibleDoubleConverter() double? lng, String? address,@FlexibleIntConverter() int? satellites,@FlexibleDoubleConverter() double? mileage,@FlexibleDoubleConverter() double? heading,@FlexibleDoubleConverter() double? speed, bool? buffered,@FlexibleDoubleConverter() double? alt,@JsonKey(name: 'get_time') String? getTime
});




}
/// @nodoc
class __$TripPointCopyWithImpl<$Res>
    implements _$TripPointCopyWith<$Res> {
  __$TripPointCopyWithImpl(this._self, this._then);

  final _TripPoint _self;
  final $Res Function(_TripPoint) _then;

/// Create a copy of TripPoint
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? lat = freezed,Object? lng = freezed,Object? address = freezed,Object? satellites = freezed,Object? mileage = freezed,Object? heading = freezed,Object? speed = freezed,Object? buffered = freezed,Object? alt = freezed,Object? getTime = freezed,}) {
  return _then(_TripPoint(
lat: freezed == lat ? _self.lat : lat // ignore: cast_nullable_to_non_nullable
as double?,lng: freezed == lng ? _self.lng : lng // ignore: cast_nullable_to_non_nullable
as double?,address: freezed == address ? _self.address : address // ignore: cast_nullable_to_non_nullable
as String?,satellites: freezed == satellites ? _self.satellites : satellites // ignore: cast_nullable_to_non_nullable
as int?,mileage: freezed == mileage ? _self.mileage : mileage // ignore: cast_nullable_to_non_nullable
as double?,heading: freezed == heading ? _self.heading : heading // ignore: cast_nullable_to_non_nullable
as double?,speed: freezed == speed ? _self.speed : speed // ignore: cast_nullable_to_non_nullable
as double?,buffered: freezed == buffered ? _self.buffered : buffered // ignore: cast_nullable_to_non_nullable
as bool?,alt: freezed == alt ? _self.alt : alt // ignore: cast_nullable_to_non_nullable
as double?,getTime: freezed == getTime ? _self.getTime : getTime // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}


/// @nodoc
mixin _$TripLatLng {

@FlexibleDoubleConverter() double? get lat;@FlexibleDoubleConverter() double? get lng;
/// Create a copy of TripLatLng
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$TripLatLngCopyWith<TripLatLng> get copyWith => _$TripLatLngCopyWithImpl<TripLatLng>(this as TripLatLng, _$identity);

  /// Serializes this TripLatLng to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is TripLatLng&&(identical(other.lat, lat) || other.lat == lat)&&(identical(other.lng, lng) || other.lng == lng));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,lat,lng);

@override
String toString() {
  return 'TripLatLng(lat: $lat, lng: $lng)';
}


}

/// @nodoc
abstract mixin class $TripLatLngCopyWith<$Res>  {
  factory $TripLatLngCopyWith(TripLatLng value, $Res Function(TripLatLng) _then) = _$TripLatLngCopyWithImpl;
@useResult
$Res call({
@FlexibleDoubleConverter() double? lat,@FlexibleDoubleConverter() double? lng
});




}
/// @nodoc
class _$TripLatLngCopyWithImpl<$Res>
    implements $TripLatLngCopyWith<$Res> {
  _$TripLatLngCopyWithImpl(this._self, this._then);

  final TripLatLng _self;
  final $Res Function(TripLatLng) _then;

/// Create a copy of TripLatLng
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? lat = freezed,Object? lng = freezed,}) {
  return _then(_self.copyWith(
lat: freezed == lat ? _self.lat : lat // ignore: cast_nullable_to_non_nullable
as double?,lng: freezed == lng ? _self.lng : lng // ignore: cast_nullable_to_non_nullable
as double?,
  ));
}

}


/// Adds pattern-matching-related methods to [TripLatLng].
extension TripLatLngPatterns on TripLatLng {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _TripLatLng value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _TripLatLng() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _TripLatLng value)  $default,){
final _that = this;
switch (_that) {
case _TripLatLng():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _TripLatLng value)?  $default,){
final _that = this;
switch (_that) {
case _TripLatLng() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function(@FlexibleDoubleConverter()  double? lat, @FlexibleDoubleConverter()  double? lng)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _TripLatLng() when $default != null:
return $default(_that.lat,_that.lng);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function(@FlexibleDoubleConverter()  double? lat, @FlexibleDoubleConverter()  double? lng)  $default,) {final _that = this;
switch (_that) {
case _TripLatLng():
return $default(_that.lat,_that.lng);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function(@FlexibleDoubleConverter()  double? lat, @FlexibleDoubleConverter()  double? lng)?  $default,) {final _that = this;
switch (_that) {
case _TripLatLng() when $default != null:
return $default(_that.lat,_that.lng);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _TripLatLng implements TripLatLng {
  const _TripLatLng({@FlexibleDoubleConverter() this.lat, @FlexibleDoubleConverter() this.lng});
  factory _TripLatLng.fromJson(Map<String, dynamic> json) => _$TripLatLngFromJson(json);

@override@FlexibleDoubleConverter() final  double? lat;
@override@FlexibleDoubleConverter() final  double? lng;

/// Create a copy of TripLatLng
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$TripLatLngCopyWith<_TripLatLng> get copyWith => __$TripLatLngCopyWithImpl<_TripLatLng>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$TripLatLngToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _TripLatLng&&(identical(other.lat, lat) || other.lat == lat)&&(identical(other.lng, lng) || other.lng == lng));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,lat,lng);

@override
String toString() {
  return 'TripLatLng(lat: $lat, lng: $lng)';
}


}

/// @nodoc
abstract mixin class _$TripLatLngCopyWith<$Res> implements $TripLatLngCopyWith<$Res> {
  factory _$TripLatLngCopyWith(_TripLatLng value, $Res Function(_TripLatLng) _then) = __$TripLatLngCopyWithImpl;
@override @useResult
$Res call({
@FlexibleDoubleConverter() double? lat,@FlexibleDoubleConverter() double? lng
});




}
/// @nodoc
class __$TripLatLngCopyWithImpl<$Res>
    implements _$TripLatLngCopyWith<$Res> {
  __$TripLatLngCopyWithImpl(this._self, this._then);

  final _TripLatLng _self;
  final $Res Function(_TripLatLng) _then;

/// Create a copy of TripLatLng
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? lat = freezed,Object? lng = freezed,}) {
  return _then(_TripLatLng(
lat: freezed == lat ? _self.lat : lat // ignore: cast_nullable_to_non_nullable
as double?,lng: freezed == lng ? _self.lng : lng // ignore: cast_nullable_to_non_nullable
as double?,
  ));
}


}


/// @nodoc
mixin _$TripBounds {

 TripLatLng? get nw; TripLatLng? get se;
/// Create a copy of TripBounds
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$TripBoundsCopyWith<TripBounds> get copyWith => _$TripBoundsCopyWithImpl<TripBounds>(this as TripBounds, _$identity);

  /// Serializes this TripBounds to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is TripBounds&&(identical(other.nw, nw) || other.nw == nw)&&(identical(other.se, se) || other.se == se));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,nw,se);

@override
String toString() {
  return 'TripBounds(nw: $nw, se: $se)';
}


}

/// @nodoc
abstract mixin class $TripBoundsCopyWith<$Res>  {
  factory $TripBoundsCopyWith(TripBounds value, $Res Function(TripBounds) _then) = _$TripBoundsCopyWithImpl;
@useResult
$Res call({
 TripLatLng? nw, TripLatLng? se
});


$TripLatLngCopyWith<$Res>? get nw;$TripLatLngCopyWith<$Res>? get se;

}
/// @nodoc
class _$TripBoundsCopyWithImpl<$Res>
    implements $TripBoundsCopyWith<$Res> {
  _$TripBoundsCopyWithImpl(this._self, this._then);

  final TripBounds _self;
  final $Res Function(TripBounds) _then;

/// Create a copy of TripBounds
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? nw = freezed,Object? se = freezed,}) {
  return _then(_self.copyWith(
nw: freezed == nw ? _self.nw : nw // ignore: cast_nullable_to_non_nullable
as TripLatLng?,se: freezed == se ? _self.se : se // ignore: cast_nullable_to_non_nullable
as TripLatLng?,
  ));
}
/// Create a copy of TripBounds
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$TripLatLngCopyWith<$Res>? get nw {
    if (_self.nw == null) {
    return null;
  }

  return $TripLatLngCopyWith<$Res>(_self.nw!, (value) {
    return _then(_self.copyWith(nw: value));
  });
}/// Create a copy of TripBounds
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$TripLatLngCopyWith<$Res>? get se {
    if (_self.se == null) {
    return null;
  }

  return $TripLatLngCopyWith<$Res>(_self.se!, (value) {
    return _then(_self.copyWith(se: value));
  });
}
}


/// Adds pattern-matching-related methods to [TripBounds].
extension TripBoundsPatterns on TripBounds {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _TripBounds value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _TripBounds() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _TripBounds value)  $default,){
final _that = this;
switch (_that) {
case _TripBounds():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _TripBounds value)?  $default,){
final _that = this;
switch (_that) {
case _TripBounds() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( TripLatLng? nw,  TripLatLng? se)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _TripBounds() when $default != null:
return $default(_that.nw,_that.se);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( TripLatLng? nw,  TripLatLng? se)  $default,) {final _that = this;
switch (_that) {
case _TripBounds():
return $default(_that.nw,_that.se);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( TripLatLng? nw,  TripLatLng? se)?  $default,) {final _that = this;
switch (_that) {
case _TripBounds() when $default != null:
return $default(_that.nw,_that.se);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _TripBounds implements TripBounds {
  const _TripBounds({this.nw, this.se});
  factory _TripBounds.fromJson(Map<String, dynamic> json) => _$TripBoundsFromJson(json);

@override final  TripLatLng? nw;
@override final  TripLatLng? se;

/// Create a copy of TripBounds
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$TripBoundsCopyWith<_TripBounds> get copyWith => __$TripBoundsCopyWithImpl<_TripBounds>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$TripBoundsToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _TripBounds&&(identical(other.nw, nw) || other.nw == nw)&&(identical(other.se, se) || other.se == se));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,nw,se);

@override
String toString() {
  return 'TripBounds(nw: $nw, se: $se)';
}


}

/// @nodoc
abstract mixin class _$TripBoundsCopyWith<$Res> implements $TripBoundsCopyWith<$Res> {
  factory _$TripBoundsCopyWith(_TripBounds value, $Res Function(_TripBounds) _then) = __$TripBoundsCopyWithImpl;
@override @useResult
$Res call({
 TripLatLng? nw, TripLatLng? se
});


@override $TripLatLngCopyWith<$Res>? get nw;@override $TripLatLngCopyWith<$Res>? get se;

}
/// @nodoc
class __$TripBoundsCopyWithImpl<$Res>
    implements _$TripBoundsCopyWith<$Res> {
  __$TripBoundsCopyWithImpl(this._self, this._then);

  final _TripBounds _self;
  final $Res Function(_TripBounds) _then;

/// Create a copy of TripBounds
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? nw = freezed,Object? se = freezed,}) {
  return _then(_TripBounds(
nw: freezed == nw ? _self.nw : nw // ignore: cast_nullable_to_non_nullable
as TripLatLng?,se: freezed == se ? _self.se : se // ignore: cast_nullable_to_non_nullable
as TripLatLng?,
  ));
}

/// Create a copy of TripBounds
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$TripLatLngCopyWith<$Res>? get nw {
    if (_self.nw == null) {
    return null;
  }

  return $TripLatLngCopyWith<$Res>(_self.nw!, (value) {
    return _then(_self.copyWith(nw: value));
  });
}/// Create a copy of TripBounds
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$TripLatLngCopyWith<$Res>? get se {
    if (_self.se == null) {
    return null;
  }

  return $TripLatLngCopyWith<$Res>(_self.se!, (value) {
    return _then(_self.copyWith(se: value));
  });
}
}


/// @nodoc
mixin _$Trip {

@FlexibleIntConverter() int? get id;@JsonKey(name: 'start_date') String? get startDate;@JsonKey(name: 'end_date') String? get endDate;@JsonKey(name: 'avg_speed')@FlexibleDoubleConverter() double? get avgSpeed;@JsonKey(name: 'max_speed')@FlexibleDoubleConverter() double? get maxSpeed;@FlexibleDoubleConverter() double? get length;@JsonKey(name: 'end_address') String? get endAddress;@JsonKey(name: 'start_address') String? get startAddress; TripBounds? get bounds; String? get type;@FlexibleIntConverter() int? get points;@JsonKey(name: 'points_list', fromJson: _pointsFromJson, toJson: _pointsToJson) List<TripPoint> get pointsList;
/// Create a copy of Trip
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$TripCopyWith<Trip> get copyWith => _$TripCopyWithImpl<Trip>(this as Trip, _$identity);

  /// Serializes this Trip to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Trip&&(identical(other.id, id) || other.id == id)&&(identical(other.startDate, startDate) || other.startDate == startDate)&&(identical(other.endDate, endDate) || other.endDate == endDate)&&(identical(other.avgSpeed, avgSpeed) || other.avgSpeed == avgSpeed)&&(identical(other.maxSpeed, maxSpeed) || other.maxSpeed == maxSpeed)&&(identical(other.length, length) || other.length == length)&&(identical(other.endAddress, endAddress) || other.endAddress == endAddress)&&(identical(other.startAddress, startAddress) || other.startAddress == startAddress)&&(identical(other.bounds, bounds) || other.bounds == bounds)&&(identical(other.type, type) || other.type == type)&&(identical(other.points, points) || other.points == points)&&const DeepCollectionEquality().equals(other.pointsList, pointsList));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,startDate,endDate,avgSpeed,maxSpeed,length,endAddress,startAddress,bounds,type,points,const DeepCollectionEquality().hash(pointsList));

@override
String toString() {
  return 'Trip(id: $id, startDate: $startDate, endDate: $endDate, avgSpeed: $avgSpeed, maxSpeed: $maxSpeed, length: $length, endAddress: $endAddress, startAddress: $startAddress, bounds: $bounds, type: $type, points: $points, pointsList: $pointsList)';
}


}

/// @nodoc
abstract mixin class $TripCopyWith<$Res>  {
  factory $TripCopyWith(Trip value, $Res Function(Trip) _then) = _$TripCopyWithImpl;
@useResult
$Res call({
@FlexibleIntConverter() int? id,@JsonKey(name: 'start_date') String? startDate,@JsonKey(name: 'end_date') String? endDate,@JsonKey(name: 'avg_speed')@FlexibleDoubleConverter() double? avgSpeed,@JsonKey(name: 'max_speed')@FlexibleDoubleConverter() double? maxSpeed,@FlexibleDoubleConverter() double? length,@JsonKey(name: 'end_address') String? endAddress,@JsonKey(name: 'start_address') String? startAddress, TripBounds? bounds, String? type,@FlexibleIntConverter() int? points,@JsonKey(name: 'points_list', fromJson: _pointsFromJson, toJson: _pointsToJson) List<TripPoint> pointsList
});


$TripBoundsCopyWith<$Res>? get bounds;

}
/// @nodoc
class _$TripCopyWithImpl<$Res>
    implements $TripCopyWith<$Res> {
  _$TripCopyWithImpl(this._self, this._then);

  final Trip _self;
  final $Res Function(Trip) _then;

/// Create a copy of Trip
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = freezed,Object? startDate = freezed,Object? endDate = freezed,Object? avgSpeed = freezed,Object? maxSpeed = freezed,Object? length = freezed,Object? endAddress = freezed,Object? startAddress = freezed,Object? bounds = freezed,Object? type = freezed,Object? points = freezed,Object? pointsList = null,}) {
  return _then(_self.copyWith(
id: freezed == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int?,startDate: freezed == startDate ? _self.startDate : startDate // ignore: cast_nullable_to_non_nullable
as String?,endDate: freezed == endDate ? _self.endDate : endDate // ignore: cast_nullable_to_non_nullable
as String?,avgSpeed: freezed == avgSpeed ? _self.avgSpeed : avgSpeed // ignore: cast_nullable_to_non_nullable
as double?,maxSpeed: freezed == maxSpeed ? _self.maxSpeed : maxSpeed // ignore: cast_nullable_to_non_nullable
as double?,length: freezed == length ? _self.length : length // ignore: cast_nullable_to_non_nullable
as double?,endAddress: freezed == endAddress ? _self.endAddress : endAddress // ignore: cast_nullable_to_non_nullable
as String?,startAddress: freezed == startAddress ? _self.startAddress : startAddress // ignore: cast_nullable_to_non_nullable
as String?,bounds: freezed == bounds ? _self.bounds : bounds // ignore: cast_nullable_to_non_nullable
as TripBounds?,type: freezed == type ? _self.type : type // ignore: cast_nullable_to_non_nullable
as String?,points: freezed == points ? _self.points : points // ignore: cast_nullable_to_non_nullable
as int?,pointsList: null == pointsList ? _self.pointsList : pointsList // ignore: cast_nullable_to_non_nullable
as List<TripPoint>,
  ));
}
/// Create a copy of Trip
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$TripBoundsCopyWith<$Res>? get bounds {
    if (_self.bounds == null) {
    return null;
  }

  return $TripBoundsCopyWith<$Res>(_self.bounds!, (value) {
    return _then(_self.copyWith(bounds: value));
  });
}
}


/// Adds pattern-matching-related methods to [Trip].
extension TripPatterns on Trip {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _Trip value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _Trip() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _Trip value)  $default,){
final _that = this;
switch (_that) {
case _Trip():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _Trip value)?  $default,){
final _that = this;
switch (_that) {
case _Trip() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function(@FlexibleIntConverter()  int? id, @JsonKey(name: 'start_date')  String? startDate, @JsonKey(name: 'end_date')  String? endDate, @JsonKey(name: 'avg_speed')@FlexibleDoubleConverter()  double? avgSpeed, @JsonKey(name: 'max_speed')@FlexibleDoubleConverter()  double? maxSpeed, @FlexibleDoubleConverter()  double? length, @JsonKey(name: 'end_address')  String? endAddress, @JsonKey(name: 'start_address')  String? startAddress,  TripBounds? bounds,  String? type, @FlexibleIntConverter()  int? points, @JsonKey(name: 'points_list', fromJson: _pointsFromJson, toJson: _pointsToJson)  List<TripPoint> pointsList)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _Trip() when $default != null:
return $default(_that.id,_that.startDate,_that.endDate,_that.avgSpeed,_that.maxSpeed,_that.length,_that.endAddress,_that.startAddress,_that.bounds,_that.type,_that.points,_that.pointsList);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function(@FlexibleIntConverter()  int? id, @JsonKey(name: 'start_date')  String? startDate, @JsonKey(name: 'end_date')  String? endDate, @JsonKey(name: 'avg_speed')@FlexibleDoubleConverter()  double? avgSpeed, @JsonKey(name: 'max_speed')@FlexibleDoubleConverter()  double? maxSpeed, @FlexibleDoubleConverter()  double? length, @JsonKey(name: 'end_address')  String? endAddress, @JsonKey(name: 'start_address')  String? startAddress,  TripBounds? bounds,  String? type, @FlexibleIntConverter()  int? points, @JsonKey(name: 'points_list', fromJson: _pointsFromJson, toJson: _pointsToJson)  List<TripPoint> pointsList)  $default,) {final _that = this;
switch (_that) {
case _Trip():
return $default(_that.id,_that.startDate,_that.endDate,_that.avgSpeed,_that.maxSpeed,_that.length,_that.endAddress,_that.startAddress,_that.bounds,_that.type,_that.points,_that.pointsList);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function(@FlexibleIntConverter()  int? id, @JsonKey(name: 'start_date')  String? startDate, @JsonKey(name: 'end_date')  String? endDate, @JsonKey(name: 'avg_speed')@FlexibleDoubleConverter()  double? avgSpeed, @JsonKey(name: 'max_speed')@FlexibleDoubleConverter()  double? maxSpeed, @FlexibleDoubleConverter()  double? length, @JsonKey(name: 'end_address')  String? endAddress, @JsonKey(name: 'start_address')  String? startAddress,  TripBounds? bounds,  String? type, @FlexibleIntConverter()  int? points, @JsonKey(name: 'points_list', fromJson: _pointsFromJson, toJson: _pointsToJson)  List<TripPoint> pointsList)?  $default,) {final _that = this;
switch (_that) {
case _Trip() when $default != null:
return $default(_that.id,_that.startDate,_that.endDate,_that.avgSpeed,_that.maxSpeed,_that.length,_that.endAddress,_that.startAddress,_that.bounds,_that.type,_that.points,_that.pointsList);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _Trip implements Trip {
  const _Trip({@FlexibleIntConverter() this.id, @JsonKey(name: 'start_date') this.startDate, @JsonKey(name: 'end_date') this.endDate, @JsonKey(name: 'avg_speed')@FlexibleDoubleConverter() this.avgSpeed, @JsonKey(name: 'max_speed')@FlexibleDoubleConverter() this.maxSpeed, @FlexibleDoubleConverter() this.length, @JsonKey(name: 'end_address') this.endAddress, @JsonKey(name: 'start_address') this.startAddress, this.bounds, this.type, @FlexibleIntConverter() this.points, @JsonKey(name: 'points_list', fromJson: _pointsFromJson, toJson: _pointsToJson) final  List<TripPoint> pointsList = const <TripPoint>[]}): _pointsList = pointsList;
  factory _Trip.fromJson(Map<String, dynamic> json) => _$TripFromJson(json);

@override@FlexibleIntConverter() final  int? id;
@override@JsonKey(name: 'start_date') final  String? startDate;
@override@JsonKey(name: 'end_date') final  String? endDate;
@override@JsonKey(name: 'avg_speed')@FlexibleDoubleConverter() final  double? avgSpeed;
@override@JsonKey(name: 'max_speed')@FlexibleDoubleConverter() final  double? maxSpeed;
@override@FlexibleDoubleConverter() final  double? length;
@override@JsonKey(name: 'end_address') final  String? endAddress;
@override@JsonKey(name: 'start_address') final  String? startAddress;
@override final  TripBounds? bounds;
@override final  String? type;
@override@FlexibleIntConverter() final  int? points;
 final  List<TripPoint> _pointsList;
@override@JsonKey(name: 'points_list', fromJson: _pointsFromJson, toJson: _pointsToJson) List<TripPoint> get pointsList {
  if (_pointsList is EqualUnmodifiableListView) return _pointsList;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_pointsList);
}


/// Create a copy of Trip
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$TripCopyWith<_Trip> get copyWith => __$TripCopyWithImpl<_Trip>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$TripToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Trip&&(identical(other.id, id) || other.id == id)&&(identical(other.startDate, startDate) || other.startDate == startDate)&&(identical(other.endDate, endDate) || other.endDate == endDate)&&(identical(other.avgSpeed, avgSpeed) || other.avgSpeed == avgSpeed)&&(identical(other.maxSpeed, maxSpeed) || other.maxSpeed == maxSpeed)&&(identical(other.length, length) || other.length == length)&&(identical(other.endAddress, endAddress) || other.endAddress == endAddress)&&(identical(other.startAddress, startAddress) || other.startAddress == startAddress)&&(identical(other.bounds, bounds) || other.bounds == bounds)&&(identical(other.type, type) || other.type == type)&&(identical(other.points, points) || other.points == points)&&const DeepCollectionEquality().equals(other._pointsList, _pointsList));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,startDate,endDate,avgSpeed,maxSpeed,length,endAddress,startAddress,bounds,type,points,const DeepCollectionEquality().hash(_pointsList));

@override
String toString() {
  return 'Trip(id: $id, startDate: $startDate, endDate: $endDate, avgSpeed: $avgSpeed, maxSpeed: $maxSpeed, length: $length, endAddress: $endAddress, startAddress: $startAddress, bounds: $bounds, type: $type, points: $points, pointsList: $pointsList)';
}


}

/// @nodoc
abstract mixin class _$TripCopyWith<$Res> implements $TripCopyWith<$Res> {
  factory _$TripCopyWith(_Trip value, $Res Function(_Trip) _then) = __$TripCopyWithImpl;
@override @useResult
$Res call({
@FlexibleIntConverter() int? id,@JsonKey(name: 'start_date') String? startDate,@JsonKey(name: 'end_date') String? endDate,@JsonKey(name: 'avg_speed')@FlexibleDoubleConverter() double? avgSpeed,@JsonKey(name: 'max_speed')@FlexibleDoubleConverter() double? maxSpeed,@FlexibleDoubleConverter() double? length,@JsonKey(name: 'end_address') String? endAddress,@JsonKey(name: 'start_address') String? startAddress, TripBounds? bounds, String? type,@FlexibleIntConverter() int? points,@JsonKey(name: 'points_list', fromJson: _pointsFromJson, toJson: _pointsToJson) List<TripPoint> pointsList
});


@override $TripBoundsCopyWith<$Res>? get bounds;

}
/// @nodoc
class __$TripCopyWithImpl<$Res>
    implements _$TripCopyWith<$Res> {
  __$TripCopyWithImpl(this._self, this._then);

  final _Trip _self;
  final $Res Function(_Trip) _then;

/// Create a copy of Trip
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = freezed,Object? startDate = freezed,Object? endDate = freezed,Object? avgSpeed = freezed,Object? maxSpeed = freezed,Object? length = freezed,Object? endAddress = freezed,Object? startAddress = freezed,Object? bounds = freezed,Object? type = freezed,Object? points = freezed,Object? pointsList = null,}) {
  return _then(_Trip(
id: freezed == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int?,startDate: freezed == startDate ? _self.startDate : startDate // ignore: cast_nullable_to_non_nullable
as String?,endDate: freezed == endDate ? _self.endDate : endDate // ignore: cast_nullable_to_non_nullable
as String?,avgSpeed: freezed == avgSpeed ? _self.avgSpeed : avgSpeed // ignore: cast_nullable_to_non_nullable
as double?,maxSpeed: freezed == maxSpeed ? _self.maxSpeed : maxSpeed // ignore: cast_nullable_to_non_nullable
as double?,length: freezed == length ? _self.length : length // ignore: cast_nullable_to_non_nullable
as double?,endAddress: freezed == endAddress ? _self.endAddress : endAddress // ignore: cast_nullable_to_non_nullable
as String?,startAddress: freezed == startAddress ? _self.startAddress : startAddress // ignore: cast_nullable_to_non_nullable
as String?,bounds: freezed == bounds ? _self.bounds : bounds // ignore: cast_nullable_to_non_nullable
as TripBounds?,type: freezed == type ? _self.type : type // ignore: cast_nullable_to_non_nullable
as String?,points: freezed == points ? _self.points : points // ignore: cast_nullable_to_non_nullable
as int?,pointsList: null == pointsList ? _self._pointsList : pointsList // ignore: cast_nullable_to_non_nullable
as List<TripPoint>,
  ));
}

/// Create a copy of Trip
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$TripBoundsCopyWith<$Res>? get bounds {
    if (_self.bounds == null) {
    return null;
  }

  return $TripBoundsCopyWith<$Res>(_self.bounds!, (value) {
    return _then(_self.copyWith(bounds: value));
  });
}
}


/// @nodoc
mixin _$TripListResponse {

 List<Trip> get list;
/// Create a copy of TripListResponse
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$TripListResponseCopyWith<TripListResponse> get copyWith => _$TripListResponseCopyWithImpl<TripListResponse>(this as TripListResponse, _$identity);

  /// Serializes this TripListResponse to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is TripListResponse&&const DeepCollectionEquality().equals(other.list, list));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(list));

@override
String toString() {
  return 'TripListResponse(list: $list)';
}


}

/// @nodoc
abstract mixin class $TripListResponseCopyWith<$Res>  {
  factory $TripListResponseCopyWith(TripListResponse value, $Res Function(TripListResponse) _then) = _$TripListResponseCopyWithImpl;
@useResult
$Res call({
 List<Trip> list
});




}
/// @nodoc
class _$TripListResponseCopyWithImpl<$Res>
    implements $TripListResponseCopyWith<$Res> {
  _$TripListResponseCopyWithImpl(this._self, this._then);

  final TripListResponse _self;
  final $Res Function(TripListResponse) _then;

/// Create a copy of TripListResponse
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? list = null,}) {
  return _then(_self.copyWith(
list: null == list ? _self.list : list // ignore: cast_nullable_to_non_nullable
as List<Trip>,
  ));
}

}


/// Adds pattern-matching-related methods to [TripListResponse].
extension TripListResponsePatterns on TripListResponse {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _TripListResponse value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _TripListResponse() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _TripListResponse value)  $default,){
final _that = this;
switch (_that) {
case _TripListResponse():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _TripListResponse value)?  $default,){
final _that = this;
switch (_that) {
case _TripListResponse() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( List<Trip> list)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _TripListResponse() when $default != null:
return $default(_that.list);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( List<Trip> list)  $default,) {final _that = this;
switch (_that) {
case _TripListResponse():
return $default(_that.list);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( List<Trip> list)?  $default,) {final _that = this;
switch (_that) {
case _TripListResponse() when $default != null:
return $default(_that.list);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _TripListResponse implements TripListResponse {
  const _TripListResponse({final  List<Trip> list = const <Trip>[]}): _list = list;
  factory _TripListResponse.fromJson(Map<String, dynamic> json) => _$TripListResponseFromJson(json);

 final  List<Trip> _list;
@override@JsonKey() List<Trip> get list {
  if (_list is EqualUnmodifiableListView) return _list;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_list);
}


/// Create a copy of TripListResponse
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$TripListResponseCopyWith<_TripListResponse> get copyWith => __$TripListResponseCopyWithImpl<_TripListResponse>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$TripListResponseToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _TripListResponse&&const DeepCollectionEquality().equals(other._list, _list));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(_list));

@override
String toString() {
  return 'TripListResponse(list: $list)';
}


}

/// @nodoc
abstract mixin class _$TripListResponseCopyWith<$Res> implements $TripListResponseCopyWith<$Res> {
  factory _$TripListResponseCopyWith(_TripListResponse value, $Res Function(_TripListResponse) _then) = __$TripListResponseCopyWithImpl;
@override @useResult
$Res call({
 List<Trip> list
});




}
/// @nodoc
class __$TripListResponseCopyWithImpl<$Res>
    implements _$TripListResponseCopyWith<$Res> {
  __$TripListResponseCopyWithImpl(this._self, this._then);

  final _TripListResponse _self;
  final $Res Function(_TripListResponse) _then;

/// Create a copy of TripListResponse
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? list = null,}) {
  return _then(_TripListResponse(
list: null == list ? _self._list : list // ignore: cast_nullable_to_non_nullable
as List<Trip>,
  ));
}


}

// dart format on
