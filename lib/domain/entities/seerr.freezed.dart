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
mixin _$Seerr {

 int get id; String get title; String? get overview; String? get posterPath; String get mediaType;// movie or tv
 String? get releaseDate; bool get isRequested; int? get status;
/// Create a copy of Seerr
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$SeerrCopyWith<Seerr> get copyWith => _$SeerrCopyWithImpl<Seerr>(this as Seerr, _$identity);

  /// Serializes this Seerr to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Seerr&&(identical(other.id, id) || other.id == id)&&(identical(other.title, title) || other.title == title)&&(identical(other.overview, overview) || other.overview == overview)&&(identical(other.posterPath, posterPath) || other.posterPath == posterPath)&&(identical(other.mediaType, mediaType) || other.mediaType == mediaType)&&(identical(other.releaseDate, releaseDate) || other.releaseDate == releaseDate)&&(identical(other.isRequested, isRequested) || other.isRequested == isRequested)&&(identical(other.status, status) || other.status == status));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,title,overview,posterPath,mediaType,releaseDate,isRequested,status);

@override
String toString() {
  return 'Seerr(id: $id, title: $title, overview: $overview, posterPath: $posterPath, mediaType: $mediaType, releaseDate: $releaseDate, isRequested: $isRequested, status: $status)';
}


}

/// @nodoc
abstract mixin class $SeerrCopyWith<$Res>  {
  factory $SeerrCopyWith(Seerr value, $Res Function(Seerr) _then) = _$SeerrCopyWithImpl;
@useResult
$Res call({
 int id, String title, String? overview, String? posterPath, String mediaType, String? releaseDate, bool isRequested, int? status
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
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? title = null,Object? overview = freezed,Object? posterPath = freezed,Object? mediaType = null,Object? releaseDate = freezed,Object? isRequested = null,Object? status = freezed,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,title: null == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String,overview: freezed == overview ? _self.overview : overview // ignore: cast_nullable_to_non_nullable
as String?,posterPath: freezed == posterPath ? _self.posterPath : posterPath // ignore: cast_nullable_to_non_nullable
as String?,mediaType: null == mediaType ? _self.mediaType : mediaType // ignore: cast_nullable_to_non_nullable
as String,releaseDate: freezed == releaseDate ? _self.releaseDate : releaseDate // ignore: cast_nullable_to_non_nullable
as String?,isRequested: null == isRequested ? _self.isRequested : isRequested // ignore: cast_nullable_to_non_nullable
as bool,status: freezed == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int id,  String title,  String? overview,  String? posterPath,  String mediaType,  String? releaseDate,  bool isRequested,  int? status)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _Seerr() when $default != null:
return $default(_that.id,_that.title,_that.overview,_that.posterPath,_that.mediaType,_that.releaseDate,_that.isRequested,_that.status);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int id,  String title,  String? overview,  String? posterPath,  String mediaType,  String? releaseDate,  bool isRequested,  int? status)  $default,) {final _that = this;
switch (_that) {
case _Seerr():
return $default(_that.id,_that.title,_that.overview,_that.posterPath,_that.mediaType,_that.releaseDate,_that.isRequested,_that.status);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int id,  String title,  String? overview,  String? posterPath,  String mediaType,  String? releaseDate,  bool isRequested,  int? status)?  $default,) {final _that = this;
switch (_that) {
case _Seerr() when $default != null:
return $default(_that.id,_that.title,_that.overview,_that.posterPath,_that.mediaType,_that.releaseDate,_that.isRequested,_that.status);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _Seerr implements Seerr {
  const _Seerr({required this.id, required this.title, required this.overview, required this.posterPath, required this.mediaType, required this.releaseDate, this.isRequested = false, this.status});
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
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Seerr&&(identical(other.id, id) || other.id == id)&&(identical(other.title, title) || other.title == title)&&(identical(other.overview, overview) || other.overview == overview)&&(identical(other.posterPath, posterPath) || other.posterPath == posterPath)&&(identical(other.mediaType, mediaType) || other.mediaType == mediaType)&&(identical(other.releaseDate, releaseDate) || other.releaseDate == releaseDate)&&(identical(other.isRequested, isRequested) || other.isRequested == isRequested)&&(identical(other.status, status) || other.status == status));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,title,overview,posterPath,mediaType,releaseDate,isRequested,status);

@override
String toString() {
  return 'Seerr(id: $id, title: $title, overview: $overview, posterPath: $posterPath, mediaType: $mediaType, releaseDate: $releaseDate, isRequested: $isRequested, status: $status)';
}


}

/// @nodoc
abstract mixin class _$SeerrCopyWith<$Res> implements $SeerrCopyWith<$Res> {
  factory _$SeerrCopyWith(_Seerr value, $Res Function(_Seerr) _then) = __$SeerrCopyWithImpl;
@override @useResult
$Res call({
 int id, String title, String? overview, String? posterPath, String mediaType, String? releaseDate, bool isRequested, int? status
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
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? title = null,Object? overview = freezed,Object? posterPath = freezed,Object? mediaType = null,Object? releaseDate = freezed,Object? isRequested = null,Object? status = freezed,}) {
  return _then(_Seerr(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,title: null == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String,overview: freezed == overview ? _self.overview : overview // ignore: cast_nullable_to_non_nullable
as String?,posterPath: freezed == posterPath ? _self.posterPath : posterPath // ignore: cast_nullable_to_non_nullable
as String?,mediaType: null == mediaType ? _self.mediaType : mediaType // ignore: cast_nullable_to_non_nullable
as String,releaseDate: freezed == releaseDate ? _self.releaseDate : releaseDate // ignore: cast_nullable_to_non_nullable
as String?,isRequested: null == isRequested ? _self.isRequested : isRequested // ignore: cast_nullable_to_non_nullable
as bool,status: freezed == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as int?,
  ));
}


}

// dart format on
