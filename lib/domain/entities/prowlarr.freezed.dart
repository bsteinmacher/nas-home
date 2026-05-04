// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'prowlarr.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$ProwlarrIndexer {

 int get id; String get name; String get protocol; String get status; bool get enabled;
/// Create a copy of ProwlarrIndexer
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ProwlarrIndexerCopyWith<ProwlarrIndexer> get copyWith => _$ProwlarrIndexerCopyWithImpl<ProwlarrIndexer>(this as ProwlarrIndexer, _$identity);

  /// Serializes this ProwlarrIndexer to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ProwlarrIndexer&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name)&&(identical(other.protocol, protocol) || other.protocol == protocol)&&(identical(other.status, status) || other.status == status)&&(identical(other.enabled, enabled) || other.enabled == enabled));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,name,protocol,status,enabled);

@override
String toString() {
  return 'ProwlarrIndexer(id: $id, name: $name, protocol: $protocol, status: $status, enabled: $enabled)';
}


}

/// @nodoc
abstract mixin class $ProwlarrIndexerCopyWith<$Res>  {
  factory $ProwlarrIndexerCopyWith(ProwlarrIndexer value, $Res Function(ProwlarrIndexer) _then) = _$ProwlarrIndexerCopyWithImpl;
@useResult
$Res call({
 int id, String name, String protocol, String status, bool enabled
});




}
/// @nodoc
class _$ProwlarrIndexerCopyWithImpl<$Res>
    implements $ProwlarrIndexerCopyWith<$Res> {
  _$ProwlarrIndexerCopyWithImpl(this._self, this._then);

  final ProwlarrIndexer _self;
  final $Res Function(ProwlarrIndexer) _then;

/// Create a copy of ProwlarrIndexer
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? name = null,Object? protocol = null,Object? status = null,Object? enabled = null,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,protocol: null == protocol ? _self.protocol : protocol // ignore: cast_nullable_to_non_nullable
as String,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as String,enabled: null == enabled ? _self.enabled : enabled // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}

}


/// Adds pattern-matching-related methods to [ProwlarrIndexer].
extension ProwlarrIndexerPatterns on ProwlarrIndexer {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ProwlarrIndexer value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ProwlarrIndexer() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ProwlarrIndexer value)  $default,){
final _that = this;
switch (_that) {
case _ProwlarrIndexer():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ProwlarrIndexer value)?  $default,){
final _that = this;
switch (_that) {
case _ProwlarrIndexer() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int id,  String name,  String protocol,  String status,  bool enabled)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ProwlarrIndexer() when $default != null:
return $default(_that.id,_that.name,_that.protocol,_that.status,_that.enabled);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int id,  String name,  String protocol,  String status,  bool enabled)  $default,) {final _that = this;
switch (_that) {
case _ProwlarrIndexer():
return $default(_that.id,_that.name,_that.protocol,_that.status,_that.enabled);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int id,  String name,  String protocol,  String status,  bool enabled)?  $default,) {final _that = this;
switch (_that) {
case _ProwlarrIndexer() when $default != null:
return $default(_that.id,_that.name,_that.protocol,_that.status,_that.enabled);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _ProwlarrIndexer implements ProwlarrIndexer {
  const _ProwlarrIndexer({required this.id, required this.name, required this.protocol, required this.status, required this.enabled});
  factory _ProwlarrIndexer.fromJson(Map<String, dynamic> json) => _$ProwlarrIndexerFromJson(json);

@override final  int id;
@override final  String name;
@override final  String protocol;
@override final  String status;
@override final  bool enabled;

/// Create a copy of ProwlarrIndexer
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ProwlarrIndexerCopyWith<_ProwlarrIndexer> get copyWith => __$ProwlarrIndexerCopyWithImpl<_ProwlarrIndexer>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$ProwlarrIndexerToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ProwlarrIndexer&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name)&&(identical(other.protocol, protocol) || other.protocol == protocol)&&(identical(other.status, status) || other.status == status)&&(identical(other.enabled, enabled) || other.enabled == enabled));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,name,protocol,status,enabled);

@override
String toString() {
  return 'ProwlarrIndexer(id: $id, name: $name, protocol: $protocol, status: $status, enabled: $enabled)';
}


}

/// @nodoc
abstract mixin class _$ProwlarrIndexerCopyWith<$Res> implements $ProwlarrIndexerCopyWith<$Res> {
  factory _$ProwlarrIndexerCopyWith(_ProwlarrIndexer value, $Res Function(_ProwlarrIndexer) _then) = __$ProwlarrIndexerCopyWithImpl;
@override @useResult
$Res call({
 int id, String name, String protocol, String status, bool enabled
});




}
/// @nodoc
class __$ProwlarrIndexerCopyWithImpl<$Res>
    implements _$ProwlarrIndexerCopyWith<$Res> {
  __$ProwlarrIndexerCopyWithImpl(this._self, this._then);

  final _ProwlarrIndexer _self;
  final $Res Function(_ProwlarrIndexer) _then;

/// Create a copy of ProwlarrIndexer
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? name = null,Object? protocol = null,Object? status = null,Object? enabled = null,}) {
  return _then(_ProwlarrIndexer(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,protocol: null == protocol ? _self.protocol : protocol // ignore: cast_nullable_to_non_nullable
as String,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as String,enabled: null == enabled ? _self.enabled : enabled // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}


}

// dart format on
