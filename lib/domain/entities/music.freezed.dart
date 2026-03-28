// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'music.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$Artist {

 String? get id;// Lidarr ID (null se não adicionado)
 String get artistName; String? get mbid;// MusicBrainz ID
 String? get status; bool get monitored; bool get isAdded; String? get remotePoster;
/// Create a copy of Artist
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ArtistCopyWith<Artist> get copyWith => _$ArtistCopyWithImpl<Artist>(this as Artist, _$identity);

  /// Serializes this Artist to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Artist&&(identical(other.id, id) || other.id == id)&&(identical(other.artistName, artistName) || other.artistName == artistName)&&(identical(other.mbid, mbid) || other.mbid == mbid)&&(identical(other.status, status) || other.status == status)&&(identical(other.monitored, monitored) || other.monitored == monitored)&&(identical(other.isAdded, isAdded) || other.isAdded == isAdded)&&(identical(other.remotePoster, remotePoster) || other.remotePoster == remotePoster));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,artistName,mbid,status,monitored,isAdded,remotePoster);

@override
String toString() {
  return 'Artist(id: $id, artistName: $artistName, mbid: $mbid, status: $status, monitored: $monitored, isAdded: $isAdded, remotePoster: $remotePoster)';
}


}

/// @nodoc
abstract mixin class $ArtistCopyWith<$Res>  {
  factory $ArtistCopyWith(Artist value, $Res Function(Artist) _then) = _$ArtistCopyWithImpl;
@useResult
$Res call({
 String? id, String artistName, String? mbid, String? status, bool monitored, bool isAdded, String? remotePoster
});




}
/// @nodoc
class _$ArtistCopyWithImpl<$Res>
    implements $ArtistCopyWith<$Res> {
  _$ArtistCopyWithImpl(this._self, this._then);

  final Artist _self;
  final $Res Function(Artist) _then;

/// Create a copy of Artist
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = freezed,Object? artistName = null,Object? mbid = freezed,Object? status = freezed,Object? monitored = null,Object? isAdded = null,Object? remotePoster = freezed,}) {
  return _then(_self.copyWith(
id: freezed == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String?,artistName: null == artistName ? _self.artistName : artistName // ignore: cast_nullable_to_non_nullable
as String,mbid: freezed == mbid ? _self.mbid : mbid // ignore: cast_nullable_to_non_nullable
as String?,status: freezed == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as String?,monitored: null == monitored ? _self.monitored : monitored // ignore: cast_nullable_to_non_nullable
as bool,isAdded: null == isAdded ? _self.isAdded : isAdded // ignore: cast_nullable_to_non_nullable
as bool,remotePoster: freezed == remotePoster ? _self.remotePoster : remotePoster // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [Artist].
extension ArtistPatterns on Artist {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _Artist value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _Artist() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _Artist value)  $default,){
final _that = this;
switch (_that) {
case _Artist():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _Artist value)?  $default,){
final _that = this;
switch (_that) {
case _Artist() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String? id,  String artistName,  String? mbid,  String? status,  bool monitored,  bool isAdded,  String? remotePoster)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _Artist() when $default != null:
return $default(_that.id,_that.artistName,_that.mbid,_that.status,_that.monitored,_that.isAdded,_that.remotePoster);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String? id,  String artistName,  String? mbid,  String? status,  bool monitored,  bool isAdded,  String? remotePoster)  $default,) {final _that = this;
switch (_that) {
case _Artist():
return $default(_that.id,_that.artistName,_that.mbid,_that.status,_that.monitored,_that.isAdded,_that.remotePoster);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String? id,  String artistName,  String? mbid,  String? status,  bool monitored,  bool isAdded,  String? remotePoster)?  $default,) {final _that = this;
switch (_that) {
case _Artist() when $default != null:
return $default(_that.id,_that.artistName,_that.mbid,_that.status,_that.monitored,_that.isAdded,_that.remotePoster);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _Artist implements Artist {
  const _Artist({required this.id, required this.artistName, required this.mbid, required this.status, this.monitored = false, this.isAdded = false, this.remotePoster});
  factory _Artist.fromJson(Map<String, dynamic> json) => _$ArtistFromJson(json);

@override final  String? id;
// Lidarr ID (null se não adicionado)
@override final  String artistName;
@override final  String? mbid;
// MusicBrainz ID
@override final  String? status;
@override@JsonKey() final  bool monitored;
@override@JsonKey() final  bool isAdded;
@override final  String? remotePoster;

/// Create a copy of Artist
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ArtistCopyWith<_Artist> get copyWith => __$ArtistCopyWithImpl<_Artist>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$ArtistToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Artist&&(identical(other.id, id) || other.id == id)&&(identical(other.artistName, artistName) || other.artistName == artistName)&&(identical(other.mbid, mbid) || other.mbid == mbid)&&(identical(other.status, status) || other.status == status)&&(identical(other.monitored, monitored) || other.monitored == monitored)&&(identical(other.isAdded, isAdded) || other.isAdded == isAdded)&&(identical(other.remotePoster, remotePoster) || other.remotePoster == remotePoster));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,artistName,mbid,status,monitored,isAdded,remotePoster);

@override
String toString() {
  return 'Artist(id: $id, artistName: $artistName, mbid: $mbid, status: $status, monitored: $monitored, isAdded: $isAdded, remotePoster: $remotePoster)';
}


}

/// @nodoc
abstract mixin class _$ArtistCopyWith<$Res> implements $ArtistCopyWith<$Res> {
  factory _$ArtistCopyWith(_Artist value, $Res Function(_Artist) _then) = __$ArtistCopyWithImpl;
@override @useResult
$Res call({
 String? id, String artistName, String? mbid, String? status, bool monitored, bool isAdded, String? remotePoster
});




}
/// @nodoc
class __$ArtistCopyWithImpl<$Res>
    implements _$ArtistCopyWith<$Res> {
  __$ArtistCopyWithImpl(this._self, this._then);

  final _Artist _self;
  final $Res Function(_Artist) _then;

/// Create a copy of Artist
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = freezed,Object? artistName = null,Object? mbid = freezed,Object? status = freezed,Object? monitored = null,Object? isAdded = null,Object? remotePoster = freezed,}) {
  return _then(_Artist(
id: freezed == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String?,artistName: null == artistName ? _self.artistName : artistName // ignore: cast_nullable_to_non_nullable
as String,mbid: freezed == mbid ? _self.mbid : mbid // ignore: cast_nullable_to_non_nullable
as String?,status: freezed == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as String?,monitored: null == monitored ? _self.monitored : monitored // ignore: cast_nullable_to_non_nullable
as bool,isAdded: null == isAdded ? _self.isAdded : isAdded // ignore: cast_nullable_to_non_nullable
as bool,remotePoster: freezed == remotePoster ? _self.remotePoster : remotePoster // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}


/// @nodoc
mixin _$Album {

 String? get id; String get title; String get artistName; String? get releaseDate; String? get remoteCover; bool get monitored;
/// Create a copy of Album
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$AlbumCopyWith<Album> get copyWith => _$AlbumCopyWithImpl<Album>(this as Album, _$identity);

  /// Serializes this Album to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Album&&(identical(other.id, id) || other.id == id)&&(identical(other.title, title) || other.title == title)&&(identical(other.artistName, artistName) || other.artistName == artistName)&&(identical(other.releaseDate, releaseDate) || other.releaseDate == releaseDate)&&(identical(other.remoteCover, remoteCover) || other.remoteCover == remoteCover)&&(identical(other.monitored, monitored) || other.monitored == monitored));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,title,artistName,releaseDate,remoteCover,monitored);

@override
String toString() {
  return 'Album(id: $id, title: $title, artistName: $artistName, releaseDate: $releaseDate, remoteCover: $remoteCover, monitored: $monitored)';
}


}

/// @nodoc
abstract mixin class $AlbumCopyWith<$Res>  {
  factory $AlbumCopyWith(Album value, $Res Function(Album) _then) = _$AlbumCopyWithImpl;
@useResult
$Res call({
 String? id, String title, String artistName, String? releaseDate, String? remoteCover, bool monitored
});




}
/// @nodoc
class _$AlbumCopyWithImpl<$Res>
    implements $AlbumCopyWith<$Res> {
  _$AlbumCopyWithImpl(this._self, this._then);

  final Album _self;
  final $Res Function(Album) _then;

/// Create a copy of Album
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = freezed,Object? title = null,Object? artistName = null,Object? releaseDate = freezed,Object? remoteCover = freezed,Object? monitored = null,}) {
  return _then(_self.copyWith(
id: freezed == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String?,title: null == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String,artistName: null == artistName ? _self.artistName : artistName // ignore: cast_nullable_to_non_nullable
as String,releaseDate: freezed == releaseDate ? _self.releaseDate : releaseDate // ignore: cast_nullable_to_non_nullable
as String?,remoteCover: freezed == remoteCover ? _self.remoteCover : remoteCover // ignore: cast_nullable_to_non_nullable
as String?,monitored: null == monitored ? _self.monitored : monitored // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}

}


/// Adds pattern-matching-related methods to [Album].
extension AlbumPatterns on Album {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _Album value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _Album() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _Album value)  $default,){
final _that = this;
switch (_that) {
case _Album():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _Album value)?  $default,){
final _that = this;
switch (_that) {
case _Album() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String? id,  String title,  String artistName,  String? releaseDate,  String? remoteCover,  bool monitored)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _Album() when $default != null:
return $default(_that.id,_that.title,_that.artistName,_that.releaseDate,_that.remoteCover,_that.monitored);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String? id,  String title,  String artistName,  String? releaseDate,  String? remoteCover,  bool monitored)  $default,) {final _that = this;
switch (_that) {
case _Album():
return $default(_that.id,_that.title,_that.artistName,_that.releaseDate,_that.remoteCover,_that.monitored);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String? id,  String title,  String artistName,  String? releaseDate,  String? remoteCover,  bool monitored)?  $default,) {final _that = this;
switch (_that) {
case _Album() when $default != null:
return $default(_that.id,_that.title,_that.artistName,_that.releaseDate,_that.remoteCover,_that.monitored);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _Album implements Album {
  const _Album({required this.id, required this.title, required this.artistName, required this.releaseDate, required this.remoteCover, this.monitored = false});
  factory _Album.fromJson(Map<String, dynamic> json) => _$AlbumFromJson(json);

@override final  String? id;
@override final  String title;
@override final  String artistName;
@override final  String? releaseDate;
@override final  String? remoteCover;
@override@JsonKey() final  bool monitored;

/// Create a copy of Album
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$AlbumCopyWith<_Album> get copyWith => __$AlbumCopyWithImpl<_Album>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$AlbumToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Album&&(identical(other.id, id) || other.id == id)&&(identical(other.title, title) || other.title == title)&&(identical(other.artistName, artistName) || other.artistName == artistName)&&(identical(other.releaseDate, releaseDate) || other.releaseDate == releaseDate)&&(identical(other.remoteCover, remoteCover) || other.remoteCover == remoteCover)&&(identical(other.monitored, monitored) || other.monitored == monitored));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,title,artistName,releaseDate,remoteCover,monitored);

@override
String toString() {
  return 'Album(id: $id, title: $title, artistName: $artistName, releaseDate: $releaseDate, remoteCover: $remoteCover, monitored: $monitored)';
}


}

/// @nodoc
abstract mixin class _$AlbumCopyWith<$Res> implements $AlbumCopyWith<$Res> {
  factory _$AlbumCopyWith(_Album value, $Res Function(_Album) _then) = __$AlbumCopyWithImpl;
@override @useResult
$Res call({
 String? id, String title, String artistName, String? releaseDate, String? remoteCover, bool monitored
});




}
/// @nodoc
class __$AlbumCopyWithImpl<$Res>
    implements _$AlbumCopyWith<$Res> {
  __$AlbumCopyWithImpl(this._self, this._then);

  final _Album _self;
  final $Res Function(_Album) _then;

/// Create a copy of Album
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = freezed,Object? title = null,Object? artistName = null,Object? releaseDate = freezed,Object? remoteCover = freezed,Object? monitored = null,}) {
  return _then(_Album(
id: freezed == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String?,title: null == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String,artistName: null == artistName ? _self.artistName : artistName // ignore: cast_nullable_to_non_nullable
as String,releaseDate: freezed == releaseDate ? _self.releaseDate : releaseDate // ignore: cast_nullable_to_non_nullable
as String?,remoteCover: freezed == remoteCover ? _self.remoteCover : remoteCover // ignore: cast_nullable_to_non_nullable
as String?,monitored: null == monitored ? _self.monitored : monitored // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}


}

// dart format on
