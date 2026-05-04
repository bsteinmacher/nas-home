// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'sonarr.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$SonarrSeries {

 int get id; String get title; int get year; String get status; bool get monitored; String? get remotePoster; int? get seasonCount;
/// Create a copy of SonarrSeries
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$SonarrSeriesCopyWith<SonarrSeries> get copyWith => _$SonarrSeriesCopyWithImpl<SonarrSeries>(this as SonarrSeries, _$identity);

  /// Serializes this SonarrSeries to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is SonarrSeries&&(identical(other.id, id) || other.id == id)&&(identical(other.title, title) || other.title == title)&&(identical(other.year, year) || other.year == year)&&(identical(other.status, status) || other.status == status)&&(identical(other.monitored, monitored) || other.monitored == monitored)&&(identical(other.remotePoster, remotePoster) || other.remotePoster == remotePoster)&&(identical(other.seasonCount, seasonCount) || other.seasonCount == seasonCount));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,title,year,status,monitored,remotePoster,seasonCount);

@override
String toString() {
  return 'SonarrSeries(id: $id, title: $title, year: $year, status: $status, monitored: $monitored, remotePoster: $remotePoster, seasonCount: $seasonCount)';
}


}

/// @nodoc
abstract mixin class $SonarrSeriesCopyWith<$Res>  {
  factory $SonarrSeriesCopyWith(SonarrSeries value, $Res Function(SonarrSeries) _then) = _$SonarrSeriesCopyWithImpl;
@useResult
$Res call({
 int id, String title, int year, String status, bool monitored, String? remotePoster, int? seasonCount
});




}
/// @nodoc
class _$SonarrSeriesCopyWithImpl<$Res>
    implements $SonarrSeriesCopyWith<$Res> {
  _$SonarrSeriesCopyWithImpl(this._self, this._then);

  final SonarrSeries _self;
  final $Res Function(SonarrSeries) _then;

/// Create a copy of SonarrSeries
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? title = null,Object? year = null,Object? status = null,Object? monitored = null,Object? remotePoster = freezed,Object? seasonCount = freezed,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,title: null == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String,year: null == year ? _self.year : year // ignore: cast_nullable_to_non_nullable
as int,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as String,monitored: null == monitored ? _self.monitored : monitored // ignore: cast_nullable_to_non_nullable
as bool,remotePoster: freezed == remotePoster ? _self.remotePoster : remotePoster // ignore: cast_nullable_to_non_nullable
as String?,seasonCount: freezed == seasonCount ? _self.seasonCount : seasonCount // ignore: cast_nullable_to_non_nullable
as int?,
  ));
}

}


/// Adds pattern-matching-related methods to [SonarrSeries].
extension SonarrSeriesPatterns on SonarrSeries {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _SonarrSeries value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _SonarrSeries() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _SonarrSeries value)  $default,){
final _that = this;
switch (_that) {
case _SonarrSeries():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _SonarrSeries value)?  $default,){
final _that = this;
switch (_that) {
case _SonarrSeries() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int id,  String title,  int year,  String status,  bool monitored,  String? remotePoster,  int? seasonCount)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _SonarrSeries() when $default != null:
return $default(_that.id,_that.title,_that.year,_that.status,_that.monitored,_that.remotePoster,_that.seasonCount);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int id,  String title,  int year,  String status,  bool monitored,  String? remotePoster,  int? seasonCount)  $default,) {final _that = this;
switch (_that) {
case _SonarrSeries():
return $default(_that.id,_that.title,_that.year,_that.status,_that.monitored,_that.remotePoster,_that.seasonCount);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int id,  String title,  int year,  String status,  bool monitored,  String? remotePoster,  int? seasonCount)?  $default,) {final _that = this;
switch (_that) {
case _SonarrSeries() when $default != null:
return $default(_that.id,_that.title,_that.year,_that.status,_that.monitored,_that.remotePoster,_that.seasonCount);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _SonarrSeries implements SonarrSeries {
  const _SonarrSeries({required this.id, required this.title, required this.year, required this.status, required this.monitored, this.remotePoster, this.seasonCount});
  factory _SonarrSeries.fromJson(Map<String, dynamic> json) => _$SonarrSeriesFromJson(json);

@override final  int id;
@override final  String title;
@override final  int year;
@override final  String status;
@override final  bool monitored;
@override final  String? remotePoster;
@override final  int? seasonCount;

/// Create a copy of SonarrSeries
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$SonarrSeriesCopyWith<_SonarrSeries> get copyWith => __$SonarrSeriesCopyWithImpl<_SonarrSeries>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$SonarrSeriesToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _SonarrSeries&&(identical(other.id, id) || other.id == id)&&(identical(other.title, title) || other.title == title)&&(identical(other.year, year) || other.year == year)&&(identical(other.status, status) || other.status == status)&&(identical(other.monitored, monitored) || other.monitored == monitored)&&(identical(other.remotePoster, remotePoster) || other.remotePoster == remotePoster)&&(identical(other.seasonCount, seasonCount) || other.seasonCount == seasonCount));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,title,year,status,monitored,remotePoster,seasonCount);

@override
String toString() {
  return 'SonarrSeries(id: $id, title: $title, year: $year, status: $status, monitored: $monitored, remotePoster: $remotePoster, seasonCount: $seasonCount)';
}


}

/// @nodoc
abstract mixin class _$SonarrSeriesCopyWith<$Res> implements $SonarrSeriesCopyWith<$Res> {
  factory _$SonarrSeriesCopyWith(_SonarrSeries value, $Res Function(_SonarrSeries) _then) = __$SonarrSeriesCopyWithImpl;
@override @useResult
$Res call({
 int id, String title, int year, String status, bool monitored, String? remotePoster, int? seasonCount
});




}
/// @nodoc
class __$SonarrSeriesCopyWithImpl<$Res>
    implements _$SonarrSeriesCopyWith<$Res> {
  __$SonarrSeriesCopyWithImpl(this._self, this._then);

  final _SonarrSeries _self;
  final $Res Function(_SonarrSeries) _then;

/// Create a copy of SonarrSeries
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? title = null,Object? year = null,Object? status = null,Object? monitored = null,Object? remotePoster = freezed,Object? seasonCount = freezed,}) {
  return _then(_SonarrSeries(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,title: null == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String,year: null == year ? _self.year : year // ignore: cast_nullable_to_non_nullable
as int,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as String,monitored: null == monitored ? _self.monitored : monitored // ignore: cast_nullable_to_non_nullable
as bool,remotePoster: freezed == remotePoster ? _self.remotePoster : remotePoster // ignore: cast_nullable_to_non_nullable
as String?,seasonCount: freezed == seasonCount ? _self.seasonCount : seasonCount // ignore: cast_nullable_to_non_nullable
as int?,
  ));
}


}

// dart format on
