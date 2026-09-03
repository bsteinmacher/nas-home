// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'lidarr.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$LidarrArtist {

 String? get id; String get artistName; String? get mbid; String? get status; bool get monitored; bool get isAdded; String? get remotePoster; String? get disambiguation;
/// Create a copy of LidarrArtist
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$LidarrArtistCopyWith<LidarrArtist> get copyWith => _$LidarrArtistCopyWithImpl<LidarrArtist>(this as LidarrArtist, _$identity);

  /// Serializes this LidarrArtist to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is LidarrArtist&&(identical(other.id, id) || other.id == id)&&(identical(other.artistName, artistName) || other.artistName == artistName)&&(identical(other.mbid, mbid) || other.mbid == mbid)&&(identical(other.status, status) || other.status == status)&&(identical(other.monitored, monitored) || other.monitored == monitored)&&(identical(other.isAdded, isAdded) || other.isAdded == isAdded)&&(identical(other.remotePoster, remotePoster) || other.remotePoster == remotePoster)&&(identical(other.disambiguation, disambiguation) || other.disambiguation == disambiguation));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,artistName,mbid,status,monitored,isAdded,remotePoster,disambiguation);

@override
String toString() {
  return 'LidarrArtist(id: $id, artistName: $artistName, mbid: $mbid, status: $status, monitored: $monitored, isAdded: $isAdded, remotePoster: $remotePoster, disambiguation: $disambiguation)';
}


}

/// @nodoc
abstract mixin class $LidarrArtistCopyWith<$Res>  {
  factory $LidarrArtistCopyWith(LidarrArtist value, $Res Function(LidarrArtist) _then) = _$LidarrArtistCopyWithImpl;
@useResult
$Res call({
 String? id, String artistName, String? mbid, String? status, bool monitored, bool isAdded, String? remotePoster, String? disambiguation
});




}
/// @nodoc
class _$LidarrArtistCopyWithImpl<$Res>
    implements $LidarrArtistCopyWith<$Res> {
  _$LidarrArtistCopyWithImpl(this._self, this._then);

  final LidarrArtist _self;
  final $Res Function(LidarrArtist) _then;

/// Create a copy of LidarrArtist
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = freezed,Object? artistName = null,Object? mbid = freezed,Object? status = freezed,Object? monitored = null,Object? isAdded = null,Object? remotePoster = freezed,Object? disambiguation = freezed,}) {
  return _then(_self.copyWith(
id: freezed == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String?,artistName: null == artistName ? _self.artistName : artistName // ignore: cast_nullable_to_non_nullable
as String,mbid: freezed == mbid ? _self.mbid : mbid // ignore: cast_nullable_to_non_nullable
as String?,status: freezed == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as String?,monitored: null == monitored ? _self.monitored : monitored // ignore: cast_nullable_to_non_nullable
as bool,isAdded: null == isAdded ? _self.isAdded : isAdded // ignore: cast_nullable_to_non_nullable
as bool,remotePoster: freezed == remotePoster ? _self.remotePoster : remotePoster // ignore: cast_nullable_to_non_nullable
as String?,disambiguation: freezed == disambiguation ? _self.disambiguation : disambiguation // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [LidarrArtist].
extension LidarrArtistPatterns on LidarrArtist {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _LidarrArtist value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _LidarrArtist() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _LidarrArtist value)  $default,){
final _that = this;
switch (_that) {
case _LidarrArtist():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _LidarrArtist value)?  $default,){
final _that = this;
switch (_that) {
case _LidarrArtist() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String? id,  String artistName,  String? mbid,  String? status,  bool monitored,  bool isAdded,  String? remotePoster,  String? disambiguation)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _LidarrArtist() when $default != null:
return $default(_that.id,_that.artistName,_that.mbid,_that.status,_that.monitored,_that.isAdded,_that.remotePoster,_that.disambiguation);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String? id,  String artistName,  String? mbid,  String? status,  bool monitored,  bool isAdded,  String? remotePoster,  String? disambiguation)  $default,) {final _that = this;
switch (_that) {
case _LidarrArtist():
return $default(_that.id,_that.artistName,_that.mbid,_that.status,_that.monitored,_that.isAdded,_that.remotePoster,_that.disambiguation);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String? id,  String artistName,  String? mbid,  String? status,  bool monitored,  bool isAdded,  String? remotePoster,  String? disambiguation)?  $default,) {final _that = this;
switch (_that) {
case _LidarrArtist() when $default != null:
return $default(_that.id,_that.artistName,_that.mbid,_that.status,_that.monitored,_that.isAdded,_that.remotePoster,_that.disambiguation);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _LidarrArtist implements LidarrArtist {
  const _LidarrArtist({required this.id, required this.artistName, required this.mbid, required this.status, this.monitored = false, this.isAdded = false, this.remotePoster, this.disambiguation});
  factory _LidarrArtist.fromJson(Map<String, dynamic> json) => _$LidarrArtistFromJson(json);

@override final  String? id;
@override final  String artistName;
@override final  String? mbid;
@override final  String? status;
@override@JsonKey() final  bool monitored;
@override@JsonKey() final  bool isAdded;
@override final  String? remotePoster;
@override final  String? disambiguation;

/// Create a copy of LidarrArtist
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$LidarrArtistCopyWith<_LidarrArtist> get copyWith => __$LidarrArtistCopyWithImpl<_LidarrArtist>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$LidarrArtistToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _LidarrArtist&&(identical(other.id, id) || other.id == id)&&(identical(other.artistName, artistName) || other.artistName == artistName)&&(identical(other.mbid, mbid) || other.mbid == mbid)&&(identical(other.status, status) || other.status == status)&&(identical(other.monitored, monitored) || other.monitored == monitored)&&(identical(other.isAdded, isAdded) || other.isAdded == isAdded)&&(identical(other.remotePoster, remotePoster) || other.remotePoster == remotePoster)&&(identical(other.disambiguation, disambiguation) || other.disambiguation == disambiguation));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,artistName,mbid,status,monitored,isAdded,remotePoster,disambiguation);

@override
String toString() {
  return 'LidarrArtist(id: $id, artistName: $artistName, mbid: $mbid, status: $status, monitored: $monitored, isAdded: $isAdded, remotePoster: $remotePoster, disambiguation: $disambiguation)';
}


}

/// @nodoc
abstract mixin class _$LidarrArtistCopyWith<$Res> implements $LidarrArtistCopyWith<$Res> {
  factory _$LidarrArtistCopyWith(_LidarrArtist value, $Res Function(_LidarrArtist) _then) = __$LidarrArtistCopyWithImpl;
@override @useResult
$Res call({
 String? id, String artistName, String? mbid, String? status, bool monitored, bool isAdded, String? remotePoster, String? disambiguation
});




}
/// @nodoc
class __$LidarrArtistCopyWithImpl<$Res>
    implements _$LidarrArtistCopyWith<$Res> {
  __$LidarrArtistCopyWithImpl(this._self, this._then);

  final _LidarrArtist _self;
  final $Res Function(_LidarrArtist) _then;

/// Create a copy of LidarrArtist
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = freezed,Object? artistName = null,Object? mbid = freezed,Object? status = freezed,Object? monitored = null,Object? isAdded = null,Object? remotePoster = freezed,Object? disambiguation = freezed,}) {
  return _then(_LidarrArtist(
id: freezed == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String?,artistName: null == artistName ? _self.artistName : artistName // ignore: cast_nullable_to_non_nullable
as String,mbid: freezed == mbid ? _self.mbid : mbid // ignore: cast_nullable_to_non_nullable
as String?,status: freezed == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as String?,monitored: null == monitored ? _self.monitored : monitored // ignore: cast_nullable_to_non_nullable
as bool,isAdded: null == isAdded ? _self.isAdded : isAdded // ignore: cast_nullable_to_non_nullable
as bool,remotePoster: freezed == remotePoster ? _self.remotePoster : remotePoster // ignore: cast_nullable_to_non_nullable
as String?,disambiguation: freezed == disambiguation ? _self.disambiguation : disambiguation // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}


/// @nodoc
mixin _$LidarrAlbum {

 String? get id; String get title; String get artistName; String? get releaseDate; String? get remoteCover; bool get monitored; bool get isInLibrary; bool get isQueued; int? get trackFileCount; int? get trackCount;
/// Create a copy of LidarrAlbum
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$LidarrAlbumCopyWith<LidarrAlbum> get copyWith => _$LidarrAlbumCopyWithImpl<LidarrAlbum>(this as LidarrAlbum, _$identity);

  /// Serializes this LidarrAlbum to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is LidarrAlbum&&(identical(other.id, id) || other.id == id)&&(identical(other.title, title) || other.title == title)&&(identical(other.artistName, artistName) || other.artistName == artistName)&&(identical(other.releaseDate, releaseDate) || other.releaseDate == releaseDate)&&(identical(other.remoteCover, remoteCover) || other.remoteCover == remoteCover)&&(identical(other.monitored, monitored) || other.monitored == monitored)&&(identical(other.isInLibrary, isInLibrary) || other.isInLibrary == isInLibrary)&&(identical(other.isQueued, isQueued) || other.isQueued == isQueued)&&(identical(other.trackFileCount, trackFileCount) || other.trackFileCount == trackFileCount)&&(identical(other.trackCount, trackCount) || other.trackCount == trackCount));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,title,artistName,releaseDate,remoteCover,monitored,isInLibrary,isQueued,trackFileCount,trackCount);

@override
String toString() {
  return 'LidarrAlbum(id: $id, title: $title, artistName: $artistName, releaseDate: $releaseDate, remoteCover: $remoteCover, monitored: $monitored, isInLibrary: $isInLibrary, isQueued: $isQueued, trackFileCount: $trackFileCount, trackCount: $trackCount)';
}


}

/// @nodoc
abstract mixin class $LidarrAlbumCopyWith<$Res>  {
  factory $LidarrAlbumCopyWith(LidarrAlbum value, $Res Function(LidarrAlbum) _then) = _$LidarrAlbumCopyWithImpl;
@useResult
$Res call({
 String? id, String title, String artistName, String? releaseDate, String? remoteCover, bool monitored, bool isInLibrary, bool isQueued, int? trackFileCount, int? trackCount
});




}
/// @nodoc
class _$LidarrAlbumCopyWithImpl<$Res>
    implements $LidarrAlbumCopyWith<$Res> {
  _$LidarrAlbumCopyWithImpl(this._self, this._then);

  final LidarrAlbum _self;
  final $Res Function(LidarrAlbum) _then;

/// Create a copy of LidarrAlbum
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = freezed,Object? title = null,Object? artistName = null,Object? releaseDate = freezed,Object? remoteCover = freezed,Object? monitored = null,Object? isInLibrary = null,Object? isQueued = null,Object? trackFileCount = freezed,Object? trackCount = freezed,}) {
  return _then(_self.copyWith(
id: freezed == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String?,title: null == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String,artistName: null == artistName ? _self.artistName : artistName // ignore: cast_nullable_to_non_nullable
as String,releaseDate: freezed == releaseDate ? _self.releaseDate : releaseDate // ignore: cast_nullable_to_non_nullable
as String?,remoteCover: freezed == remoteCover ? _self.remoteCover : remoteCover // ignore: cast_nullable_to_non_nullable
as String?,monitored: null == monitored ? _self.monitored : monitored // ignore: cast_nullable_to_non_nullable
as bool,isInLibrary: null == isInLibrary ? _self.isInLibrary : isInLibrary // ignore: cast_nullable_to_non_nullable
as bool,isQueued: null == isQueued ? _self.isQueued : isQueued // ignore: cast_nullable_to_non_nullable
as bool,trackFileCount: freezed == trackFileCount ? _self.trackFileCount : trackFileCount // ignore: cast_nullable_to_non_nullable
as int?,trackCount: freezed == trackCount ? _self.trackCount : trackCount // ignore: cast_nullable_to_non_nullable
as int?,
  ));
}

}


/// Adds pattern-matching-related methods to [LidarrAlbum].
extension LidarrAlbumPatterns on LidarrAlbum {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _LidarrAlbum value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _LidarrAlbum() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _LidarrAlbum value)  $default,){
final _that = this;
switch (_that) {
case _LidarrAlbum():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _LidarrAlbum value)?  $default,){
final _that = this;
switch (_that) {
case _LidarrAlbum() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String? id,  String title,  String artistName,  String? releaseDate,  String? remoteCover,  bool monitored,  bool isInLibrary,  bool isQueued,  int? trackFileCount,  int? trackCount)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _LidarrAlbum() when $default != null:
return $default(_that.id,_that.title,_that.artistName,_that.releaseDate,_that.remoteCover,_that.monitored,_that.isInLibrary,_that.isQueued,_that.trackFileCount,_that.trackCount);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String? id,  String title,  String artistName,  String? releaseDate,  String? remoteCover,  bool monitored,  bool isInLibrary,  bool isQueued,  int? trackFileCount,  int? trackCount)  $default,) {final _that = this;
switch (_that) {
case _LidarrAlbum():
return $default(_that.id,_that.title,_that.artistName,_that.releaseDate,_that.remoteCover,_that.monitored,_that.isInLibrary,_that.isQueued,_that.trackFileCount,_that.trackCount);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String? id,  String title,  String artistName,  String? releaseDate,  String? remoteCover,  bool monitored,  bool isInLibrary,  bool isQueued,  int? trackFileCount,  int? trackCount)?  $default,) {final _that = this;
switch (_that) {
case _LidarrAlbum() when $default != null:
return $default(_that.id,_that.title,_that.artistName,_that.releaseDate,_that.remoteCover,_that.monitored,_that.isInLibrary,_that.isQueued,_that.trackFileCount,_that.trackCount);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _LidarrAlbum implements LidarrAlbum {
  const _LidarrAlbum({required this.id, required this.title, required this.artistName, required this.releaseDate, required this.remoteCover, this.monitored = false, this.isInLibrary = false, this.isQueued = false, this.trackFileCount, this.trackCount});
  factory _LidarrAlbum.fromJson(Map<String, dynamic> json) => _$LidarrAlbumFromJson(json);

@override final  String? id;
@override final  String title;
@override final  String artistName;
@override final  String? releaseDate;
@override final  String? remoteCover;
@override@JsonKey() final  bool monitored;
@override@JsonKey() final  bool isInLibrary;
@override@JsonKey() final  bool isQueued;
@override final  int? trackFileCount;
@override final  int? trackCount;

/// Create a copy of LidarrAlbum
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$LidarrAlbumCopyWith<_LidarrAlbum> get copyWith => __$LidarrAlbumCopyWithImpl<_LidarrAlbum>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$LidarrAlbumToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _LidarrAlbum&&(identical(other.id, id) || other.id == id)&&(identical(other.title, title) || other.title == title)&&(identical(other.artistName, artistName) || other.artistName == artistName)&&(identical(other.releaseDate, releaseDate) || other.releaseDate == releaseDate)&&(identical(other.remoteCover, remoteCover) || other.remoteCover == remoteCover)&&(identical(other.monitored, monitored) || other.monitored == monitored)&&(identical(other.isInLibrary, isInLibrary) || other.isInLibrary == isInLibrary)&&(identical(other.isQueued, isQueued) || other.isQueued == isQueued)&&(identical(other.trackFileCount, trackFileCount) || other.trackFileCount == trackFileCount)&&(identical(other.trackCount, trackCount) || other.trackCount == trackCount));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,title,artistName,releaseDate,remoteCover,monitored,isInLibrary,isQueued,trackFileCount,trackCount);

@override
String toString() {
  return 'LidarrAlbum(id: $id, title: $title, artistName: $artistName, releaseDate: $releaseDate, remoteCover: $remoteCover, monitored: $monitored, isInLibrary: $isInLibrary, isQueued: $isQueued, trackFileCount: $trackFileCount, trackCount: $trackCount)';
}


}

/// @nodoc
abstract mixin class _$LidarrAlbumCopyWith<$Res> implements $LidarrAlbumCopyWith<$Res> {
  factory _$LidarrAlbumCopyWith(_LidarrAlbum value, $Res Function(_LidarrAlbum) _then) = __$LidarrAlbumCopyWithImpl;
@override @useResult
$Res call({
 String? id, String title, String artistName, String? releaseDate, String? remoteCover, bool monitored, bool isInLibrary, bool isQueued, int? trackFileCount, int? trackCount
});




}
/// @nodoc
class __$LidarrAlbumCopyWithImpl<$Res>
    implements _$LidarrAlbumCopyWith<$Res> {
  __$LidarrAlbumCopyWithImpl(this._self, this._then);

  final _LidarrAlbum _self;
  final $Res Function(_LidarrAlbum) _then;

/// Create a copy of LidarrAlbum
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = freezed,Object? title = null,Object? artistName = null,Object? releaseDate = freezed,Object? remoteCover = freezed,Object? monitored = null,Object? isInLibrary = null,Object? isQueued = null,Object? trackFileCount = freezed,Object? trackCount = freezed,}) {
  return _then(_LidarrAlbum(
id: freezed == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String?,title: null == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String,artistName: null == artistName ? _self.artistName : artistName // ignore: cast_nullable_to_non_nullable
as String,releaseDate: freezed == releaseDate ? _self.releaseDate : releaseDate // ignore: cast_nullable_to_non_nullable
as String?,remoteCover: freezed == remoteCover ? _self.remoteCover : remoteCover // ignore: cast_nullable_to_non_nullable
as String?,monitored: null == monitored ? _self.monitored : monitored // ignore: cast_nullable_to_non_nullable
as bool,isInLibrary: null == isInLibrary ? _self.isInLibrary : isInLibrary // ignore: cast_nullable_to_non_nullable
as bool,isQueued: null == isQueued ? _self.isQueued : isQueued // ignore: cast_nullable_to_non_nullable
as bool,trackFileCount: freezed == trackFileCount ? _self.trackFileCount : trackFileCount // ignore: cast_nullable_to_non_nullable
as int?,trackCount: freezed == trackCount ? _self.trackCount : trackCount // ignore: cast_nullable_to_non_nullable
as int?,
  ));
}


}

// dart format on
