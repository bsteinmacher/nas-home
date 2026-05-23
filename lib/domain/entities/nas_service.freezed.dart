// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'nas_service.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$NasService {

 String get name; String get port; String get description; bool get isOnline; bool get updateAvailable; String? get containerName; String? get localDigest; String? get remoteDigest; String? get localVersion; String? get remoteLastUpdated; String? get imageTag;
/// Create a copy of NasService
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$NasServiceCopyWith<NasService> get copyWith => _$NasServiceCopyWithImpl<NasService>(this as NasService, _$identity);

  /// Serializes this NasService to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is NasService&&(identical(other.name, name) || other.name == name)&&(identical(other.port, port) || other.port == port)&&(identical(other.description, description) || other.description == description)&&(identical(other.isOnline, isOnline) || other.isOnline == isOnline)&&(identical(other.updateAvailable, updateAvailable) || other.updateAvailable == updateAvailable)&&(identical(other.containerName, containerName) || other.containerName == containerName)&&(identical(other.localDigest, localDigest) || other.localDigest == localDigest)&&(identical(other.remoteDigest, remoteDigest) || other.remoteDigest == remoteDigest)&&(identical(other.localVersion, localVersion) || other.localVersion == localVersion)&&(identical(other.remoteLastUpdated, remoteLastUpdated) || other.remoteLastUpdated == remoteLastUpdated)&&(identical(other.imageTag, imageTag) || other.imageTag == imageTag));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,name,port,description,isOnline,updateAvailable,containerName,localDigest,remoteDigest,localVersion,remoteLastUpdated,imageTag);

@override
String toString() {
  return 'NasService(name: $name, port: $port, description: $description, isOnline: $isOnline, updateAvailable: $updateAvailable, containerName: $containerName, localDigest: $localDigest, remoteDigest: $remoteDigest, localVersion: $localVersion, remoteLastUpdated: $remoteLastUpdated, imageTag: $imageTag)';
}


}

/// @nodoc
abstract mixin class $NasServiceCopyWith<$Res>  {
  factory $NasServiceCopyWith(NasService value, $Res Function(NasService) _then) = _$NasServiceCopyWithImpl;
@useResult
$Res call({
 String name, String port, String description, bool isOnline, bool updateAvailable, String? containerName, String? localDigest, String? remoteDigest, String? localVersion, String? remoteLastUpdated, String? imageTag
});




}
/// @nodoc
class _$NasServiceCopyWithImpl<$Res>
    implements $NasServiceCopyWith<$Res> {
  _$NasServiceCopyWithImpl(this._self, this._then);

  final NasService _self;
  final $Res Function(NasService) _then;

/// Create a copy of NasService
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? name = null,Object? port = null,Object? description = null,Object? isOnline = null,Object? updateAvailable = null,Object? containerName = freezed,Object? localDigest = freezed,Object? remoteDigest = freezed,Object? localVersion = freezed,Object? remoteLastUpdated = freezed,Object? imageTag = freezed,}) {
  return _then(_self.copyWith(
name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,port: null == port ? _self.port : port // ignore: cast_nullable_to_non_nullable
as String,description: null == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String,isOnline: null == isOnline ? _self.isOnline : isOnline // ignore: cast_nullable_to_non_nullable
as bool,updateAvailable: null == updateAvailable ? _self.updateAvailable : updateAvailable // ignore: cast_nullable_to_non_nullable
as bool,containerName: freezed == containerName ? _self.containerName : containerName // ignore: cast_nullable_to_non_nullable
as String?,localDigest: freezed == localDigest ? _self.localDigest : localDigest // ignore: cast_nullable_to_non_nullable
as String?,remoteDigest: freezed == remoteDigest ? _self.remoteDigest : remoteDigest // ignore: cast_nullable_to_non_nullable
as String?,localVersion: freezed == localVersion ? _self.localVersion : localVersion // ignore: cast_nullable_to_non_nullable
as String?,remoteLastUpdated: freezed == remoteLastUpdated ? _self.remoteLastUpdated : remoteLastUpdated // ignore: cast_nullable_to_non_nullable
as String?,imageTag: freezed == imageTag ? _self.imageTag : imageTag // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [NasService].
extension NasServicePatterns on NasService {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _NasService value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _NasService() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _NasService value)  $default,){
final _that = this;
switch (_that) {
case _NasService():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _NasService value)?  $default,){
final _that = this;
switch (_that) {
case _NasService() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String name,  String port,  String description,  bool isOnline,  bool updateAvailable,  String? containerName,  String? localDigest,  String? remoteDigest,  String? localVersion,  String? remoteLastUpdated,  String? imageTag)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _NasService() when $default != null:
return $default(_that.name,_that.port,_that.description,_that.isOnline,_that.updateAvailable,_that.containerName,_that.localDigest,_that.remoteDigest,_that.localVersion,_that.remoteLastUpdated,_that.imageTag);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String name,  String port,  String description,  bool isOnline,  bool updateAvailable,  String? containerName,  String? localDigest,  String? remoteDigest,  String? localVersion,  String? remoteLastUpdated,  String? imageTag)  $default,) {final _that = this;
switch (_that) {
case _NasService():
return $default(_that.name,_that.port,_that.description,_that.isOnline,_that.updateAvailable,_that.containerName,_that.localDigest,_that.remoteDigest,_that.localVersion,_that.remoteLastUpdated,_that.imageTag);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String name,  String port,  String description,  bool isOnline,  bool updateAvailable,  String? containerName,  String? localDigest,  String? remoteDigest,  String? localVersion,  String? remoteLastUpdated,  String? imageTag)?  $default,) {final _that = this;
switch (_that) {
case _NasService() when $default != null:
return $default(_that.name,_that.port,_that.description,_that.isOnline,_that.updateAvailable,_that.containerName,_that.localDigest,_that.remoteDigest,_that.localVersion,_that.remoteLastUpdated,_that.imageTag);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _NasService implements NasService {
  const _NasService({required this.name, required this.port, required this.description, this.isOnline = false, this.updateAvailable = false, this.containerName, this.localDigest, this.remoteDigest, this.localVersion, this.remoteLastUpdated, this.imageTag});
  factory _NasService.fromJson(Map<String, dynamic> json) => _$NasServiceFromJson(json);

@override final  String name;
@override final  String port;
@override final  String description;
@override@JsonKey() final  bool isOnline;
@override@JsonKey() final  bool updateAvailable;
@override final  String? containerName;
@override final  String? localDigest;
@override final  String? remoteDigest;
@override final  String? localVersion;
@override final  String? remoteLastUpdated;
@override final  String? imageTag;

/// Create a copy of NasService
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$NasServiceCopyWith<_NasService> get copyWith => __$NasServiceCopyWithImpl<_NasService>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$NasServiceToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _NasService&&(identical(other.name, name) || other.name == name)&&(identical(other.port, port) || other.port == port)&&(identical(other.description, description) || other.description == description)&&(identical(other.isOnline, isOnline) || other.isOnline == isOnline)&&(identical(other.updateAvailable, updateAvailable) || other.updateAvailable == updateAvailable)&&(identical(other.containerName, containerName) || other.containerName == containerName)&&(identical(other.localDigest, localDigest) || other.localDigest == localDigest)&&(identical(other.remoteDigest, remoteDigest) || other.remoteDigest == remoteDigest)&&(identical(other.localVersion, localVersion) || other.localVersion == localVersion)&&(identical(other.remoteLastUpdated, remoteLastUpdated) || other.remoteLastUpdated == remoteLastUpdated)&&(identical(other.imageTag, imageTag) || other.imageTag == imageTag));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,name,port,description,isOnline,updateAvailable,containerName,localDigest,remoteDigest,localVersion,remoteLastUpdated,imageTag);

@override
String toString() {
  return 'NasService(name: $name, port: $port, description: $description, isOnline: $isOnline, updateAvailable: $updateAvailable, containerName: $containerName, localDigest: $localDigest, remoteDigest: $remoteDigest, localVersion: $localVersion, remoteLastUpdated: $remoteLastUpdated, imageTag: $imageTag)';
}


}

/// @nodoc
abstract mixin class _$NasServiceCopyWith<$Res> implements $NasServiceCopyWith<$Res> {
  factory _$NasServiceCopyWith(_NasService value, $Res Function(_NasService) _then) = __$NasServiceCopyWithImpl;
@override @useResult
$Res call({
 String name, String port, String description, bool isOnline, bool updateAvailable, String? containerName, String? localDigest, String? remoteDigest, String? localVersion, String? remoteLastUpdated, String? imageTag
});




}
/// @nodoc
class __$NasServiceCopyWithImpl<$Res>
    implements _$NasServiceCopyWith<$Res> {
  __$NasServiceCopyWithImpl(this._self, this._then);

  final _NasService _self;
  final $Res Function(_NasService) _then;

/// Create a copy of NasService
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? name = null,Object? port = null,Object? description = null,Object? isOnline = null,Object? updateAvailable = null,Object? containerName = freezed,Object? localDigest = freezed,Object? remoteDigest = freezed,Object? localVersion = freezed,Object? remoteLastUpdated = freezed,Object? imageTag = freezed,}) {
  return _then(_NasService(
name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,port: null == port ? _self.port : port // ignore: cast_nullable_to_non_nullable
as String,description: null == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String,isOnline: null == isOnline ? _self.isOnline : isOnline // ignore: cast_nullable_to_non_nullable
as bool,updateAvailable: null == updateAvailable ? _self.updateAvailable : updateAvailable // ignore: cast_nullable_to_non_nullable
as bool,containerName: freezed == containerName ? _self.containerName : containerName // ignore: cast_nullable_to_non_nullable
as String?,localDigest: freezed == localDigest ? _self.localDigest : localDigest // ignore: cast_nullable_to_non_nullable
as String?,remoteDigest: freezed == remoteDigest ? _self.remoteDigest : remoteDigest // ignore: cast_nullable_to_non_nullable
as String?,localVersion: freezed == localVersion ? _self.localVersion : localVersion // ignore: cast_nullable_to_non_nullable
as String?,remoteLastUpdated: freezed == remoteLastUpdated ? _self.remoteLastUpdated : remoteLastUpdated // ignore: cast_nullable_to_non_nullable
as String?,imageTag: freezed == imageTag ? _self.imageTag : imageTag // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

// dart format on
