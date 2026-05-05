// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'seerr.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$SeerrSeason {

 int get seasonNumber; int get episodeCount; String? get airDate; String? get overview; String? get posterPath;
/// Create a copy of SeerrSeason
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$SeerrSeasonCopyWith<SeerrSeason> get copyWith => _$SeerrSeasonCopyWithImpl<SeerrSeason>(this as SeerrSeason, _$identity);

  /// Serializes this SeerrSeason to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is SeerrSeason&&(identical(other.seasonNumber, seasonNumber) || other.seasonNumber == seasonNumber)&&(identical(other.episodeCount, episodeCount) || other.episodeCount == episodeCount)&&(identical(other.airDate, airDate) || other.airDate == airDate)&&(identical(other.overview, overview) || other.overview == overview)&&(identical(other.posterPath, posterPath) || other.posterPath == posterPath));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,seasonNumber,episodeCount,airDate,overview,posterPath);

@override
String toString() {
  return 'SeerrSeason(seasonNumber: $seasonNumber, episodeCount: $episodeCount, airDate: $airDate, overview: $overview, posterPath: $posterPath)';
}


}

/// @nodoc
abstract mixin class $SeerrSeasonCopyWith<$Res>  {
  factory $SeerrSeasonCopyWith(SeerrSeason value, $Res Function(SeerrSeason) _then) = _$SeerrSeasonCopyWithImpl;
@useResult
$Res call({
 int seasonNumber, int episodeCount, String? airDate, String? overview, String? posterPath
});




}
/// @nodoc
class _$SeerrSeasonCopyWithImpl<$Res>
    implements $SeerrSeasonCopyWith<$Res> {
  _$SeerrSeasonCopyWithImpl(this._self, this._then);

  final SeerrSeason _self;
  final $Res Function(SeerrSeason) _then;

/// Create a copy of SeerrSeason
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? seasonNumber = null,Object? episodeCount = null,Object? airDate = freezed,Object? overview = freezed,Object? posterPath = freezed,}) {
  return _then(_self.copyWith(
seasonNumber: null == seasonNumber ? _self.seasonNumber : seasonNumber // ignore: cast_nullable_to_non_nullable
as int,episodeCount: null == episodeCount ? _self.episodeCount : episodeCount // ignore: cast_nullable_to_non_nullable
as int,airDate: freezed == airDate ? _self.airDate : airDate // ignore: cast_nullable_to_non_nullable
as String?,overview: freezed == overview ? _self.overview : overview // ignore: cast_nullable_to_non_nullable
as String?,posterPath: freezed == posterPath ? _self.posterPath : posterPath // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [SeerrSeason].
extension SeerrSeasonPatterns on SeerrSeason {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _SeerrSeason value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _SeerrSeason() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _SeerrSeason value)  $default,){
final _that = this;
switch (_that) {
case _SeerrSeason():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _SeerrSeason value)?  $default,){
final _that = this;
switch (_that) {
case _SeerrSeason() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int seasonNumber,  int episodeCount,  String? airDate,  String? overview,  String? posterPath)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _SeerrSeason() when $default != null:
return $default(_that.seasonNumber,_that.episodeCount,_that.airDate,_that.overview,_that.posterPath);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int seasonNumber,  int episodeCount,  String? airDate,  String? overview,  String? posterPath)  $default,) {final _that = this;
switch (_that) {
case _SeerrSeason():
return $default(_that.seasonNumber,_that.episodeCount,_that.airDate,_that.overview,_that.posterPath);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int seasonNumber,  int episodeCount,  String? airDate,  String? overview,  String? posterPath)?  $default,) {final _that = this;
switch (_that) {
case _SeerrSeason() when $default != null:
return $default(_that.seasonNumber,_that.episodeCount,_that.airDate,_that.overview,_that.posterPath);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _SeerrSeason implements SeerrSeason {
  const _SeerrSeason({required this.seasonNumber, required this.episodeCount, required this.airDate, required this.overview, required this.posterPath});
  factory _SeerrSeason.fromJson(Map<String, dynamic> json) => _$SeerrSeasonFromJson(json);

@override final  int seasonNumber;
@override final  int episodeCount;
@override final  String? airDate;
@override final  String? overview;
@override final  String? posterPath;

/// Create a copy of SeerrSeason
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$SeerrSeasonCopyWith<_SeerrSeason> get copyWith => __$SeerrSeasonCopyWithImpl<_SeerrSeason>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$SeerrSeasonToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _SeerrSeason&&(identical(other.seasonNumber, seasonNumber) || other.seasonNumber == seasonNumber)&&(identical(other.episodeCount, episodeCount) || other.episodeCount == episodeCount)&&(identical(other.airDate, airDate) || other.airDate == airDate)&&(identical(other.overview, overview) || other.overview == overview)&&(identical(other.posterPath, posterPath) || other.posterPath == posterPath));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,seasonNumber,episodeCount,airDate,overview,posterPath);

@override
String toString() {
  return 'SeerrSeason(seasonNumber: $seasonNumber, episodeCount: $episodeCount, airDate: $airDate, overview: $overview, posterPath: $posterPath)';
}


}

/// @nodoc
abstract mixin class _$SeerrSeasonCopyWith<$Res> implements $SeerrSeasonCopyWith<$Res> {
  factory _$SeerrSeasonCopyWith(_SeerrSeason value, $Res Function(_SeerrSeason) _then) = __$SeerrSeasonCopyWithImpl;
@override @useResult
$Res call({
 int seasonNumber, int episodeCount, String? airDate, String? overview, String? posterPath
});




}
/// @nodoc
class __$SeerrSeasonCopyWithImpl<$Res>
    implements _$SeerrSeasonCopyWith<$Res> {
  __$SeerrSeasonCopyWithImpl(this._self, this._then);

  final _SeerrSeason _self;
  final $Res Function(_SeerrSeason) _then;

/// Create a copy of SeerrSeason
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? seasonNumber = null,Object? episodeCount = null,Object? airDate = freezed,Object? overview = freezed,Object? posterPath = freezed,}) {
  return _then(_SeerrSeason(
seasonNumber: null == seasonNumber ? _self.seasonNumber : seasonNumber // ignore: cast_nullable_to_non_nullable
as int,episodeCount: null == episodeCount ? _self.episodeCount : episodeCount // ignore: cast_nullable_to_non_nullable
as int,airDate: freezed == airDate ? _self.airDate : airDate // ignore: cast_nullable_to_non_nullable
as String?,overview: freezed == overview ? _self.overview : overview // ignore: cast_nullable_to_non_nullable
as String?,posterPath: freezed == posterPath ? _self.posterPath : posterPath // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}


/// @nodoc
mixin _$Seerr {

 int get id; String get title; String? get overview; String? get posterPath; String get mediaType;// movie or tv
 String? get releaseDate; bool get isRequested; int? get status; List<SeerrSeason>? get seasons; int? get tvdbId; int? get tmdbId;
/// Create a copy of Seerr
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$SeerrCopyWith<Seerr> get copyWith => _$SeerrCopyWithImpl<Seerr>(this as Seerr, _$identity);

  /// Serializes this Seerr to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Seerr&&(identical(other.id, id) || other.id == id)&&(identical(other.title, title) || other.title == title)&&(identical(other.overview, overview) || other.overview == overview)&&(identical(other.posterPath, posterPath) || other.posterPath == posterPath)&&(identical(other.mediaType, mediaType) || other.mediaType == mediaType)&&(identical(other.releaseDate, releaseDate) || other.releaseDate == releaseDate)&&(identical(other.isRequested, isRequested) || other.isRequested == isRequested)&&(identical(other.status, status) || other.status == status)&&const DeepCollectionEquality().equals(other.seasons, seasons)&&(identical(other.tvdbId, tvdbId) || other.tvdbId == tvdbId)&&(identical(other.tmdbId, tmdbId) || other.tmdbId == tmdbId));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,title,overview,posterPath,mediaType,releaseDate,isRequested,status,const DeepCollectionEquality().hash(seasons),tvdbId,tmdbId);

@override
String toString() {
  return 'Seerr(id: $id, title: $title, overview: $overview, posterPath: $posterPath, mediaType: $mediaType, releaseDate: $releaseDate, isRequested: $isRequested, status: $status, seasons: $seasons, tvdbId: $tvdbId, tmdbId: $tmdbId)';
}


}

/// @nodoc
abstract mixin class $SeerrCopyWith<$Res>  {
  factory $SeerrCopyWith(Seerr value, $Res Function(Seerr) _then) = _$SeerrCopyWithImpl;
@useResult
$Res call({
 int id, String title, String? overview, String? posterPath, String mediaType, String? releaseDate, bool isRequested, int? status, List<SeerrSeason>? seasons, int? tvdbId, int? tmdbId
});




}
/// @nodoc
class _$SeerrCopyWithImpl<$Res>
    implements $SeerrCopyWith<$Res> {
  _$SeerrCopyWithImpl(this._self, this._then);

  final Seerr _self;
  final $Res Function(Seerr) _then;

/// Create a copy of Seerr
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? title = null,Object? overview = freezed,Object? posterPath = freezed,Object? mediaType = null,Object? releaseDate = freezed,Object? isRequested = null,Object? status = freezed,Object? seasons = freezed,Object? tvdbId = freezed,Object? tmdbId = freezed,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,title: null == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String,overview: freezed == overview ? _self.overview : overview // ignore: cast_nullable_to_non_nullable
as String?,posterPath: freezed == posterPath ? _self.posterPath : posterPath // ignore: cast_nullable_to_non_nullable
as String?,mediaType: null == mediaType ? _self.mediaType : mediaType // ignore: cast_nullable_to_non_nullable
as String,releaseDate: freezed == releaseDate ? _self.releaseDate : releaseDate // ignore: cast_nullable_to_non_nullable
as String?,isRequested: null == isRequested ? _self.isRequested : isRequested // ignore: cast_nullable_to_non_nullable
as bool,status: freezed == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as int?,seasons: freezed == seasons ? _self.seasons : seasons // ignore: cast_nullable_to_non_nullable
as List<SeerrSeason>?,tvdbId: freezed == tvdbId ? _self.tvdbId : tvdbId // ignore: cast_nullable_to_non_nullable
as int?,tmdbId: freezed == tmdbId ? _self.tmdbId : tmdbId // ignore: cast_nullable_to_non_nullable
as int?,
  ));
}

}


/// Adds pattern-matching-related methods to [Seerr].
extension SeerrPatterns on Seerr {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _Seerr value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _Seerr() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _Seerr value)  $default,){
final _that = this;
switch (_that) {
case _Seerr():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _Seerr value)?  $default,){
final _that = this;
switch (_that) {
case _Seerr() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int id,  String title,  String? overview,  String? posterPath,  String mediaType,  String? releaseDate,  bool isRequested,  int? status,  List<SeerrSeason>? seasons,  int? tvdbId,  int? tmdbId)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _Seerr() when $default != null:
return $default(_that.id,_that.title,_that.overview,_that.posterPath,_that.mediaType,_that.releaseDate,_that.isRequested,_that.status,_that.seasons,_that.tvdbId,_that.tmdbId);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int id,  String title,  String? overview,  String? posterPath,  String mediaType,  String? releaseDate,  bool isRequested,  int? status,  List<SeerrSeason>? seasons,  int? tvdbId,  int? tmdbId)  $default,) {final _that = this;
switch (_that) {
case _Seerr():
return $default(_that.id,_that.title,_that.overview,_that.posterPath,_that.mediaType,_that.releaseDate,_that.isRequested,_that.status,_that.seasons,_that.tvdbId,_that.tmdbId);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int id,  String title,  String? overview,  String? posterPath,  String mediaType,  String? releaseDate,  bool isRequested,  int? status,  List<SeerrSeason>? seasons,  int? tvdbId,  int? tmdbId)?  $default,) {final _that = this;
switch (_that) {
case _Seerr() when $default != null:
return $default(_that.id,_that.title,_that.overview,_that.posterPath,_that.mediaType,_that.releaseDate,_that.isRequested,_that.status,_that.seasons,_that.tvdbId,_that.tmdbId);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _Seerr implements Seerr {
  const _Seerr({required this.id, required this.title, required this.overview, required this.posterPath, required this.mediaType, required this.releaseDate, this.isRequested = false, this.status, final  List<SeerrSeason>? seasons, this.tvdbId, this.tmdbId}): _seasons = seasons;
  factory _Seerr.fromJson(Map<String, dynamic> json) => _$SeerrFromJson(json);

@override final  int id;
@override final  String title;
@override final  String? overview;
@override final  String? posterPath;
@override final  String mediaType;
// movie or tv
@override final  String? releaseDate;
@override@JsonKey() final  bool isRequested;
@override final  int? status;
 final  List<SeerrSeason>? _seasons;
@override List<SeerrSeason>? get seasons {
  final value = _seasons;
  if (value == null) return null;
  if (_seasons is EqualUnmodifiableListView) return _seasons;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(value);
}

@override final  int? tvdbId;
@override final  int? tmdbId;

/// Create a copy of Seerr
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$SeerrCopyWith<_Seerr> get copyWith => __$SeerrCopyWithImpl<_Seerr>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$SeerrToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Seerr&&(identical(other.id, id) || other.id == id)&&(identical(other.title, title) || other.title == title)&&(identical(other.overview, overview) || other.overview == overview)&&(identical(other.posterPath, posterPath) || other.posterPath == posterPath)&&(identical(other.mediaType, mediaType) || other.mediaType == mediaType)&&(identical(other.releaseDate, releaseDate) || other.releaseDate == releaseDate)&&(identical(other.isRequested, isRequested) || other.isRequested == isRequested)&&(identical(other.status, status) || other.status == status)&&const DeepCollectionEquality().equals(other._seasons, _seasons)&&(identical(other.tvdbId, tvdbId) || other.tvdbId == tvdbId)&&(identical(other.tmdbId, tmdbId) || other.tmdbId == tmdbId));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,title,overview,posterPath,mediaType,releaseDate,isRequested,status,const DeepCollectionEquality().hash(_seasons),tvdbId,tmdbId);

@override
String toString() {
  return 'Seerr(id: $id, title: $title, overview: $overview, posterPath: $posterPath, mediaType: $mediaType, releaseDate: $releaseDate, isRequested: $isRequested, status: $status, seasons: $seasons, tvdbId: $tvdbId, tmdbId: $tmdbId)';
}


}

/// @nodoc
abstract mixin class _$SeerrCopyWith<$Res> implements $SeerrCopyWith<$Res> {
  factory _$SeerrCopyWith(_Seerr value, $Res Function(_Seerr) _then) = __$SeerrCopyWithImpl;
@override @useResult
$Res call({
 int id, String title, String? overview, String? posterPath, String mediaType, String? releaseDate, bool isRequested, int? status, List<SeerrSeason>? seasons, int? tvdbId, int? tmdbId
});




}
/// @nodoc
class __$SeerrCopyWithImpl<$Res>
    implements _$SeerrCopyWith<$Res> {
  __$SeerrCopyWithImpl(this._self, this._then);

  final _Seerr _self;
  final $Res Function(_Seerr) _then;

/// Create a copy of Seerr
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? title = null,Object? overview = freezed,Object? posterPath = freezed,Object? mediaType = null,Object? releaseDate = freezed,Object? isRequested = null,Object? status = freezed,Object? seasons = freezed,Object? tvdbId = freezed,Object? tmdbId = freezed,}) {
  return _then(_Seerr(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,title: null == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String,overview: freezed == overview ? _self.overview : overview // ignore: cast_nullable_to_non_nullable
as String?,posterPath: freezed == posterPath ? _self.posterPath : posterPath // ignore: cast_nullable_to_non_nullable
as String?,mediaType: null == mediaType ? _self.mediaType : mediaType // ignore: cast_nullable_to_non_nullable
as String,releaseDate: freezed == releaseDate ? _self.releaseDate : releaseDate // ignore: cast_nullable_to_non_nullable
as String?,isRequested: null == isRequested ? _self.isRequested : isRequested // ignore: cast_nullable_to_non_nullable
as bool,status: freezed == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as int?,seasons: freezed == seasons ? _self._seasons : seasons // ignore: cast_nullable_to_non_nullable
as List<SeerrSeason>?,tvdbId: freezed == tvdbId ? _self.tvdbId : tvdbId // ignore: cast_nullable_to_non_nullable
as int?,tmdbId: freezed == tmdbId ? _self.tmdbId : tmdbId // ignore: cast_nullable_to_non_nullable
as int?,
  ));
}


}

// dart format on
