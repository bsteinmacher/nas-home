// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'radarr.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$RadarrMovie {

 int get id; String get title; int get year; String get status; bool get monitored; String? get remotePoster; int? get sizeOnDisk;
/// Create a copy of RadarrMovie
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$RadarrMovieCopyWith<RadarrMovie> get copyWith => _$RadarrMovieCopyWithImpl<RadarrMovie>(this as RadarrMovie, _$identity);

  /// Serializes this RadarrMovie to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is RadarrMovie&&(identical(other.id, id) || other.id == id)&&(identical(other.title, title) || other.title == title)&&(identical(other.year, year) || other.year == year)&&(identical(other.status, status) || other.status == status)&&(identical(other.monitored, monitored) || other.monitored == monitored)&&(identical(other.remotePoster, remotePoster) || other.remotePoster == remotePoster)&&(identical(other.sizeOnDisk, sizeOnDisk) || other.sizeOnDisk == sizeOnDisk));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,title,year,status,monitored,remotePoster,sizeOnDisk);

@override
String toString() {
  return 'RadarrMovie(id: $id, title: $title, year: $year, status: $status, monitored: $monitored, remotePoster: $remotePoster, sizeOnDisk: $sizeOnDisk)';
}


}

/// @nodoc
abstract mixin class $RadarrMovieCopyWith<$Res>  {
  factory $RadarrMovieCopyWith(RadarrMovie value, $Res Function(RadarrMovie) _then) = _$RadarrMovieCopyWithImpl;
@useResult
$Res call({
 int id, String title, int year, String status, bool monitored, String? remotePoster, int? sizeOnDisk
});




}
/// @nodoc
class _$RadarrMovieCopyWithImpl<$Res>
    implements $RadarrMovieCopyWith<$Res> {
  _$RadarrMovieCopyWithImpl(this._self, this._then);

  final RadarrMovie _self;
  final $Res Function(RadarrMovie) _then;

/// Create a copy of RadarrMovie
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? title = null,Object? year = null,Object? status = null,Object? monitored = null,Object? remotePoster = freezed,Object? sizeOnDisk = freezed,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,title: null == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String,year: null == year ? _self.year : year // ignore: cast_nullable_to_non_nullable
as int,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as String,monitored: null == monitored ? _self.monitored : monitored // ignore: cast_nullable_to_non_nullable
as bool,remotePoster: freezed == remotePoster ? _self.remotePoster : remotePoster // ignore: cast_nullable_to_non_nullable
as String?,sizeOnDisk: freezed == sizeOnDisk ? _self.sizeOnDisk : sizeOnDisk // ignore: cast_nullable_to_non_nullable
as int?,
  ));
}

}


/// Adds pattern-matching-related methods to [RadarrMovie].
extension RadarrMoviePatterns on RadarrMovie {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _RadarrMovie value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _RadarrMovie() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _RadarrMovie value)  $default,){
final _that = this;
switch (_that) {
case _RadarrMovie():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _RadarrMovie value)?  $default,){
final _that = this;
switch (_that) {
case _RadarrMovie() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int id,  String title,  int year,  String status,  bool monitored,  String? remotePoster,  int? sizeOnDisk)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _RadarrMovie() when $default != null:
return $default(_that.id,_that.title,_that.year,_that.status,_that.monitored,_that.remotePoster,_that.sizeOnDisk);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int id,  String title,  int year,  String status,  bool monitored,  String? remotePoster,  int? sizeOnDisk)  $default,) {final _that = this;
switch (_that) {
case _RadarrMovie():
return $default(_that.id,_that.title,_that.year,_that.status,_that.monitored,_that.remotePoster,_that.sizeOnDisk);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int id,  String title,  int year,  String status,  bool monitored,  String? remotePoster,  int? sizeOnDisk)?  $default,) {final _that = this;
switch (_that) {
case _RadarrMovie() when $default != null:
return $default(_that.id,_that.title,_that.year,_that.status,_that.monitored,_that.remotePoster,_that.sizeOnDisk);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _RadarrMovie implements RadarrMovie {
  const _RadarrMovie({required this.id, required this.title, required this.year, required this.status, required this.monitored, this.remotePoster, this.sizeOnDisk});
  factory _RadarrMovie.fromJson(Map<String, dynamic> json) => _$RadarrMovieFromJson(json);

@override final  int id;
@override final  String title;
@override final  int year;
@override final  String status;
@override final  bool monitored;
@override final  String? remotePoster;
@override final  int? sizeOnDisk;

/// Create a copy of RadarrMovie
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$RadarrMovieCopyWith<_RadarrMovie> get copyWith => __$RadarrMovieCopyWithImpl<_RadarrMovie>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$RadarrMovieToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _RadarrMovie&&(identical(other.id, id) || other.id == id)&&(identical(other.title, title) || other.title == title)&&(identical(other.year, year) || other.year == year)&&(identical(other.status, status) || other.status == status)&&(identical(other.monitored, monitored) || other.monitored == monitored)&&(identical(other.remotePoster, remotePoster) || other.remotePoster == remotePoster)&&(identical(other.sizeOnDisk, sizeOnDisk) || other.sizeOnDisk == sizeOnDisk));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,title,year,status,monitored,remotePoster,sizeOnDisk);

@override
String toString() {
  return 'RadarrMovie(id: $id, title: $title, year: $year, status: $status, monitored: $monitored, remotePoster: $remotePoster, sizeOnDisk: $sizeOnDisk)';
}


}

/// @nodoc
abstract mixin class _$RadarrMovieCopyWith<$Res> implements $RadarrMovieCopyWith<$Res> {
  factory _$RadarrMovieCopyWith(_RadarrMovie value, $Res Function(_RadarrMovie) _then) = __$RadarrMovieCopyWithImpl;
@override @useResult
$Res call({
 int id, String title, int year, String status, bool monitored, String? remotePoster, int? sizeOnDisk
});




}
/// @nodoc
class __$RadarrMovieCopyWithImpl<$Res>
    implements _$RadarrMovieCopyWith<$Res> {
  __$RadarrMovieCopyWithImpl(this._self, this._then);

  final _RadarrMovie _self;
  final $Res Function(_RadarrMovie) _then;

/// Create a copy of RadarrMovie
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? title = null,Object? year = null,Object? status = null,Object? monitored = null,Object? remotePoster = freezed,Object? sizeOnDisk = freezed,}) {
  return _then(_RadarrMovie(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,title: null == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String,year: null == year ? _self.year : year // ignore: cast_nullable_to_non_nullable
as int,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as String,monitored: null == monitored ? _self.monitored : monitored // ignore: cast_nullable_to_non_nullable
as bool,remotePoster: freezed == remotePoster ? _self.remotePoster : remotePoster // ignore: cast_nullable_to_non_nullable
as String?,sizeOnDisk: freezed == sizeOnDisk ? _self.sizeOnDisk : sizeOnDisk // ignore: cast_nullable_to_non_nullable
as int?,
  ));
}


}

// dart format on
