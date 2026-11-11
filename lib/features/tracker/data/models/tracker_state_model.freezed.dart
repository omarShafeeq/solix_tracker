// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'tracker_state_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$GpsLocation {

@FlexibleDoubleConverter() double? get lat;@FlexibleDoubleConverter() double? get lng;
/// Create a copy of GpsLocation
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$GpsLocationCopyWith<GpsLocation> get copyWith => _$GpsLocationCopyWithImpl<GpsLocation>(this as GpsLocation, _$identity);

  /// Serializes this GpsLocation to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is GpsLocation&&(identical(other.lat, lat) || other.lat == lat)&&(identical(other.lng, lng) || other.lng == lng));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,lat,lng);

@override
String toString() {
  return 'GpsLocation(lat: $lat, lng: $lng)';
}


}

/// @nodoc
abstract mixin class $GpsLocationCopyWith<$Res>  {
  factory $GpsLocationCopyWith(GpsLocation value, $Res Function(GpsLocation) _then) = _$GpsLocationCopyWithImpl;
@useResult
$Res call({
@FlexibleDoubleConverter() double? lat,@FlexibleDoubleConverter() double? lng
});




}
/// @nodoc
class _$GpsLocationCopyWithImpl<$Res>
    implements $GpsLocationCopyWith<$Res> {
  _$GpsLocationCopyWithImpl(this._self, this._then);

  final GpsLocation _self;
  final $Res Function(GpsLocation) _then;

/// Create a copy of GpsLocation
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? lat = freezed,Object? lng = freezed,}) {
  return _then(_self.copyWith(
lat: freezed == lat ? _self.lat : lat // ignore: cast_nullable_to_non_nullable
as double?,lng: freezed == lng ? _self.lng : lng // ignore: cast_nullable_to_non_nullable
as double?,
  ));
}

}


/// Adds pattern-matching-related methods to [GpsLocation].
extension GpsLocationPatterns on GpsLocation {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _GpsLocation value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _GpsLocation() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _GpsLocation value)  $default,){
final _that = this;
switch (_that) {
case _GpsLocation():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _GpsLocation value)?  $default,){
final _that = this;
switch (_that) {
case _GpsLocation() when $default != null:
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
case _GpsLocation() when $default != null:
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
case _GpsLocation():
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
case _GpsLocation() when $default != null:
return $default(_that.lat,_that.lng);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _GpsLocation implements GpsLocation {
  const _GpsLocation({@FlexibleDoubleConverter() this.lat, @FlexibleDoubleConverter() this.lng});
  factory _GpsLocation.fromJson(Map<String, dynamic> json) => _$GpsLocationFromJson(json);

@override@FlexibleDoubleConverter() final  double? lat;
@override@FlexibleDoubleConverter() final  double? lng;

/// Create a copy of GpsLocation
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$GpsLocationCopyWith<_GpsLocation> get copyWith => __$GpsLocationCopyWithImpl<_GpsLocation>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$GpsLocationToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _GpsLocation&&(identical(other.lat, lat) || other.lat == lat)&&(identical(other.lng, lng) || other.lng == lng));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,lat,lng);

@override
String toString() {
  return 'GpsLocation(lat: $lat, lng: $lng)';
}


}

/// @nodoc
abstract mixin class _$GpsLocationCopyWith<$Res> implements $GpsLocationCopyWith<$Res> {
  factory _$GpsLocationCopyWith(_GpsLocation value, $Res Function(_GpsLocation) _then) = __$GpsLocationCopyWithImpl;
@override @useResult
$Res call({
@FlexibleDoubleConverter() double? lat,@FlexibleDoubleConverter() double? lng
});




}
/// @nodoc
class __$GpsLocationCopyWithImpl<$Res>
    implements _$GpsLocationCopyWith<$Res> {
  __$GpsLocationCopyWithImpl(this._self, this._then);

  final _GpsLocation _self;
  final $Res Function(_GpsLocation) _then;

/// Create a copy of GpsLocation
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? lat = freezed,Object? lng = freezed,}) {
  return _then(_GpsLocation(
lat: freezed == lat ? _self.lat : lat // ignore: cast_nullable_to_non_nullable
as double?,lng: freezed == lng ? _self.lng : lng // ignore: cast_nullable_to_non_nullable
as double?,
  ));
}


}


/// @nodoc
mixin _$GpsData {

 String? get updated;@JsonKey(name: 'signal_level')@FlexibleIntConverter() int? get signalLevel; GpsLocation? get location;@FlexibleDoubleConverter() double? get heading;@FlexibleDoubleConverter() double? get speed;@FlexibleDoubleConverter() double? get alt;
/// Create a copy of GpsData
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$GpsDataCopyWith<GpsData> get copyWith => _$GpsDataCopyWithImpl<GpsData>(this as GpsData, _$identity);

  /// Serializes this GpsData to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is GpsData&&(identical(other.updated, updated) || other.updated == updated)&&(identical(other.signalLevel, signalLevel) || other.signalLevel == signalLevel)&&(identical(other.location, location) || other.location == location)&&(identical(other.heading, heading) || other.heading == heading)&&(identical(other.speed, speed) || other.speed == speed)&&(identical(other.alt, alt) || other.alt == alt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,updated,signalLevel,location,heading,speed,alt);

@override
String toString() {
  return 'GpsData(updated: $updated, signalLevel: $signalLevel, location: $location, heading: $heading, speed: $speed, alt: $alt)';
}


}

/// @nodoc
abstract mixin class $GpsDataCopyWith<$Res>  {
  factory $GpsDataCopyWith(GpsData value, $Res Function(GpsData) _then) = _$GpsDataCopyWithImpl;
@useResult
$Res call({
 String? updated,@JsonKey(name: 'signal_level')@FlexibleIntConverter() int? signalLevel, GpsLocation? location,@FlexibleDoubleConverter() double? heading,@FlexibleDoubleConverter() double? speed,@FlexibleDoubleConverter() double? alt
});


$GpsLocationCopyWith<$Res>? get location;

}
/// @nodoc
class _$GpsDataCopyWithImpl<$Res>
    implements $GpsDataCopyWith<$Res> {
  _$GpsDataCopyWithImpl(this._self, this._then);

  final GpsData _self;
  final $Res Function(GpsData) _then;

/// Create a copy of GpsData
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? updated = freezed,Object? signalLevel = freezed,Object? location = freezed,Object? heading = freezed,Object? speed = freezed,Object? alt = freezed,}) {
  return _then(_self.copyWith(
updated: freezed == updated ? _self.updated : updated // ignore: cast_nullable_to_non_nullable
as String?,signalLevel: freezed == signalLevel ? _self.signalLevel : signalLevel // ignore: cast_nullable_to_non_nullable
as int?,location: freezed == location ? _self.location : location // ignore: cast_nullable_to_non_nullable
as GpsLocation?,heading: freezed == heading ? _self.heading : heading // ignore: cast_nullable_to_non_nullable
as double?,speed: freezed == speed ? _self.speed : speed // ignore: cast_nullable_to_non_nullable
as double?,alt: freezed == alt ? _self.alt : alt // ignore: cast_nullable_to_non_nullable
as double?,
  ));
}
/// Create a copy of GpsData
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$GpsLocationCopyWith<$Res>? get location {
    if (_self.location == null) {
    return null;
  }

  return $GpsLocationCopyWith<$Res>(_self.location!, (value) {
    return _then(_self.copyWith(location: value));
  });
}
}


/// Adds pattern-matching-related methods to [GpsData].
extension GpsDataPatterns on GpsData {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _GpsData value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _GpsData() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _GpsData value)  $default,){
final _that = this;
switch (_that) {
case _GpsData():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _GpsData value)?  $default,){
final _that = this;
switch (_that) {
case _GpsData() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String? updated, @JsonKey(name: 'signal_level')@FlexibleIntConverter()  int? signalLevel,  GpsLocation? location, @FlexibleDoubleConverter()  double? heading, @FlexibleDoubleConverter()  double? speed, @FlexibleDoubleConverter()  double? alt)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _GpsData() when $default != null:
return $default(_that.updated,_that.signalLevel,_that.location,_that.heading,_that.speed,_that.alt);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String? updated, @JsonKey(name: 'signal_level')@FlexibleIntConverter()  int? signalLevel,  GpsLocation? location, @FlexibleDoubleConverter()  double? heading, @FlexibleDoubleConverter()  double? speed, @FlexibleDoubleConverter()  double? alt)  $default,) {final _that = this;
switch (_that) {
case _GpsData():
return $default(_that.updated,_that.signalLevel,_that.location,_that.heading,_that.speed,_that.alt);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String? updated, @JsonKey(name: 'signal_level')@FlexibleIntConverter()  int? signalLevel,  GpsLocation? location, @FlexibleDoubleConverter()  double? heading, @FlexibleDoubleConverter()  double? speed, @FlexibleDoubleConverter()  double? alt)?  $default,) {final _that = this;
switch (_that) {
case _GpsData() when $default != null:
return $default(_that.updated,_that.signalLevel,_that.location,_that.heading,_that.speed,_that.alt);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _GpsData implements GpsData {
  const _GpsData({this.updated, @JsonKey(name: 'signal_level')@FlexibleIntConverter() this.signalLevel, this.location, @FlexibleDoubleConverter() this.heading, @FlexibleDoubleConverter() this.speed, @FlexibleDoubleConverter() this.alt});
  factory _GpsData.fromJson(Map<String, dynamic> json) => _$GpsDataFromJson(json);

@override final  String? updated;
@override@JsonKey(name: 'signal_level')@FlexibleIntConverter() final  int? signalLevel;
@override final  GpsLocation? location;
@override@FlexibleDoubleConverter() final  double? heading;
@override@FlexibleDoubleConverter() final  double? speed;
@override@FlexibleDoubleConverter() final  double? alt;

/// Create a copy of GpsData
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$GpsDataCopyWith<_GpsData> get copyWith => __$GpsDataCopyWithImpl<_GpsData>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$GpsDataToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _GpsData&&(identical(other.updated, updated) || other.updated == updated)&&(identical(other.signalLevel, signalLevel) || other.signalLevel == signalLevel)&&(identical(other.location, location) || other.location == location)&&(identical(other.heading, heading) || other.heading == heading)&&(identical(other.speed, speed) || other.speed == speed)&&(identical(other.alt, alt) || other.alt == alt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,updated,signalLevel,location,heading,speed,alt);

@override
String toString() {
  return 'GpsData(updated: $updated, signalLevel: $signalLevel, location: $location, heading: $heading, speed: $speed, alt: $alt)';
}


}

/// @nodoc
abstract mixin class _$GpsDataCopyWith<$Res> implements $GpsDataCopyWith<$Res> {
  factory _$GpsDataCopyWith(_GpsData value, $Res Function(_GpsData) _then) = __$GpsDataCopyWithImpl;
@override @useResult
$Res call({
 String? updated,@JsonKey(name: 'signal_level')@FlexibleIntConverter() int? signalLevel, GpsLocation? location,@FlexibleDoubleConverter() double? heading,@FlexibleDoubleConverter() double? speed,@FlexibleDoubleConverter() double? alt
});


@override $GpsLocationCopyWith<$Res>? get location;

}
/// @nodoc
class __$GpsDataCopyWithImpl<$Res>
    implements _$GpsDataCopyWith<$Res> {
  __$GpsDataCopyWithImpl(this._self, this._then);

  final _GpsData _self;
  final $Res Function(_GpsData) _then;

/// Create a copy of GpsData
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? updated = freezed,Object? signalLevel = freezed,Object? location = freezed,Object? heading = freezed,Object? speed = freezed,Object? alt = freezed,}) {
  return _then(_GpsData(
updated: freezed == updated ? _self.updated : updated // ignore: cast_nullable_to_non_nullable
as String?,signalLevel: freezed == signalLevel ? _self.signalLevel : signalLevel // ignore: cast_nullable_to_non_nullable
as int?,location: freezed == location ? _self.location : location // ignore: cast_nullable_to_non_nullable
as GpsLocation?,heading: freezed == heading ? _self.heading : heading // ignore: cast_nullable_to_non_nullable
as double?,speed: freezed == speed ? _self.speed : speed // ignore: cast_nullable_to_non_nullable
as double?,alt: freezed == alt ? _self.alt : alt // ignore: cast_nullable_to_non_nullable
as double?,
  ));
}

/// Create a copy of GpsData
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$GpsLocationCopyWith<$Res>? get location {
    if (_self.location == null) {
    return null;
  }

  return $GpsLocationCopyWith<$Res>(_self.location!, (value) {
    return _then(_self.copyWith(location: value));
  });
}
}


/// @nodoc
mixin _$GsmData {

 String? get updated;@JsonKey(name: 'signal_level')@FlexibleIntConverter() int? get signalLevel;@JsonKey(name: 'network_name') String? get networkName; bool? get roaming;
/// Create a copy of GsmData
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$GsmDataCopyWith<GsmData> get copyWith => _$GsmDataCopyWithImpl<GsmData>(this as GsmData, _$identity);

  /// Serializes this GsmData to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is GsmData&&(identical(other.updated, updated) || other.updated == updated)&&(identical(other.signalLevel, signalLevel) || other.signalLevel == signalLevel)&&(identical(other.networkName, networkName) || other.networkName == networkName)&&(identical(other.roaming, roaming) || other.roaming == roaming));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,updated,signalLevel,networkName,roaming);

@override
String toString() {
  return 'GsmData(updated: $updated, signalLevel: $signalLevel, networkName: $networkName, roaming: $roaming)';
}


}

/// @nodoc
abstract mixin class $GsmDataCopyWith<$Res>  {
  factory $GsmDataCopyWith(GsmData value, $Res Function(GsmData) _then) = _$GsmDataCopyWithImpl;
@useResult
$Res call({
 String? updated,@JsonKey(name: 'signal_level')@FlexibleIntConverter() int? signalLevel,@JsonKey(name: 'network_name') String? networkName, bool? roaming
});




}
/// @nodoc
class _$GsmDataCopyWithImpl<$Res>
    implements $GsmDataCopyWith<$Res> {
  _$GsmDataCopyWithImpl(this._self, this._then);

  final GsmData _self;
  final $Res Function(GsmData) _then;

/// Create a copy of GsmData
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? updated = freezed,Object? signalLevel = freezed,Object? networkName = freezed,Object? roaming = freezed,}) {
  return _then(_self.copyWith(
updated: freezed == updated ? _self.updated : updated // ignore: cast_nullable_to_non_nullable
as String?,signalLevel: freezed == signalLevel ? _self.signalLevel : signalLevel // ignore: cast_nullable_to_non_nullable
as int?,networkName: freezed == networkName ? _self.networkName : networkName // ignore: cast_nullable_to_non_nullable
as String?,roaming: freezed == roaming ? _self.roaming : roaming // ignore: cast_nullable_to_non_nullable
as bool?,
  ));
}

}


/// Adds pattern-matching-related methods to [GsmData].
extension GsmDataPatterns on GsmData {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _GsmData value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _GsmData() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _GsmData value)  $default,){
final _that = this;
switch (_that) {
case _GsmData():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _GsmData value)?  $default,){
final _that = this;
switch (_that) {
case _GsmData() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String? updated, @JsonKey(name: 'signal_level')@FlexibleIntConverter()  int? signalLevel, @JsonKey(name: 'network_name')  String? networkName,  bool? roaming)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _GsmData() when $default != null:
return $default(_that.updated,_that.signalLevel,_that.networkName,_that.roaming);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String? updated, @JsonKey(name: 'signal_level')@FlexibleIntConverter()  int? signalLevel, @JsonKey(name: 'network_name')  String? networkName,  bool? roaming)  $default,) {final _that = this;
switch (_that) {
case _GsmData():
return $default(_that.updated,_that.signalLevel,_that.networkName,_that.roaming);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String? updated, @JsonKey(name: 'signal_level')@FlexibleIntConverter()  int? signalLevel, @JsonKey(name: 'network_name')  String? networkName,  bool? roaming)?  $default,) {final _that = this;
switch (_that) {
case _GsmData() when $default != null:
return $default(_that.updated,_that.signalLevel,_that.networkName,_that.roaming);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _GsmData implements GsmData {
  const _GsmData({this.updated, @JsonKey(name: 'signal_level')@FlexibleIntConverter() this.signalLevel, @JsonKey(name: 'network_name') this.networkName, this.roaming});
  factory _GsmData.fromJson(Map<String, dynamic> json) => _$GsmDataFromJson(json);

@override final  String? updated;
@override@JsonKey(name: 'signal_level')@FlexibleIntConverter() final  int? signalLevel;
@override@JsonKey(name: 'network_name') final  String? networkName;
@override final  bool? roaming;

/// Create a copy of GsmData
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$GsmDataCopyWith<_GsmData> get copyWith => __$GsmDataCopyWithImpl<_GsmData>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$GsmDataToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _GsmData&&(identical(other.updated, updated) || other.updated == updated)&&(identical(other.signalLevel, signalLevel) || other.signalLevel == signalLevel)&&(identical(other.networkName, networkName) || other.networkName == networkName)&&(identical(other.roaming, roaming) || other.roaming == roaming));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,updated,signalLevel,networkName,roaming);

@override
String toString() {
  return 'GsmData(updated: $updated, signalLevel: $signalLevel, networkName: $networkName, roaming: $roaming)';
}


}

/// @nodoc
abstract mixin class _$GsmDataCopyWith<$Res> implements $GsmDataCopyWith<$Res> {
  factory _$GsmDataCopyWith(_GsmData value, $Res Function(_GsmData) _then) = __$GsmDataCopyWithImpl;
@override @useResult
$Res call({
 String? updated,@JsonKey(name: 'signal_level')@FlexibleIntConverter() int? signalLevel,@JsonKey(name: 'network_name') String? networkName, bool? roaming
});




}
/// @nodoc
class __$GsmDataCopyWithImpl<$Res>
    implements _$GsmDataCopyWith<$Res> {
  __$GsmDataCopyWithImpl(this._self, this._then);

  final _GsmData _self;
  final $Res Function(_GsmData) _then;

/// Create a copy of GsmData
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? updated = freezed,Object? signalLevel = freezed,Object? networkName = freezed,Object? roaming = freezed,}) {
  return _then(_GsmData(
updated: freezed == updated ? _self.updated : updated // ignore: cast_nullable_to_non_nullable
as String?,signalLevel: freezed == signalLevel ? _self.signalLevel : signalLevel // ignore: cast_nullable_to_non_nullable
as int?,networkName: freezed == networkName ? _self.networkName : networkName // ignore: cast_nullable_to_non_nullable
as String?,roaming: freezed == roaming ? _self.roaming : roaming // ignore: cast_nullable_to_non_nullable
as bool?,
  ));
}


}


/// @nodoc
mixin _$AdditionalReading {

@JsonKey(fromJson: dynamicToString) String? get value; String? get updated;
/// Create a copy of AdditionalReading
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$AdditionalReadingCopyWith<AdditionalReading> get copyWith => _$AdditionalReadingCopyWithImpl<AdditionalReading>(this as AdditionalReading, _$identity);

  /// Serializes this AdditionalReading to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is AdditionalReading&&(identical(other.value, value) || other.value == value)&&(identical(other.updated, updated) || other.updated == updated));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,value,updated);

@override
String toString() {
  return 'AdditionalReading(value: $value, updated: $updated)';
}


}

/// @nodoc
abstract mixin class $AdditionalReadingCopyWith<$Res>  {
  factory $AdditionalReadingCopyWith(AdditionalReading value, $Res Function(AdditionalReading) _then) = _$AdditionalReadingCopyWithImpl;
@useResult
$Res call({
@JsonKey(fromJson: dynamicToString) String? value, String? updated
});




}
/// @nodoc
class _$AdditionalReadingCopyWithImpl<$Res>
    implements $AdditionalReadingCopyWith<$Res> {
  _$AdditionalReadingCopyWithImpl(this._self, this._then);

  final AdditionalReading _self;
  final $Res Function(AdditionalReading) _then;

/// Create a copy of AdditionalReading
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? value = freezed,Object? updated = freezed,}) {
  return _then(_self.copyWith(
value: freezed == value ? _self.value : value // ignore: cast_nullable_to_non_nullable
as String?,updated: freezed == updated ? _self.updated : updated // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [AdditionalReading].
extension AdditionalReadingPatterns on AdditionalReading {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _AdditionalReading value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _AdditionalReading() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _AdditionalReading value)  $default,){
final _that = this;
switch (_that) {
case _AdditionalReading():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _AdditionalReading value)?  $default,){
final _that = this;
switch (_that) {
case _AdditionalReading() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function(@JsonKey(fromJson: dynamicToString)  String? value,  String? updated)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _AdditionalReading() when $default != null:
return $default(_that.value,_that.updated);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function(@JsonKey(fromJson: dynamicToString)  String? value,  String? updated)  $default,) {final _that = this;
switch (_that) {
case _AdditionalReading():
return $default(_that.value,_that.updated);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function(@JsonKey(fromJson: dynamicToString)  String? value,  String? updated)?  $default,) {final _that = this;
switch (_that) {
case _AdditionalReading() when $default != null:
return $default(_that.value,_that.updated);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _AdditionalReading implements AdditionalReading {
  const _AdditionalReading({@JsonKey(fromJson: dynamicToString) this.value, this.updated});
  factory _AdditionalReading.fromJson(Map<String, dynamic> json) => _$AdditionalReadingFromJson(json);

@override@JsonKey(fromJson: dynamicToString) final  String? value;
@override final  String? updated;

/// Create a copy of AdditionalReading
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$AdditionalReadingCopyWith<_AdditionalReading> get copyWith => __$AdditionalReadingCopyWithImpl<_AdditionalReading>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$AdditionalReadingToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _AdditionalReading&&(identical(other.value, value) || other.value == value)&&(identical(other.updated, updated) || other.updated == updated));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,value,updated);

@override
String toString() {
  return 'AdditionalReading(value: $value, updated: $updated)';
}


}

/// @nodoc
abstract mixin class _$AdditionalReadingCopyWith<$Res> implements $AdditionalReadingCopyWith<$Res> {
  factory _$AdditionalReadingCopyWith(_AdditionalReading value, $Res Function(_AdditionalReading) _then) = __$AdditionalReadingCopyWithImpl;
@override @useResult
$Res call({
@JsonKey(fromJson: dynamicToString) String? value, String? updated
});




}
/// @nodoc
class __$AdditionalReadingCopyWithImpl<$Res>
    implements _$AdditionalReadingCopyWith<$Res> {
  __$AdditionalReadingCopyWithImpl(this._self, this._then);

  final _AdditionalReading _self;
  final $Res Function(_AdditionalReading) _then;

/// Create a copy of AdditionalReading
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? value = freezed,Object? updated = freezed,}) {
  return _then(_AdditionalReading(
value: freezed == value ? _self.value : value // ignore: cast_nullable_to_non_nullable
as String?,updated: freezed == updated ? _self.updated : updated // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}


/// @nodoc
mixin _$TrackerGpsState {

@JsonKey(name: 'source_id')@FlexibleIntConverter() int? get sourceId; GpsData? get gps;@JsonKey(name: 'connection_status') String? get connectionStatus;@JsonKey(name: 'movement_status') String? get movementStatus;@JsonKey(name: 'movement_status_update') String? get movementStatusUpdate; bool? get ignition;@JsonKey(name: 'ignition_update') String? get ignitionUpdate;@JsonKey(fromJson: _boolListFromJson, toJson: _boolListToJson) List<bool> get inputs;@JsonKey(fromJson: _boolListFromJson, toJson: _boolListToJson) List<bool> get outputs;@JsonKey(name: 'last_update') String? get lastUpdate; GsmData? get gsm;@JsonKey(name: 'battery_level')@FlexibleIntConverter() int? get batteryLevel;@JsonKey(name: 'battery_update') String? get batteryUpdate;@JsonKey(fromJson: _additionalFromJson, toJson: _additionalToJson) Map<String, AdditionalReading> get additional;@JsonKey(name: 'actual_track_update') String? get actualTrackUpdate;
/// Create a copy of TrackerGpsState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$TrackerGpsStateCopyWith<TrackerGpsState> get copyWith => _$TrackerGpsStateCopyWithImpl<TrackerGpsState>(this as TrackerGpsState, _$identity);

  /// Serializes this TrackerGpsState to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is TrackerGpsState&&(identical(other.sourceId, sourceId) || other.sourceId == sourceId)&&(identical(other.gps, gps) || other.gps == gps)&&(identical(other.connectionStatus, connectionStatus) || other.connectionStatus == connectionStatus)&&(identical(other.movementStatus, movementStatus) || other.movementStatus == movementStatus)&&(identical(other.movementStatusUpdate, movementStatusUpdate) || other.movementStatusUpdate == movementStatusUpdate)&&(identical(other.ignition, ignition) || other.ignition == ignition)&&(identical(other.ignitionUpdate, ignitionUpdate) || other.ignitionUpdate == ignitionUpdate)&&const DeepCollectionEquality().equals(other.inputs, inputs)&&const DeepCollectionEquality().equals(other.outputs, outputs)&&(identical(other.lastUpdate, lastUpdate) || other.lastUpdate == lastUpdate)&&(identical(other.gsm, gsm) || other.gsm == gsm)&&(identical(other.batteryLevel, batteryLevel) || other.batteryLevel == batteryLevel)&&(identical(other.batteryUpdate, batteryUpdate) || other.batteryUpdate == batteryUpdate)&&const DeepCollectionEquality().equals(other.additional, additional)&&(identical(other.actualTrackUpdate, actualTrackUpdate) || other.actualTrackUpdate == actualTrackUpdate));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,sourceId,gps,connectionStatus,movementStatus,movementStatusUpdate,ignition,ignitionUpdate,const DeepCollectionEquality().hash(inputs),const DeepCollectionEquality().hash(outputs),lastUpdate,gsm,batteryLevel,batteryUpdate,const DeepCollectionEquality().hash(additional),actualTrackUpdate);

@override
String toString() {
  return 'TrackerGpsState(sourceId: $sourceId, gps: $gps, connectionStatus: $connectionStatus, movementStatus: $movementStatus, movementStatusUpdate: $movementStatusUpdate, ignition: $ignition, ignitionUpdate: $ignitionUpdate, inputs: $inputs, outputs: $outputs, lastUpdate: $lastUpdate, gsm: $gsm, batteryLevel: $batteryLevel, batteryUpdate: $batteryUpdate, additional: $additional, actualTrackUpdate: $actualTrackUpdate)';
}


}

/// @nodoc
abstract mixin class $TrackerGpsStateCopyWith<$Res>  {
  factory $TrackerGpsStateCopyWith(TrackerGpsState value, $Res Function(TrackerGpsState) _then) = _$TrackerGpsStateCopyWithImpl;
@useResult
$Res call({
@JsonKey(name: 'source_id')@FlexibleIntConverter() int? sourceId, GpsData? gps,@JsonKey(name: 'connection_status') String? connectionStatus,@JsonKey(name: 'movement_status') String? movementStatus,@JsonKey(name: 'movement_status_update') String? movementStatusUpdate, bool? ignition,@JsonKey(name: 'ignition_update') String? ignitionUpdate,@JsonKey(fromJson: _boolListFromJson, toJson: _boolListToJson) List<bool> inputs,@JsonKey(fromJson: _boolListFromJson, toJson: _boolListToJson) List<bool> outputs,@JsonKey(name: 'last_update') String? lastUpdate, GsmData? gsm,@JsonKey(name: 'battery_level')@FlexibleIntConverter() int? batteryLevel,@JsonKey(name: 'battery_update') String? batteryUpdate,@JsonKey(fromJson: _additionalFromJson, toJson: _additionalToJson) Map<String, AdditionalReading> additional,@JsonKey(name: 'actual_track_update') String? actualTrackUpdate
});


$GpsDataCopyWith<$Res>? get gps;$GsmDataCopyWith<$Res>? get gsm;

}
/// @nodoc
class _$TrackerGpsStateCopyWithImpl<$Res>
    implements $TrackerGpsStateCopyWith<$Res> {
  _$TrackerGpsStateCopyWithImpl(this._self, this._then);

  final TrackerGpsState _self;
  final $Res Function(TrackerGpsState) _then;

/// Create a copy of TrackerGpsState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? sourceId = freezed,Object? gps = freezed,Object? connectionStatus = freezed,Object? movementStatus = freezed,Object? movementStatusUpdate = freezed,Object? ignition = freezed,Object? ignitionUpdate = freezed,Object? inputs = null,Object? outputs = null,Object? lastUpdate = freezed,Object? gsm = freezed,Object? batteryLevel = freezed,Object? batteryUpdate = freezed,Object? additional = null,Object? actualTrackUpdate = freezed,}) {
  return _then(_self.copyWith(
sourceId: freezed == sourceId ? _self.sourceId : sourceId // ignore: cast_nullable_to_non_nullable
as int?,gps: freezed == gps ? _self.gps : gps // ignore: cast_nullable_to_non_nullable
as GpsData?,connectionStatus: freezed == connectionStatus ? _self.connectionStatus : connectionStatus // ignore: cast_nullable_to_non_nullable
as String?,movementStatus: freezed == movementStatus ? _self.movementStatus : movementStatus // ignore: cast_nullable_to_non_nullable
as String?,movementStatusUpdate: freezed == movementStatusUpdate ? _self.movementStatusUpdate : movementStatusUpdate // ignore: cast_nullable_to_non_nullable
as String?,ignition: freezed == ignition ? _self.ignition : ignition // ignore: cast_nullable_to_non_nullable
as bool?,ignitionUpdate: freezed == ignitionUpdate ? _self.ignitionUpdate : ignitionUpdate // ignore: cast_nullable_to_non_nullable
as String?,inputs: null == inputs ? _self.inputs : inputs // ignore: cast_nullable_to_non_nullable
as List<bool>,outputs: null == outputs ? _self.outputs : outputs // ignore: cast_nullable_to_non_nullable
as List<bool>,lastUpdate: freezed == lastUpdate ? _self.lastUpdate : lastUpdate // ignore: cast_nullable_to_non_nullable
as String?,gsm: freezed == gsm ? _self.gsm : gsm // ignore: cast_nullable_to_non_nullable
as GsmData?,batteryLevel: freezed == batteryLevel ? _self.batteryLevel : batteryLevel // ignore: cast_nullable_to_non_nullable
as int?,batteryUpdate: freezed == batteryUpdate ? _self.batteryUpdate : batteryUpdate // ignore: cast_nullable_to_non_nullable
as String?,additional: null == additional ? _self.additional : additional // ignore: cast_nullable_to_non_nullable
as Map<String, AdditionalReading>,actualTrackUpdate: freezed == actualTrackUpdate ? _self.actualTrackUpdate : actualTrackUpdate // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}
/// Create a copy of TrackerGpsState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$GpsDataCopyWith<$Res>? get gps {
    if (_self.gps == null) {
    return null;
  }

  return $GpsDataCopyWith<$Res>(_self.gps!, (value) {
    return _then(_self.copyWith(gps: value));
  });
}/// Create a copy of TrackerGpsState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$GsmDataCopyWith<$Res>? get gsm {
    if (_self.gsm == null) {
    return null;
  }

  return $GsmDataCopyWith<$Res>(_self.gsm!, (value) {
    return _then(_self.copyWith(gsm: value));
  });
}
}


/// Adds pattern-matching-related methods to [TrackerGpsState].
extension TrackerGpsStatePatterns on TrackerGpsState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _TrackerGpsState value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _TrackerGpsState() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _TrackerGpsState value)  $default,){
final _that = this;
switch (_that) {
case _TrackerGpsState():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _TrackerGpsState value)?  $default,){
final _that = this;
switch (_that) {
case _TrackerGpsState() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function(@JsonKey(name: 'source_id')@FlexibleIntConverter()  int? sourceId,  GpsData? gps, @JsonKey(name: 'connection_status')  String? connectionStatus, @JsonKey(name: 'movement_status')  String? movementStatus, @JsonKey(name: 'movement_status_update')  String? movementStatusUpdate,  bool? ignition, @JsonKey(name: 'ignition_update')  String? ignitionUpdate, @JsonKey(fromJson: _boolListFromJson, toJson: _boolListToJson)  List<bool> inputs, @JsonKey(fromJson: _boolListFromJson, toJson: _boolListToJson)  List<bool> outputs, @JsonKey(name: 'last_update')  String? lastUpdate,  GsmData? gsm, @JsonKey(name: 'battery_level')@FlexibleIntConverter()  int? batteryLevel, @JsonKey(name: 'battery_update')  String? batteryUpdate, @JsonKey(fromJson: _additionalFromJson, toJson: _additionalToJson)  Map<String, AdditionalReading> additional, @JsonKey(name: 'actual_track_update')  String? actualTrackUpdate)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _TrackerGpsState() when $default != null:
return $default(_that.sourceId,_that.gps,_that.connectionStatus,_that.movementStatus,_that.movementStatusUpdate,_that.ignition,_that.ignitionUpdate,_that.inputs,_that.outputs,_that.lastUpdate,_that.gsm,_that.batteryLevel,_that.batteryUpdate,_that.additional,_that.actualTrackUpdate);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function(@JsonKey(name: 'source_id')@FlexibleIntConverter()  int? sourceId,  GpsData? gps, @JsonKey(name: 'connection_status')  String? connectionStatus, @JsonKey(name: 'movement_status')  String? movementStatus, @JsonKey(name: 'movement_status_update')  String? movementStatusUpdate,  bool? ignition, @JsonKey(name: 'ignition_update')  String? ignitionUpdate, @JsonKey(fromJson: _boolListFromJson, toJson: _boolListToJson)  List<bool> inputs, @JsonKey(fromJson: _boolListFromJson, toJson: _boolListToJson)  List<bool> outputs, @JsonKey(name: 'last_update')  String? lastUpdate,  GsmData? gsm, @JsonKey(name: 'battery_level')@FlexibleIntConverter()  int? batteryLevel, @JsonKey(name: 'battery_update')  String? batteryUpdate, @JsonKey(fromJson: _additionalFromJson, toJson: _additionalToJson)  Map<String, AdditionalReading> additional, @JsonKey(name: 'actual_track_update')  String? actualTrackUpdate)  $default,) {final _that = this;
switch (_that) {
case _TrackerGpsState():
return $default(_that.sourceId,_that.gps,_that.connectionStatus,_that.movementStatus,_that.movementStatusUpdate,_that.ignition,_that.ignitionUpdate,_that.inputs,_that.outputs,_that.lastUpdate,_that.gsm,_that.batteryLevel,_that.batteryUpdate,_that.additional,_that.actualTrackUpdate);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function(@JsonKey(name: 'source_id')@FlexibleIntConverter()  int? sourceId,  GpsData? gps, @JsonKey(name: 'connection_status')  String? connectionStatus, @JsonKey(name: 'movement_status')  String? movementStatus, @JsonKey(name: 'movement_status_update')  String? movementStatusUpdate,  bool? ignition, @JsonKey(name: 'ignition_update')  String? ignitionUpdate, @JsonKey(fromJson: _boolListFromJson, toJson: _boolListToJson)  List<bool> inputs, @JsonKey(fromJson: _boolListFromJson, toJson: _boolListToJson)  List<bool> outputs, @JsonKey(name: 'last_update')  String? lastUpdate,  GsmData? gsm, @JsonKey(name: 'battery_level')@FlexibleIntConverter()  int? batteryLevel, @JsonKey(name: 'battery_update')  String? batteryUpdate, @JsonKey(fromJson: _additionalFromJson, toJson: _additionalToJson)  Map<String, AdditionalReading> additional, @JsonKey(name: 'actual_track_update')  String? actualTrackUpdate)?  $default,) {final _that = this;
switch (_that) {
case _TrackerGpsState() when $default != null:
return $default(_that.sourceId,_that.gps,_that.connectionStatus,_that.movementStatus,_that.movementStatusUpdate,_that.ignition,_that.ignitionUpdate,_that.inputs,_that.outputs,_that.lastUpdate,_that.gsm,_that.batteryLevel,_that.batteryUpdate,_that.additional,_that.actualTrackUpdate);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _TrackerGpsState implements TrackerGpsState {
  const _TrackerGpsState({@JsonKey(name: 'source_id')@FlexibleIntConverter() this.sourceId, this.gps, @JsonKey(name: 'connection_status') this.connectionStatus, @JsonKey(name: 'movement_status') this.movementStatus, @JsonKey(name: 'movement_status_update') this.movementStatusUpdate, this.ignition, @JsonKey(name: 'ignition_update') this.ignitionUpdate, @JsonKey(fromJson: _boolListFromJson, toJson: _boolListToJson) final  List<bool> inputs = const <bool>[], @JsonKey(fromJson: _boolListFromJson, toJson: _boolListToJson) final  List<bool> outputs = const <bool>[], @JsonKey(name: 'last_update') this.lastUpdate, this.gsm, @JsonKey(name: 'battery_level')@FlexibleIntConverter() this.batteryLevel, @JsonKey(name: 'battery_update') this.batteryUpdate, @JsonKey(fromJson: _additionalFromJson, toJson: _additionalToJson) final  Map<String, AdditionalReading> additional = const <String, AdditionalReading>{}, @JsonKey(name: 'actual_track_update') this.actualTrackUpdate}): _inputs = inputs,_outputs = outputs,_additional = additional;
  factory _TrackerGpsState.fromJson(Map<String, dynamic> json) => _$TrackerGpsStateFromJson(json);

@override@JsonKey(name: 'source_id')@FlexibleIntConverter() final  int? sourceId;
@override final  GpsData? gps;
@override@JsonKey(name: 'connection_status') final  String? connectionStatus;
@override@JsonKey(name: 'movement_status') final  String? movementStatus;
@override@JsonKey(name: 'movement_status_update') final  String? movementStatusUpdate;
@override final  bool? ignition;
@override@JsonKey(name: 'ignition_update') final  String? ignitionUpdate;
 final  List<bool> _inputs;
@override@JsonKey(fromJson: _boolListFromJson, toJson: _boolListToJson) List<bool> get inputs {
  if (_inputs is EqualUnmodifiableListView) return _inputs;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_inputs);
}

 final  List<bool> _outputs;
@override@JsonKey(fromJson: _boolListFromJson, toJson: _boolListToJson) List<bool> get outputs {
  if (_outputs is EqualUnmodifiableListView) return _outputs;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_outputs);
}

@override@JsonKey(name: 'last_update') final  String? lastUpdate;
@override final  GsmData? gsm;
@override@JsonKey(name: 'battery_level')@FlexibleIntConverter() final  int? batteryLevel;
@override@JsonKey(name: 'battery_update') final  String? batteryUpdate;
 final  Map<String, AdditionalReading> _additional;
@override@JsonKey(fromJson: _additionalFromJson, toJson: _additionalToJson) Map<String, AdditionalReading> get additional {
  if (_additional is EqualUnmodifiableMapView) return _additional;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableMapView(_additional);
}

@override@JsonKey(name: 'actual_track_update') final  String? actualTrackUpdate;

/// Create a copy of TrackerGpsState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$TrackerGpsStateCopyWith<_TrackerGpsState> get copyWith => __$TrackerGpsStateCopyWithImpl<_TrackerGpsState>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$TrackerGpsStateToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _TrackerGpsState&&(identical(other.sourceId, sourceId) || other.sourceId == sourceId)&&(identical(other.gps, gps) || other.gps == gps)&&(identical(other.connectionStatus, connectionStatus) || other.connectionStatus == connectionStatus)&&(identical(other.movementStatus, movementStatus) || other.movementStatus == movementStatus)&&(identical(other.movementStatusUpdate, movementStatusUpdate) || other.movementStatusUpdate == movementStatusUpdate)&&(identical(other.ignition, ignition) || other.ignition == ignition)&&(identical(other.ignitionUpdate, ignitionUpdate) || other.ignitionUpdate == ignitionUpdate)&&const DeepCollectionEquality().equals(other._inputs, _inputs)&&const DeepCollectionEquality().equals(other._outputs, _outputs)&&(identical(other.lastUpdate, lastUpdate) || other.lastUpdate == lastUpdate)&&(identical(other.gsm, gsm) || other.gsm == gsm)&&(identical(other.batteryLevel, batteryLevel) || other.batteryLevel == batteryLevel)&&(identical(other.batteryUpdate, batteryUpdate) || other.batteryUpdate == batteryUpdate)&&const DeepCollectionEquality().equals(other._additional, _additional)&&(identical(other.actualTrackUpdate, actualTrackUpdate) || other.actualTrackUpdate == actualTrackUpdate));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,sourceId,gps,connectionStatus,movementStatus,movementStatusUpdate,ignition,ignitionUpdate,const DeepCollectionEquality().hash(_inputs),const DeepCollectionEquality().hash(_outputs),lastUpdate,gsm,batteryLevel,batteryUpdate,const DeepCollectionEquality().hash(_additional),actualTrackUpdate);

@override
String toString() {
  return 'TrackerGpsState(sourceId: $sourceId, gps: $gps, connectionStatus: $connectionStatus, movementStatus: $movementStatus, movementStatusUpdate: $movementStatusUpdate, ignition: $ignition, ignitionUpdate: $ignitionUpdate, inputs: $inputs, outputs: $outputs, lastUpdate: $lastUpdate, gsm: $gsm, batteryLevel: $batteryLevel, batteryUpdate: $batteryUpdate, additional: $additional, actualTrackUpdate: $actualTrackUpdate)';
}


}

/// @nodoc
abstract mixin class _$TrackerGpsStateCopyWith<$Res> implements $TrackerGpsStateCopyWith<$Res> {
  factory _$TrackerGpsStateCopyWith(_TrackerGpsState value, $Res Function(_TrackerGpsState) _then) = __$TrackerGpsStateCopyWithImpl;
@override @useResult
$Res call({
@JsonKey(name: 'source_id')@FlexibleIntConverter() int? sourceId, GpsData? gps,@JsonKey(name: 'connection_status') String? connectionStatus,@JsonKey(name: 'movement_status') String? movementStatus,@JsonKey(name: 'movement_status_update') String? movementStatusUpdate, bool? ignition,@JsonKey(name: 'ignition_update') String? ignitionUpdate,@JsonKey(fromJson: _boolListFromJson, toJson: _boolListToJson) List<bool> inputs,@JsonKey(fromJson: _boolListFromJson, toJson: _boolListToJson) List<bool> outputs,@JsonKey(name: 'last_update') String? lastUpdate, GsmData? gsm,@JsonKey(name: 'battery_level')@FlexibleIntConverter() int? batteryLevel,@JsonKey(name: 'battery_update') String? batteryUpdate,@JsonKey(fromJson: _additionalFromJson, toJson: _additionalToJson) Map<String, AdditionalReading> additional,@JsonKey(name: 'actual_track_update') String? actualTrackUpdate
});


@override $GpsDataCopyWith<$Res>? get gps;@override $GsmDataCopyWith<$Res>? get gsm;

}
/// @nodoc
class __$TrackerGpsStateCopyWithImpl<$Res>
    implements _$TrackerGpsStateCopyWith<$Res> {
  __$TrackerGpsStateCopyWithImpl(this._self, this._then);

  final _TrackerGpsState _self;
  final $Res Function(_TrackerGpsState) _then;

/// Create a copy of TrackerGpsState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? sourceId = freezed,Object? gps = freezed,Object? connectionStatus = freezed,Object? movementStatus = freezed,Object? movementStatusUpdate = freezed,Object? ignition = freezed,Object? ignitionUpdate = freezed,Object? inputs = null,Object? outputs = null,Object? lastUpdate = freezed,Object? gsm = freezed,Object? batteryLevel = freezed,Object? batteryUpdate = freezed,Object? additional = null,Object? actualTrackUpdate = freezed,}) {
  return _then(_TrackerGpsState(
sourceId: freezed == sourceId ? _self.sourceId : sourceId // ignore: cast_nullable_to_non_nullable
as int?,gps: freezed == gps ? _self.gps : gps // ignore: cast_nullable_to_non_nullable
as GpsData?,connectionStatus: freezed == connectionStatus ? _self.connectionStatus : connectionStatus // ignore: cast_nullable_to_non_nullable
as String?,movementStatus: freezed == movementStatus ? _self.movementStatus : movementStatus // ignore: cast_nullable_to_non_nullable
as String?,movementStatusUpdate: freezed == movementStatusUpdate ? _self.movementStatusUpdate : movementStatusUpdate // ignore: cast_nullable_to_non_nullable
as String?,ignition: freezed == ignition ? _self.ignition : ignition // ignore: cast_nullable_to_non_nullable
as bool?,ignitionUpdate: freezed == ignitionUpdate ? _self.ignitionUpdate : ignitionUpdate // ignore: cast_nullable_to_non_nullable
as String?,inputs: null == inputs ? _self._inputs : inputs // ignore: cast_nullable_to_non_nullable
as List<bool>,outputs: null == outputs ? _self._outputs : outputs // ignore: cast_nullable_to_non_nullable
as List<bool>,lastUpdate: freezed == lastUpdate ? _self.lastUpdate : lastUpdate // ignore: cast_nullable_to_non_nullable
as String?,gsm: freezed == gsm ? _self.gsm : gsm // ignore: cast_nullable_to_non_nullable
as GsmData?,batteryLevel: freezed == batteryLevel ? _self.batteryLevel : batteryLevel // ignore: cast_nullable_to_non_nullable
as int?,batteryUpdate: freezed == batteryUpdate ? _self.batteryUpdate : batteryUpdate // ignore: cast_nullable_to_non_nullable
as String?,additional: null == additional ? _self._additional : additional // ignore: cast_nullable_to_non_nullable
as Map<String, AdditionalReading>,actualTrackUpdate: freezed == actualTrackUpdate ? _self.actualTrackUpdate : actualTrackUpdate // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

/// Create a copy of TrackerGpsState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$GpsDataCopyWith<$Res>? get gps {
    if (_self.gps == null) {
    return null;
  }

  return $GpsDataCopyWith<$Res>(_self.gps!, (value) {
    return _then(_self.copyWith(gps: value));
  });
}/// Create a copy of TrackerGpsState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$GsmDataCopyWith<$Res>? get gsm {
    if (_self.gsm == null) {
    return null;
  }

  return $GsmDataCopyWith<$Res>(_self.gsm!, (value) {
    return _then(_self.copyWith(gsm: value));
  });
}
}


/// @nodoc
mixin _$TrackerStatesResponse {

@JsonKey(name: 'user_time') String? get userTime;@JsonKey(fromJson: _statesFromJson, toJson: _statesToJson) Map<String, TrackerGpsState?> get states; bool? get success;
/// Create a copy of TrackerStatesResponse
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$TrackerStatesResponseCopyWith<TrackerStatesResponse> get copyWith => _$TrackerStatesResponseCopyWithImpl<TrackerStatesResponse>(this as TrackerStatesResponse, _$identity);

  /// Serializes this TrackerStatesResponse to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is TrackerStatesResponse&&(identical(other.userTime, userTime) || other.userTime == userTime)&&const DeepCollectionEquality().equals(other.states, states)&&(identical(other.success, success) || other.success == success));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,userTime,const DeepCollectionEquality().hash(states),success);

@override
String toString() {
  return 'TrackerStatesResponse(userTime: $userTime, states: $states, success: $success)';
}


}

/// @nodoc
abstract mixin class $TrackerStatesResponseCopyWith<$Res>  {
  factory $TrackerStatesResponseCopyWith(TrackerStatesResponse value, $Res Function(TrackerStatesResponse) _then) = _$TrackerStatesResponseCopyWithImpl;
@useResult
$Res call({
@JsonKey(name: 'user_time') String? userTime,@JsonKey(fromJson: _statesFromJson, toJson: _statesToJson) Map<String, TrackerGpsState?> states, bool? success
});




}
/// @nodoc
class _$TrackerStatesResponseCopyWithImpl<$Res>
    implements $TrackerStatesResponseCopyWith<$Res> {
  _$TrackerStatesResponseCopyWithImpl(this._self, this._then);

  final TrackerStatesResponse _self;
  final $Res Function(TrackerStatesResponse) _then;

/// Create a copy of TrackerStatesResponse
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? userTime = freezed,Object? states = null,Object? success = freezed,}) {
  return _then(_self.copyWith(
userTime: freezed == userTime ? _self.userTime : userTime // ignore: cast_nullable_to_non_nullable
as String?,states: null == states ? _self.states : states // ignore: cast_nullable_to_non_nullable
as Map<String, TrackerGpsState?>,success: freezed == success ? _self.success : success // ignore: cast_nullable_to_non_nullable
as bool?,
  ));
}

}


/// Adds pattern-matching-related methods to [TrackerStatesResponse].
extension TrackerStatesResponsePatterns on TrackerStatesResponse {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _TrackerStatesResponse value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _TrackerStatesResponse() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _TrackerStatesResponse value)  $default,){
final _that = this;
switch (_that) {
case _TrackerStatesResponse():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _TrackerStatesResponse value)?  $default,){
final _that = this;
switch (_that) {
case _TrackerStatesResponse() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function(@JsonKey(name: 'user_time')  String? userTime, @JsonKey(fromJson: _statesFromJson, toJson: _statesToJson)  Map<String, TrackerGpsState?> states,  bool? success)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _TrackerStatesResponse() when $default != null:
return $default(_that.userTime,_that.states,_that.success);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function(@JsonKey(name: 'user_time')  String? userTime, @JsonKey(fromJson: _statesFromJson, toJson: _statesToJson)  Map<String, TrackerGpsState?> states,  bool? success)  $default,) {final _that = this;
switch (_that) {
case _TrackerStatesResponse():
return $default(_that.userTime,_that.states,_that.success);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function(@JsonKey(name: 'user_time')  String? userTime, @JsonKey(fromJson: _statesFromJson, toJson: _statesToJson)  Map<String, TrackerGpsState?> states,  bool? success)?  $default,) {final _that = this;
switch (_that) {
case _TrackerStatesResponse() when $default != null:
return $default(_that.userTime,_that.states,_that.success);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _TrackerStatesResponse implements TrackerStatesResponse {
  const _TrackerStatesResponse({@JsonKey(name: 'user_time') this.userTime, @JsonKey(fromJson: _statesFromJson, toJson: _statesToJson) final  Map<String, TrackerGpsState?> states = const <String, TrackerGpsState?>{}, this.success}): _states = states;
  factory _TrackerStatesResponse.fromJson(Map<String, dynamic> json) => _$TrackerStatesResponseFromJson(json);

@override@JsonKey(name: 'user_time') final  String? userTime;
 final  Map<String, TrackerGpsState?> _states;
@override@JsonKey(fromJson: _statesFromJson, toJson: _statesToJson) Map<String, TrackerGpsState?> get states {
  if (_states is EqualUnmodifiableMapView) return _states;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableMapView(_states);
}

@override final  bool? success;

/// Create a copy of TrackerStatesResponse
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$TrackerStatesResponseCopyWith<_TrackerStatesResponse> get copyWith => __$TrackerStatesResponseCopyWithImpl<_TrackerStatesResponse>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$TrackerStatesResponseToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _TrackerStatesResponse&&(identical(other.userTime, userTime) || other.userTime == userTime)&&const DeepCollectionEquality().equals(other._states, _states)&&(identical(other.success, success) || other.success == success));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,userTime,const DeepCollectionEquality().hash(_states),success);

@override
String toString() {
  return 'TrackerStatesResponse(userTime: $userTime, states: $states, success: $success)';
}


}

/// @nodoc
abstract mixin class _$TrackerStatesResponseCopyWith<$Res> implements $TrackerStatesResponseCopyWith<$Res> {
  factory _$TrackerStatesResponseCopyWith(_TrackerStatesResponse value, $Res Function(_TrackerStatesResponse) _then) = __$TrackerStatesResponseCopyWithImpl;
@override @useResult
$Res call({
@JsonKey(name: 'user_time') String? userTime,@JsonKey(fromJson: _statesFromJson, toJson: _statesToJson) Map<String, TrackerGpsState?> states, bool? success
});




}
/// @nodoc
class __$TrackerStatesResponseCopyWithImpl<$Res>
    implements _$TrackerStatesResponseCopyWith<$Res> {
  __$TrackerStatesResponseCopyWithImpl(this._self, this._then);

  final _TrackerStatesResponse _self;
  final $Res Function(_TrackerStatesResponse) _then;

/// Create a copy of TrackerStatesResponse
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? userTime = freezed,Object? states = null,Object? success = freezed,}) {
  return _then(_TrackerStatesResponse(
userTime: freezed == userTime ? _self.userTime : userTime // ignore: cast_nullable_to_non_nullable
as String?,states: null == states ? _self._states : states // ignore: cast_nullable_to_non_nullable
as Map<String, TrackerGpsState?>,success: freezed == success ? _self.success : success // ignore: cast_nullable_to_non_nullable
as bool?,
  ));
}


}

// dart format on
