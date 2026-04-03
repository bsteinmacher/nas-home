// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'seerr_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$SeerrEvent {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is SeerrEvent);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'SeerrEvent()';
}


}

/// @nodoc
class $SeerrEventCopyWith<$Res>  {
$SeerrEventCopyWith(SeerrEvent _, $Res Function(SeerrEvent) __);
}


/// Adds pattern-matching-related methods to [SeerrEvent].
extension SeerrEventPatterns on SeerrEvent {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( SearchRequested value)?  searchRequested,TResult Function( TrendingRequested value)?  trendingRequested,TResult Function( RequestSeerr value)?  mediaRequested,required TResult orElse(),}){
final _that = this;
switch (_that) {
case SearchRequested() when searchRequested != null:
return searchRequested(_that);case TrendingRequested() when trendingRequested != null:
return trendingRequested(_that);case RequestSeerr() when mediaRequested != null:
return mediaRequested(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( SearchRequested value)  searchRequested,required TResult Function( TrendingRequested value)  trendingRequested,required TResult Function( RequestSeerr value)  mediaRequested,}){
final _that = this;
switch (_that) {
case SearchRequested():
return searchRequested(_that);case TrendingRequested():
return trendingRequested(_that);case RequestSeerr():
return mediaRequested(_that);case _:
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( SearchRequested value)?  searchRequested,TResult? Function( TrendingRequested value)?  trendingRequested,TResult? Function( RequestSeerr value)?  mediaRequested,}){
final _that = this;
switch (_that) {
case SearchRequested() when searchRequested != null:
return searchRequested(_that);case TrendingRequested() when trendingRequested != null:
return trendingRequested(_that);case RequestSeerr() when mediaRequested != null:
return mediaRequested(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function( String query)?  searchRequested,TResult Function()?  trendingRequested,TResult Function( int mediaId,  String mediaType)?  mediaRequested,required TResult orElse(),}) {final _that = this;
switch (_that) {
case SearchRequested() when searchRequested != null:
return searchRequested(_that.query);case TrendingRequested() when trendingRequested != null:
return trendingRequested();case RequestSeerr() when mediaRequested != null:
return mediaRequested(_that.mediaId,_that.mediaType);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function( String query)  searchRequested,required TResult Function()  trendingRequested,required TResult Function( int mediaId,  String mediaType)  mediaRequested,}) {final _that = this;
switch (_that) {
case SearchRequested():
return searchRequested(_that.query);case TrendingRequested():
return trendingRequested();case RequestSeerr():
return mediaRequested(_that.mediaId,_that.mediaType);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function( String query)?  searchRequested,TResult? Function()?  trendingRequested,TResult? Function( int mediaId,  String mediaType)?  mediaRequested,}) {final _that = this;
switch (_that) {
case SearchRequested() when searchRequested != null:
return searchRequested(_that.query);case TrendingRequested() when trendingRequested != null:
return trendingRequested();case RequestSeerr() when mediaRequested != null:
return mediaRequested(_that.mediaId,_that.mediaType);case _:
  return null;

}
}

}

/// @nodoc


class SearchRequested implements SeerrEvent {
  const SearchRequested(this.query);
  

 final  String query;

/// Create a copy of SeerrEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$SearchRequestedCopyWith<SearchRequested> get copyWith => _$SearchRequestedCopyWithImpl<SearchRequested>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is SearchRequested&&(identical(other.query, query) || other.query == query));
}


@override
int get hashCode => Object.hash(runtimeType,query);

@override
String toString() {
  return 'SeerrEvent.searchRequested(query: $query)';
}


}

/// @nodoc
abstract mixin class $SearchRequestedCopyWith<$Res> implements $SeerrEventCopyWith<$Res> {
  factory $SearchRequestedCopyWith(SearchRequested value, $Res Function(SearchRequested) _then) = _$SearchRequestedCopyWithImpl;
@useResult
$Res call({
 String query
});




}
/// @nodoc
class _$SearchRequestedCopyWithImpl<$Res>
    implements $SearchRequestedCopyWith<$Res> {
  _$SearchRequestedCopyWithImpl(this._self, this._then);

  final SearchRequested _self;
  final $Res Function(SearchRequested) _then;

/// Create a copy of SeerrEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? query = null,}) {
  return _then(SearchRequested(
null == query ? _self.query : query // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

/// @nodoc


class TrendingRequested implements SeerrEvent {
  const TrendingRequested();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is TrendingRequested);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'SeerrEvent.trendingRequested()';
}


}




/// @nodoc


class RequestSeerr implements SeerrEvent {
  const RequestSeerr(this.mediaId, this.mediaType);
  

 final  int mediaId;
 final  String mediaType;

/// Create a copy of SeerrEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$RequestSeerrCopyWith<RequestSeerr> get copyWith => _$RequestSeerrCopyWithImpl<RequestSeerr>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is RequestSeerr&&(identical(other.mediaId, mediaId) || other.mediaId == mediaId)&&(identical(other.mediaType, mediaType) || other.mediaType == mediaType));
}


@override
int get hashCode => Object.hash(runtimeType,mediaId,mediaType);

@override
String toString() {
  return 'SeerrEvent.mediaRequested(mediaId: $mediaId, mediaType: $mediaType)';
}


}

/// @nodoc
abstract mixin class $RequestSeerrCopyWith<$Res> implements $SeerrEventCopyWith<$Res> {
  factory $RequestSeerrCopyWith(RequestSeerr value, $Res Function(RequestSeerr) _then) = _$RequestSeerrCopyWithImpl;
@useResult
$Res call({
 int mediaId, String mediaType
});




}
/// @nodoc
class _$RequestSeerrCopyWithImpl<$Res>
    implements $RequestSeerrCopyWith<$Res> {
  _$RequestSeerrCopyWithImpl(this._self, this._then);

  final RequestSeerr _self;
  final $Res Function(RequestSeerr) _then;

/// Create a copy of SeerrEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? mediaId = null,Object? mediaType = null,}) {
  return _then(RequestSeerr(
null == mediaId ? _self.mediaId : mediaId // ignore: cast_nullable_to_non_nullable
as int,null == mediaType ? _self.mediaType : mediaType // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

/// @nodoc
mixin _$SeerrState {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is SeerrState);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'SeerrState()';
}


}

/// @nodoc
class $SeerrStateCopyWith<$Res>  {
$SeerrStateCopyWith(SeerrState _, $Res Function(SeerrState) __);
}


/// Adds pattern-matching-related methods to [SeerrState].
extension SeerrStatePatterns on SeerrState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( SeerrInitial value)?  initial,TResult Function( SeerrLoading value)?  loading,TResult Function( SeerrLoaded value)?  loaded,TResult Function( SeerrError value)?  error,TResult Function( RequestSuccess value)?  requestSuccess,required TResult orElse(),}){
final _that = this;
switch (_that) {
case SeerrInitial() when initial != null:
return initial(_that);case SeerrLoading() when loading != null:
return loading(_that);case SeerrLoaded() when loaded != null:
return loaded(_that);case SeerrError() when error != null:
return error(_that);case RequestSuccess() when requestSuccess != null:
return requestSuccess(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( SeerrInitial value)  initial,required TResult Function( SeerrLoading value)  loading,required TResult Function( SeerrLoaded value)  loaded,required TResult Function( SeerrError value)  error,required TResult Function( RequestSuccess value)  requestSuccess,}){
final _that = this;
switch (_that) {
case SeerrInitial():
return initial(_that);case SeerrLoading():
return loading(_that);case SeerrLoaded():
return loaded(_that);case SeerrError():
return error(_that);case RequestSuccess():
return requestSuccess(_that);case _:
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( SeerrInitial value)?  initial,TResult? Function( SeerrLoading value)?  loading,TResult? Function( SeerrLoaded value)?  loaded,TResult? Function( SeerrError value)?  error,TResult? Function( RequestSuccess value)?  requestSuccess,}){
final _that = this;
switch (_that) {
case SeerrInitial() when initial != null:
return initial(_that);case SeerrLoading() when loading != null:
return loading(_that);case SeerrLoaded() when loaded != null:
return loaded(_that);case SeerrError() when error != null:
return error(_that);case RequestSuccess() when requestSuccess != null:
return requestSuccess(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function()?  initial,TResult Function()?  loading,TResult Function( List<Seerr> seerrList)?  loaded,TResult Function( String message)?  error,TResult Function()?  requestSuccess,required TResult orElse(),}) {final _that = this;
switch (_that) {
case SeerrInitial() when initial != null:
return initial();case SeerrLoading() when loading != null:
return loading();case SeerrLoaded() when loaded != null:
return loaded(_that.seerrList);case SeerrError() when error != null:
return error(_that.message);case RequestSuccess() when requestSuccess != null:
return requestSuccess();case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function()  initial,required TResult Function()  loading,required TResult Function( List<Seerr> seerrList)  loaded,required TResult Function( String message)  error,required TResult Function()  requestSuccess,}) {final _that = this;
switch (_that) {
case SeerrInitial():
return initial();case SeerrLoading():
return loading();case SeerrLoaded():
return loaded(_that.seerrList);case SeerrError():
return error(_that.message);case RequestSuccess():
return requestSuccess();case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function()?  initial,TResult? Function()?  loading,TResult? Function( List<Seerr> seerrList)?  loaded,TResult? Function( String message)?  error,TResult? Function()?  requestSuccess,}) {final _that = this;
switch (_that) {
case SeerrInitial() when initial != null:
return initial();case SeerrLoading() when loading != null:
return loading();case SeerrLoaded() when loaded != null:
return loaded(_that.seerrList);case SeerrError() when error != null:
return error(_that.message);case RequestSuccess() when requestSuccess != null:
return requestSuccess();case _:
  return null;

}
}

}

/// @nodoc


class SeerrInitial implements SeerrState {
  const SeerrInitial();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is SeerrInitial);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'SeerrState.initial()';
}


}




/// @nodoc


class SeerrLoading implements SeerrState {
  const SeerrLoading();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is SeerrLoading);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'SeerrState.loading()';
}


}




/// @nodoc


class SeerrLoaded implements SeerrState {
  const SeerrLoaded(final  List<Seerr> seerrList): _seerrList = seerrList;
  

 final  List<Seerr> _seerrList;
 List<Seerr> get seerrList {
  if (_seerrList is EqualUnmodifiableListView) return _seerrList;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_seerrList);
}


/// Create a copy of SeerrState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$SeerrLoadedCopyWith<SeerrLoaded> get copyWith => _$SeerrLoadedCopyWithImpl<SeerrLoaded>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is SeerrLoaded&&const DeepCollectionEquality().equals(other._seerrList, _seerrList));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(_seerrList));

@override
String toString() {
  return 'SeerrState.loaded(seerrList: $seerrList)';
}


}

/// @nodoc
abstract mixin class $SeerrLoadedCopyWith<$Res> implements $SeerrStateCopyWith<$Res> {
  factory $SeerrLoadedCopyWith(SeerrLoaded value, $Res Function(SeerrLoaded) _then) = _$SeerrLoadedCopyWithImpl;
@useResult
$Res call({
 List<Seerr> seerrList
});




}
/// @nodoc
class _$SeerrLoadedCopyWithImpl<$Res>
    implements $SeerrLoadedCopyWith<$Res> {
  _$SeerrLoadedCopyWithImpl(this._self, this._then);

  final SeerrLoaded _self;
  final $Res Function(SeerrLoaded) _then;

/// Create a copy of SeerrState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? seerrList = null,}) {
  return _then(SeerrLoaded(
null == seerrList ? _self._seerrList : seerrList // ignore: cast_nullable_to_non_nullable
as List<Seerr>,
  ));
}


}

/// @nodoc


class SeerrError implements SeerrState {
  const SeerrError(this.message);
  

 final  String message;

/// Create a copy of SeerrState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$SeerrErrorCopyWith<SeerrError> get copyWith => _$SeerrErrorCopyWithImpl<SeerrError>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is SeerrError&&(identical(other.message, message) || other.message == message));
}


@override
int get hashCode => Object.hash(runtimeType,message);

@override
String toString() {
  return 'SeerrState.error(message: $message)';
}


}

/// @nodoc
abstract mixin class $SeerrErrorCopyWith<$Res> implements $SeerrStateCopyWith<$Res> {
  factory $SeerrErrorCopyWith(SeerrError value, $Res Function(SeerrError) _then) = _$SeerrErrorCopyWithImpl;
@useResult
$Res call({
 String message
});




}
/// @nodoc
class _$SeerrErrorCopyWithImpl<$Res>
    implements $SeerrErrorCopyWith<$Res> {
  _$SeerrErrorCopyWithImpl(this._self, this._then);

  final SeerrError _self;
  final $Res Function(SeerrError) _then;

/// Create a copy of SeerrState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? message = null,}) {
  return _then(SeerrError(
null == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

/// @nodoc


class RequestSuccess implements SeerrState {
  const RequestSuccess();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is RequestSuccess);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'SeerrState.requestSuccess()';
}


}




// dart format on
