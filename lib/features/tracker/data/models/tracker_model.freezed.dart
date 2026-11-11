// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'tracker_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$TagBinding {

@JsonKey(name: 'tag_id')@FlexibleIntConverter() int? get tagId;@FlexibleIntConverter() int? get ordinal;
/// Create a copy of TagBinding
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$TagBindingCopyWith<TagBinding> get copyWith => _$TagBindingCopyWithImpl<TagBinding>(this as TagBinding, _$identity);

  /// Serializes this TagBinding to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is TagBinding&&(identical(other.tagId, tagId) || other.tagId == tagId)&&(identical(other.ordinal, ordinal) || other.ordinal == ordinal));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,tagId,ordinal);

@override
String toString() {
  return 'TagBinding(tagId: $tagId, ordinal: $ordinal)';
}


}

/// @nodoc
abstract mixin class $TagBindingCopyWith<$Res>  {
  factory $TagBindingCopyWith(TagBinding value, $Res Function(TagBinding) _then) = _$TagBindingCopyWithImpl;
@useResult
$Res call({
@JsonKey(name: 'tag_id')@FlexibleIntConverter() int? tagId,@FlexibleIntConverter() int? ordinal
});




}
/// @nodoc
class _$TagBindingCopyWithImpl<$Res>
    implements $TagBindingCopyWith<$Res> {
  _$TagBindingCopyWithImpl(this._self, this._then);

  final TagBinding _self;
  final $Res Function(TagBinding) _then;

/// Create a copy of TagBinding
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? tagId = freezed,Object? ordinal = freezed,}) {
  return _then(_self.copyWith(
tagId: freezed == tagId ? _self.tagId : tagId // ignore: cast_nullable_to_non_nullable
as int?,ordinal: freezed == ordinal ? _self.ordinal : ordinal // ignore: cast_nullable_to_non_nullable
as int?,
  ));
}

}


/// Adds pattern-matching-related methods to [TagBinding].
extension TagBindingPatterns on TagBinding {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _TagBinding value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _TagBinding() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _TagBinding value)  $default,){
final _that = this;
switch (_that) {
case _TagBinding():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _TagBinding value)?  $default,){
final _that = this;
switch (_that) {
case _TagBinding() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function(@JsonKey(name: 'tag_id')@FlexibleIntConverter()  int? tagId, @FlexibleIntConverter()  int? ordinal)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _TagBinding() when $default != null:
return $default(_that.tagId,_that.ordinal);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function(@JsonKey(name: 'tag_id')@FlexibleIntConverter()  int? tagId, @FlexibleIntConverter()  int? ordinal)  $default,) {final _that = this;
switch (_that) {
case _TagBinding():
return $default(_that.tagId,_that.ordinal);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function(@JsonKey(name: 'tag_id')@FlexibleIntConverter()  int? tagId, @FlexibleIntConverter()  int? ordinal)?  $default,) {final _that = this;
switch (_that) {
case _TagBinding() when $default != null:
return $default(_that.tagId,_that.ordinal);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _TagBinding implements TagBinding {
  const _TagBinding({@JsonKey(name: 'tag_id')@FlexibleIntConverter() this.tagId, @FlexibleIntConverter() this.ordinal});
  factory _TagBinding.fromJson(Map<String, dynamic> json) => _$TagBindingFromJson(json);

@override@JsonKey(name: 'tag_id')@FlexibleIntConverter() final  int? tagId;
@override@FlexibleIntConverter() final  int? ordinal;

/// Create a copy of TagBinding
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$TagBindingCopyWith<_TagBinding> get copyWith => __$TagBindingCopyWithImpl<_TagBinding>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$TagBindingToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _TagBinding&&(identical(other.tagId, tagId) || other.tagId == tagId)&&(identical(other.ordinal, ordinal) || other.ordinal == ordinal));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,tagId,ordinal);

@override
String toString() {
  return 'TagBinding(tagId: $tagId, ordinal: $ordinal)';
}


}

/// @nodoc
abstract mixin class _$TagBindingCopyWith<$Res> implements $TagBindingCopyWith<$Res> {
  factory _$TagBindingCopyWith(_TagBinding value, $Res Function(_TagBinding) _then) = __$TagBindingCopyWithImpl;
@override @useResult
$Res call({
@JsonKey(name: 'tag_id')@FlexibleIntConverter() int? tagId,@FlexibleIntConverter() int? ordinal
});




}
/// @nodoc
class __$TagBindingCopyWithImpl<$Res>
    implements _$TagBindingCopyWith<$Res> {
  __$TagBindingCopyWithImpl(this._self, this._then);

  final _TagBinding _self;
  final $Res Function(_TagBinding) _then;

/// Create a copy of TagBinding
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? tagId = freezed,Object? ordinal = freezed,}) {
  return _then(_TagBinding(
tagId: freezed == tagId ? _self.tagId : tagId // ignore: cast_nullable_to_non_nullable
as int?,ordinal: freezed == ordinal ? _self.ordinal : ordinal // ignore: cast_nullable_to_non_nullable
as int?,
  ));
}


}


/// @nodoc
mixin _$TrackerSource {

@JsonKey(name: 'status_listing_id')@FlexibleIntConverter() int? get statusListingId;@FlexibleIntConverter() int? get id;@JsonKey(name: 'creation_date') String? get creationDate; bool? get blocked;@JsonKey(name: 'device_id') String? get deviceId;@JsonKey(name: 'tariff_id')@FlexibleIntConverter() int? get tariffId; String? get model;@JsonKey(name: 'tariff_end_date') String? get tariffEndDate; String? get phone;
/// Create a copy of TrackerSource
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$TrackerSourceCopyWith<TrackerSource> get copyWith => _$TrackerSourceCopyWithImpl<TrackerSource>(this as TrackerSource, _$identity);

  /// Serializes this TrackerSource to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is TrackerSource&&(identical(other.statusListingId, statusListingId) || other.statusListingId == statusListingId)&&(identical(other.id, id) || other.id == id)&&(identical(other.creationDate, creationDate) || other.creationDate == creationDate)&&(identical(other.blocked, blocked) || other.blocked == blocked)&&(identical(other.deviceId, deviceId) || other.deviceId == deviceId)&&(identical(other.tariffId, tariffId) || other.tariffId == tariffId)&&(identical(other.model, model) || other.model == model)&&(identical(other.tariffEndDate, tariffEndDate) || other.tariffEndDate == tariffEndDate)&&(identical(other.phone, phone) || other.phone == phone));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,statusListingId,id,creationDate,blocked,deviceId,tariffId,model,tariffEndDate,phone);

@override
String toString() {
  return 'TrackerSource(statusListingId: $statusListingId, id: $id, creationDate: $creationDate, blocked: $blocked, deviceId: $deviceId, tariffId: $tariffId, model: $model, tariffEndDate: $tariffEndDate, phone: $phone)';
}


}

/// @nodoc
abstract mixin class $TrackerSourceCopyWith<$Res>  {
  factory $TrackerSourceCopyWith(TrackerSource value, $Res Function(TrackerSource) _then) = _$TrackerSourceCopyWithImpl;
@useResult
$Res call({
@JsonKey(name: 'status_listing_id')@FlexibleIntConverter() int? statusListingId,@FlexibleIntConverter() int? id,@JsonKey(name: 'creation_date') String? creationDate, bool? blocked,@JsonKey(name: 'device_id') String? deviceId,@JsonKey(name: 'tariff_id')@FlexibleIntConverter() int? tariffId, String? model,@JsonKey(name: 'tariff_end_date') String? tariffEndDate, String? phone
});




}
/// @nodoc
class _$TrackerSourceCopyWithImpl<$Res>
    implements $TrackerSourceCopyWith<$Res> {
  _$TrackerSourceCopyWithImpl(this._self, this._then);

  final TrackerSource _self;
  final $Res Function(TrackerSource) _then;

/// Create a copy of TrackerSource
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? statusListingId = freezed,Object? id = freezed,Object? creationDate = freezed,Object? blocked = freezed,Object? deviceId = freezed,Object? tariffId = freezed,Object? model = freezed,Object? tariffEndDate = freezed,Object? phone = freezed,}) {
  return _then(_self.copyWith(
statusListingId: freezed == statusListingId ? _self.statusListingId : statusListingId // ignore: cast_nullable_to_non_nullable
as int?,id: freezed == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int?,creationDate: freezed == creationDate ? _self.creationDate : creationDate // ignore: cast_nullable_to_non_nullable
as String?,blocked: freezed == blocked ? _self.blocked : blocked // ignore: cast_nullable_to_non_nullable
as bool?,deviceId: freezed == deviceId ? _self.deviceId : deviceId // ignore: cast_nullable_to_non_nullable
as String?,tariffId: freezed == tariffId ? _self.tariffId : tariffId // ignore: cast_nullable_to_non_nullable
as int?,model: freezed == model ? _self.model : model // ignore: cast_nullable_to_non_nullable
as String?,tariffEndDate: freezed == tariffEndDate ? _self.tariffEndDate : tariffEndDate // ignore: cast_nullable_to_non_nullable
as String?,phone: freezed == phone ? _self.phone : phone // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [TrackerSource].
extension TrackerSourcePatterns on TrackerSource {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _TrackerSource value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _TrackerSource() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _TrackerSource value)  $default,){
final _that = this;
switch (_that) {
case _TrackerSource():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _TrackerSource value)?  $default,){
final _that = this;
switch (_that) {
case _TrackerSource() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function(@JsonKey(name: 'status_listing_id')@FlexibleIntConverter()  int? statusListingId, @FlexibleIntConverter()  int? id, @JsonKey(name: 'creation_date')  String? creationDate,  bool? blocked, @JsonKey(name: 'device_id')  String? deviceId, @JsonKey(name: 'tariff_id')@FlexibleIntConverter()  int? tariffId,  String? model, @JsonKey(name: 'tariff_end_date')  String? tariffEndDate,  String? phone)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _TrackerSource() when $default != null:
return $default(_that.statusListingId,_that.id,_that.creationDate,_that.blocked,_that.deviceId,_that.tariffId,_that.model,_that.tariffEndDate,_that.phone);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function(@JsonKey(name: 'status_listing_id')@FlexibleIntConverter()  int? statusListingId, @FlexibleIntConverter()  int? id, @JsonKey(name: 'creation_date')  String? creationDate,  bool? blocked, @JsonKey(name: 'device_id')  String? deviceId, @JsonKey(name: 'tariff_id')@FlexibleIntConverter()  int? tariffId,  String? model, @JsonKey(name: 'tariff_end_date')  String? tariffEndDate,  String? phone)  $default,) {final _that = this;
switch (_that) {
case _TrackerSource():
return $default(_that.statusListingId,_that.id,_that.creationDate,_that.blocked,_that.deviceId,_that.tariffId,_that.model,_that.tariffEndDate,_that.phone);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function(@JsonKey(name: 'status_listing_id')@FlexibleIntConverter()  int? statusListingId, @FlexibleIntConverter()  int? id, @JsonKey(name: 'creation_date')  String? creationDate,  bool? blocked, @JsonKey(name: 'device_id')  String? deviceId, @JsonKey(name: 'tariff_id')@FlexibleIntConverter()  int? tariffId,  String? model, @JsonKey(name: 'tariff_end_date')  String? tariffEndDate,  String? phone)?  $default,) {final _that = this;
switch (_that) {
case _TrackerSource() when $default != null:
return $default(_that.statusListingId,_that.id,_that.creationDate,_that.blocked,_that.deviceId,_that.tariffId,_that.model,_that.tariffEndDate,_that.phone);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _TrackerSource implements TrackerSource {
  const _TrackerSource({@JsonKey(name: 'status_listing_id')@FlexibleIntConverter() this.statusListingId, @FlexibleIntConverter() this.id, @JsonKey(name: 'creation_date') this.creationDate, this.blocked, @JsonKey(name: 'device_id') this.deviceId, @JsonKey(name: 'tariff_id')@FlexibleIntConverter() this.tariffId, this.model, @JsonKey(name: 'tariff_end_date') this.tariffEndDate, this.phone});
  factory _TrackerSource.fromJson(Map<String, dynamic> json) => _$TrackerSourceFromJson(json);

@override@JsonKey(name: 'status_listing_id')@FlexibleIntConverter() final  int? statusListingId;
@override@FlexibleIntConverter() final  int? id;
@override@JsonKey(name: 'creation_date') final  String? creationDate;
@override final  bool? blocked;
@override@JsonKey(name: 'device_id') final  String? deviceId;
@override@JsonKey(name: 'tariff_id')@FlexibleIntConverter() final  int? tariffId;
@override final  String? model;
@override@JsonKey(name: 'tariff_end_date') final  String? tariffEndDate;
@override final  String? phone;

/// Create a copy of TrackerSource
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$TrackerSourceCopyWith<_TrackerSource> get copyWith => __$TrackerSourceCopyWithImpl<_TrackerSource>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$TrackerSourceToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _TrackerSource&&(identical(other.statusListingId, statusListingId) || other.statusListingId == statusListingId)&&(identical(other.id, id) || other.id == id)&&(identical(other.creationDate, creationDate) || other.creationDate == creationDate)&&(identical(other.blocked, blocked) || other.blocked == blocked)&&(identical(other.deviceId, deviceId) || other.deviceId == deviceId)&&(identical(other.tariffId, tariffId) || other.tariffId == tariffId)&&(identical(other.model, model) || other.model == model)&&(identical(other.tariffEndDate, tariffEndDate) || other.tariffEndDate == tariffEndDate)&&(identical(other.phone, phone) || other.phone == phone));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,statusListingId,id,creationDate,blocked,deviceId,tariffId,model,tariffEndDate,phone);

@override
String toString() {
  return 'TrackerSource(statusListingId: $statusListingId, id: $id, creationDate: $creationDate, blocked: $blocked, deviceId: $deviceId, tariffId: $tariffId, model: $model, tariffEndDate: $tariffEndDate, phone: $phone)';
}


}

/// @nodoc
abstract mixin class _$TrackerSourceCopyWith<$Res> implements $TrackerSourceCopyWith<$Res> {
  factory _$TrackerSourceCopyWith(_TrackerSource value, $Res Function(_TrackerSource) _then) = __$TrackerSourceCopyWithImpl;
@override @useResult
$Res call({
@JsonKey(name: 'status_listing_id')@FlexibleIntConverter() int? statusListingId,@FlexibleIntConverter() int? id,@JsonKey(name: 'creation_date') String? creationDate, bool? blocked,@JsonKey(name: 'device_id') String? deviceId,@JsonKey(name: 'tariff_id')@FlexibleIntConverter() int? tariffId, String? model,@JsonKey(name: 'tariff_end_date') String? tariffEndDate, String? phone
});




}
/// @nodoc
class __$TrackerSourceCopyWithImpl<$Res>
    implements _$TrackerSourceCopyWith<$Res> {
  __$TrackerSourceCopyWithImpl(this._self, this._then);

  final _TrackerSource _self;
  final $Res Function(_TrackerSource) _then;

/// Create a copy of TrackerSource
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? statusListingId = freezed,Object? id = freezed,Object? creationDate = freezed,Object? blocked = freezed,Object? deviceId = freezed,Object? tariffId = freezed,Object? model = freezed,Object? tariffEndDate = freezed,Object? phone = freezed,}) {
  return _then(_TrackerSource(
statusListingId: freezed == statusListingId ? _self.statusListingId : statusListingId // ignore: cast_nullable_to_non_nullable
as int?,id: freezed == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int?,creationDate: freezed == creationDate ? _self.creationDate : creationDate // ignore: cast_nullable_to_non_nullable
as String?,blocked: freezed == blocked ? _self.blocked : blocked // ignore: cast_nullable_to_non_nullable
as bool?,deviceId: freezed == deviceId ? _self.deviceId : deviceId // ignore: cast_nullable_to_non_nullable
as String?,tariffId: freezed == tariffId ? _self.tariffId : tariffId // ignore: cast_nullable_to_non_nullable
as int?,model: freezed == model ? _self.model : model // ignore: cast_nullable_to_non_nullable
as String?,tariffEndDate: freezed == tariffEndDate ? _self.tariffEndDate : tariffEndDate // ignore: cast_nullable_to_non_nullable
as String?,phone: freezed == phone ? _self.phone : phone // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}


/// @nodoc
mixin _$Tracker {

@FlexibleIntConverter() int? get id; String get label;@JsonKey(name: 'group_id')@FlexibleIntConverter() int? get groupId; TrackerSource? get source;@JsonKey(name: 'tag_bindings', fromJson: _tagBindingsFromJson, toJson: _tagBindingsToJson) List<TagBinding> get tagBindings; bool get clone;
/// Create a copy of Tracker
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$TrackerCopyWith<Tracker> get copyWith => _$TrackerCopyWithImpl<Tracker>(this as Tracker, _$identity);

  /// Serializes this Tracker to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Tracker&&(identical(other.id, id) || other.id == id)&&(identical(other.label, label) || other.label == label)&&(identical(other.groupId, groupId) || other.groupId == groupId)&&(identical(other.source, source) || other.source == source)&&const DeepCollectionEquality().equals(other.tagBindings, tagBindings)&&(identical(other.clone, clone) || other.clone == clone));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,label,groupId,source,const DeepCollectionEquality().hash(tagBindings),clone);

@override
String toString() {
  return 'Tracker(id: $id, label: $label, groupId: $groupId, source: $source, tagBindings: $tagBindings, clone: $clone)';
}


}

/// @nodoc
abstract mixin class $TrackerCopyWith<$Res>  {
  factory $TrackerCopyWith(Tracker value, $Res Function(Tracker) _then) = _$TrackerCopyWithImpl;
@useResult
$Res call({
@FlexibleIntConverter() int? id, String label,@JsonKey(name: 'group_id')@FlexibleIntConverter() int? groupId, TrackerSource? source,@JsonKey(name: 'tag_bindings', fromJson: _tagBindingsFromJson, toJson: _tagBindingsToJson) List<TagBinding> tagBindings, bool clone
});


$TrackerSourceCopyWith<$Res>? get source;

}
/// @nodoc
class _$TrackerCopyWithImpl<$Res>
    implements $TrackerCopyWith<$Res> {
  _$TrackerCopyWithImpl(this._self, this._then);

  final Tracker _self;
  final $Res Function(Tracker) _then;

/// Create a copy of Tracker
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = freezed,Object? label = null,Object? groupId = freezed,Object? source = freezed,Object? tagBindings = null,Object? clone = null,}) {
  return _then(_self.copyWith(
id: freezed == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int?,label: null == label ? _self.label : label // ignore: cast_nullable_to_non_nullable
as String,groupId: freezed == groupId ? _self.groupId : groupId // ignore: cast_nullable_to_non_nullable
as int?,source: freezed == source ? _self.source : source // ignore: cast_nullable_to_non_nullable
as TrackerSource?,tagBindings: null == tagBindings ? _self.tagBindings : tagBindings // ignore: cast_nullable_to_non_nullable
as List<TagBinding>,clone: null == clone ? _self.clone : clone // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}
/// Create a copy of Tracker
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$TrackerSourceCopyWith<$Res>? get source {
    if (_self.source == null) {
    return null;
  }

  return $TrackerSourceCopyWith<$Res>(_self.source!, (value) {
    return _then(_self.copyWith(source: value));
  });
}
}


/// Adds pattern-matching-related methods to [Tracker].
extension TrackerPatterns on Tracker {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _Tracker value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _Tracker() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _Tracker value)  $default,){
final _that = this;
switch (_that) {
case _Tracker():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _Tracker value)?  $default,){
final _that = this;
switch (_that) {
case _Tracker() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function(@FlexibleIntConverter()  int? id,  String label, @JsonKey(name: 'group_id')@FlexibleIntConverter()  int? groupId,  TrackerSource? source, @JsonKey(name: 'tag_bindings', fromJson: _tagBindingsFromJson, toJson: _tagBindingsToJson)  List<TagBinding> tagBindings,  bool clone)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _Tracker() when $default != null:
return $default(_that.id,_that.label,_that.groupId,_that.source,_that.tagBindings,_that.clone);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function(@FlexibleIntConverter()  int? id,  String label, @JsonKey(name: 'group_id')@FlexibleIntConverter()  int? groupId,  TrackerSource? source, @JsonKey(name: 'tag_bindings', fromJson: _tagBindingsFromJson, toJson: _tagBindingsToJson)  List<TagBinding> tagBindings,  bool clone)  $default,) {final _that = this;
switch (_that) {
case _Tracker():
return $default(_that.id,_that.label,_that.groupId,_that.source,_that.tagBindings,_that.clone);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function(@FlexibleIntConverter()  int? id,  String label, @JsonKey(name: 'group_id')@FlexibleIntConverter()  int? groupId,  TrackerSource? source, @JsonKey(name: 'tag_bindings', fromJson: _tagBindingsFromJson, toJson: _tagBindingsToJson)  List<TagBinding> tagBindings,  bool clone)?  $default,) {final _that = this;
switch (_that) {
case _Tracker() when $default != null:
return $default(_that.id,_that.label,_that.groupId,_that.source,_that.tagBindings,_that.clone);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _Tracker implements Tracker {
  const _Tracker({@FlexibleIntConverter() this.id, this.label = '', @JsonKey(name: 'group_id')@FlexibleIntConverter() this.groupId, this.source, @JsonKey(name: 'tag_bindings', fromJson: _tagBindingsFromJson, toJson: _tagBindingsToJson) final  List<TagBinding> tagBindings = const <TagBinding>[], this.clone = false}): _tagBindings = tagBindings;
  factory _Tracker.fromJson(Map<String, dynamic> json) => _$TrackerFromJson(json);

@override@FlexibleIntConverter() final  int? id;
@override@JsonKey() final  String label;
@override@JsonKey(name: 'group_id')@FlexibleIntConverter() final  int? groupId;
@override final  TrackerSource? source;
 final  List<TagBinding> _tagBindings;
@override@JsonKey(name: 'tag_bindings', fromJson: _tagBindingsFromJson, toJson: _tagBindingsToJson) List<TagBinding> get tagBindings {
  if (_tagBindings is EqualUnmodifiableListView) return _tagBindings;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_tagBindings);
}

@override@JsonKey() final  bool clone;

/// Create a copy of Tracker
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$TrackerCopyWith<_Tracker> get copyWith => __$TrackerCopyWithImpl<_Tracker>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$TrackerToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Tracker&&(identical(other.id, id) || other.id == id)&&(identical(other.label, label) || other.label == label)&&(identical(other.groupId, groupId) || other.groupId == groupId)&&(identical(other.source, source) || other.source == source)&&const DeepCollectionEquality().equals(other._tagBindings, _tagBindings)&&(identical(other.clone, clone) || other.clone == clone));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,label,groupId,source,const DeepCollectionEquality().hash(_tagBindings),clone);

@override
String toString() {
  return 'Tracker(id: $id, label: $label, groupId: $groupId, source: $source, tagBindings: $tagBindings, clone: $clone)';
}


}

/// @nodoc
abstract mixin class _$TrackerCopyWith<$Res> implements $TrackerCopyWith<$Res> {
  factory _$TrackerCopyWith(_Tracker value, $Res Function(_Tracker) _then) = __$TrackerCopyWithImpl;
@override @useResult
$Res call({
@FlexibleIntConverter() int? id, String label,@JsonKey(name: 'group_id')@FlexibleIntConverter() int? groupId, TrackerSource? source,@JsonKey(name: 'tag_bindings', fromJson: _tagBindingsFromJson, toJson: _tagBindingsToJson) List<TagBinding> tagBindings, bool clone
});


@override $TrackerSourceCopyWith<$Res>? get source;

}
/// @nodoc
class __$TrackerCopyWithImpl<$Res>
    implements _$TrackerCopyWith<$Res> {
  __$TrackerCopyWithImpl(this._self, this._then);

  final _Tracker _self;
  final $Res Function(_Tracker) _then;

/// Create a copy of Tracker
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = freezed,Object? label = null,Object? groupId = freezed,Object? source = freezed,Object? tagBindings = null,Object? clone = null,}) {
  return _then(_Tracker(
id: freezed == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int?,label: null == label ? _self.label : label // ignore: cast_nullable_to_non_nullable
as String,groupId: freezed == groupId ? _self.groupId : groupId // ignore: cast_nullable_to_non_nullable
as int?,source: freezed == source ? _self.source : source // ignore: cast_nullable_to_non_nullable
as TrackerSource?,tagBindings: null == tagBindings ? _self._tagBindings : tagBindings // ignore: cast_nullable_to_non_nullable
as List<TagBinding>,clone: null == clone ? _self.clone : clone // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}

/// Create a copy of Tracker
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$TrackerSourceCopyWith<$Res>? get source {
    if (_self.source == null) {
    return null;
  }

  return $TrackerSourceCopyWith<$Res>(_self.source!, (value) {
    return _then(_self.copyWith(source: value));
  });
}
}


/// @nodoc
mixin _$TrackerListResponse {

 List<Tracker> get list;
/// Create a copy of TrackerListResponse
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$TrackerListResponseCopyWith<TrackerListResponse> get copyWith => _$TrackerListResponseCopyWithImpl<TrackerListResponse>(this as TrackerListResponse, _$identity);

  /// Serializes this TrackerListResponse to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is TrackerListResponse&&const DeepCollectionEquality().equals(other.list, list));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(list));

@override
String toString() {
  return 'TrackerListResponse(list: $list)';
}


}

/// @nodoc
abstract mixin class $TrackerListResponseCopyWith<$Res>  {
  factory $TrackerListResponseCopyWith(TrackerListResponse value, $Res Function(TrackerListResponse) _then) = _$TrackerListResponseCopyWithImpl;
@useResult
$Res call({
 List<Tracker> list
});




}
/// @nodoc
class _$TrackerListResponseCopyWithImpl<$Res>
    implements $TrackerListResponseCopyWith<$Res> {
  _$TrackerListResponseCopyWithImpl(this._self, this._then);

  final TrackerListResponse _self;
  final $Res Function(TrackerListResponse) _then;

/// Create a copy of TrackerListResponse
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? list = null,}) {
  return _then(_self.copyWith(
list: null == list ? _self.list : list // ignore: cast_nullable_to_non_nullable
as List<Tracker>,
  ));
}

}


/// Adds pattern-matching-related methods to [TrackerListResponse].
extension TrackerListResponsePatterns on TrackerListResponse {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _TrackerListResponse value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _TrackerListResponse() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _TrackerListResponse value)  $default,){
final _that = this;
switch (_that) {
case _TrackerListResponse():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _TrackerListResponse value)?  $default,){
final _that = this;
switch (_that) {
case _TrackerListResponse() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( List<Tracker> list)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _TrackerListResponse() when $default != null:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( List<Tracker> list)  $default,) {final _that = this;
switch (_that) {
case _TrackerListResponse():
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( List<Tracker> list)?  $default,) {final _that = this;
switch (_that) {
case _TrackerListResponse() when $default != null:
return $default(_that.list);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _TrackerListResponse implements TrackerListResponse {
  const _TrackerListResponse({final  List<Tracker> list = const <Tracker>[]}): _list = list;
  factory _TrackerListResponse.fromJson(Map<String, dynamic> json) => _$TrackerListResponseFromJson(json);

 final  List<Tracker> _list;
@override@JsonKey() List<Tracker> get list {
  if (_list is EqualUnmodifiableListView) return _list;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_list);
}


/// Create a copy of TrackerListResponse
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$TrackerListResponseCopyWith<_TrackerListResponse> get copyWith => __$TrackerListResponseCopyWithImpl<_TrackerListResponse>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$TrackerListResponseToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _TrackerListResponse&&const DeepCollectionEquality().equals(other._list, _list));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(_list));

@override
String toString() {
  return 'TrackerListResponse(list: $list)';
}


}

/// @nodoc
abstract mixin class _$TrackerListResponseCopyWith<$Res> implements $TrackerListResponseCopyWith<$Res> {
  factory _$TrackerListResponseCopyWith(_TrackerListResponse value, $Res Function(_TrackerListResponse) _then) = __$TrackerListResponseCopyWithImpl;
@override @useResult
$Res call({
 List<Tracker> list
});




}
/// @nodoc
class __$TrackerListResponseCopyWithImpl<$Res>
    implements _$TrackerListResponseCopyWith<$Res> {
  __$TrackerListResponseCopyWithImpl(this._self, this._then);

  final _TrackerListResponse _self;
  final $Res Function(_TrackerListResponse) _then;

/// Create a copy of TrackerListResponse
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? list = null,}) {
  return _then(_TrackerListResponse(
list: null == list ? _self._list : list // ignore: cast_nullable_to_non_nullable
as List<Tracker>,
  ));
}


}

// dart format on
