// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'media_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$MediaEvent {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is MediaEvent);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'MediaEvent()';
}


}

/// @nodoc
class $MediaEventCopyWith<$Res>  {
$MediaEventCopyWith(MediaEvent _, $Res Function(MediaEvent) __);
}


/// Adds pattern-matching-related methods to [MediaEvent].
extension MediaEventPatterns on MediaEvent {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( SearchRequested value)?  searchRequested,TResult Function( TrendingRequested value)?  trendingRequested,TResult Function( RequestMedia value)?  mediaRequested,required TResult orElse(),}){
final _that = this;
switch (_that) {
case SearchRequested() when searchRequested != null:
return searchRequested(_that);case TrendingRequested() when trendingRequested != null:
return trendingRequested(_that);case RequestMedia() when mediaRequested != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( SearchRequested value)  searchRequested,required TResult Function( TrendingRequested value)  trendingRequested,required TResult Function( RequestMedia value)  mediaRequested,}){
final _that = this;
switch (_that) {
case SearchRequested():
return searchRequested(_that);case TrendingRequested():
return trendingRequested(_that);case RequestMedia():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( SearchRequested value)?  searchRequested,TResult? Function( TrendingRequested value)?  trendingRequested,TResult? Function( RequestMedia value)?  mediaRequested,}){
final _that = this;
switch (_that) {
case SearchRequested() when searchRequested != null:
return searchRequested(_that);case TrendingRequested() when trendingRequested != null:
return trendingRequested(_that);case RequestMedia() when mediaRequested != null:
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
return trendingRequested();case RequestMedia() when mediaRequested != null:
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
return trendingRequested();case RequestMedia():
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
return trendingRequested();case RequestMedia() when mediaRequested != null:
return mediaRequested(_that.mediaId,_that.mediaType);case _:
  return null;

}
}

}

/// @nodoc


class SearchRequested implements MediaEvent {
  const SearchRequested(this.query);
  

 final  String query;

/// Create a copy of MediaEvent
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
  return 'MediaEvent.searchRequested(query: $query)';
}


}

/// @nodoc
abstract mixin class $SearchRequestedCopyWith<$Res> implements $MediaEventCopyWith<$Res> {
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

/// Create a copy of MediaEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? query = null,}) {
  return _then(SearchRequested(
null == query ? _self.query : query // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

/// @nodoc


class TrendingRequested implements MediaEvent {
  const TrendingRequested();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is TrendingRequested);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'MediaEvent.trendingRequested()';
}


}




/// @nodoc


class RequestMedia implements MediaEvent {
  const RequestMedia(this.mediaId, this.mediaType);
  

 final  int mediaId;
 final  String mediaType;

/// Create a copy of MediaEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$RequestMediaCopyWith<RequestMedia> get copyWith => _$RequestMediaCopyWithImpl<RequestMedia>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is RequestMedia&&(identical(other.mediaId, mediaId) || other.mediaId == mediaId)&&(identical(other.mediaType, mediaType) || other.mediaType == mediaType));
}


@override
int get hashCode => Object.hash(runtimeType,mediaId,mediaType);

@override
String toString() {
  return 'MediaEvent.mediaRequested(mediaId: $mediaId, mediaType: $mediaType)';
}


}

/// @nodoc
abstract mixin class $RequestMediaCopyWith<$Res> implements $MediaEventCopyWith<$Res> {
  factory $RequestMediaCopyWith(RequestMedia value, $Res Function(RequestMedia) _then) = _$RequestMediaCopyWithImpl;
@useResult
$Res call({
 int mediaId, String mediaType
});




}
/// @nodoc
class _$RequestMediaCopyWithImpl<$Res>
    implements $RequestMediaCopyWith<$Res> {
  _$RequestMediaCopyWithImpl(this._self, this._then);

  final RequestMedia _self;
  final $Res Function(RequestMedia) _then;

/// Create a copy of MediaEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? mediaId = null,Object? mediaType = null,}) {
  return _then(RequestMedia(
null == mediaId ? _self.mediaId : mediaId // ignore: cast_nullable_to_non_nullable
as int,null == mediaType ? _self.mediaType : mediaType // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

/// @nodoc
mixin _$MediaState {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is MediaState);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'MediaState()';
}


}

/// @nodoc
class $MediaStateCopyWith<$Res>  {
$MediaStateCopyWith(MediaState _, $Res Function(MediaState) __);
}


/// Adds pattern-matching-related methods to [MediaState].
extension MediaStatePatterns on MediaState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( MediaInitial value)?  initial,TResult Function( MediaLoading value)?  loading,TResult Function( MediaLoaded value)?  loaded,TResult Function( MediaError value)?  error,TResult Function( RequestSuccess value)?  requestSuccess,required TResult orElse(),}){
final _that = this;
switch (_that) {
case MediaInitial() when initial != null:
return initial(_that);case MediaLoading() when loading != null:
return loading(_that);case MediaLoaded() when loaded != null:
return loaded(_that);case MediaError() when error != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( MediaInitial value)  initial,required TResult Function( MediaLoading value)  loading,required TResult Function( MediaLoaded value)  loaded,required TResult Function( MediaError value)  error,required TResult Function( RequestSuccess value)  requestSuccess,}){
final _that = this;
switch (_that) {
case MediaInitial():
return initial(_that);case MediaLoading():
return loading(_that);case MediaLoaded():
return loaded(_that);case MediaError():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( MediaInitial value)?  initial,TResult? Function( MediaLoading value)?  loading,TResult? Function( MediaLoaded value)?  loaded,TResult? Function( MediaError value)?  error,TResult? Function( RequestSuccess value)?  requestSuccess,}){
final _that = this;
switch (_that) {
case MediaInitial() when initial != null:
return initial(_that);case MediaLoading() when loading != null:
return loading(_that);case MediaLoaded() when loaded != null:
return loaded(_that);case MediaError() when error != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function()?  initial,TResult Function()?  loading,TResult Function( List<Media> mediaList)?  loaded,TResult Function( String message)?  error,TResult Function()?  requestSuccess,required TResult orElse(),}) {final _that = this;
switch (_that) {
case MediaInitial() when initial != null:
return initial();case MediaLoading() when loading != null:
return loading();case MediaLoaded() when loaded != null:
return loaded(_that.mediaList);case MediaError() when error != null:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function()  initial,required TResult Function()  loading,required TResult Function( List<Media> mediaList)  loaded,required TResult Function( String message)  error,required TResult Function()  requestSuccess,}) {final _that = this;
switch (_that) {
case MediaInitial():
return initial();case MediaLoading():
return loading();case MediaLoaded():
return loaded(_that.mediaList);case MediaError():
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function()?  initial,TResult? Function()?  loading,TResult? Function( List<Media> mediaList)?  loaded,TResult? Function( String message)?  error,TResult? Function()?  requestSuccess,}) {final _that = this;
switch (_that) {
case MediaInitial() when initial != null:
return initial();case MediaLoading() when loading != null:
return loading();case MediaLoaded() when loaded != null:
return loaded(_that.mediaList);case MediaError() when error != null:
return error(_that.message);case RequestSuccess() when requestSuccess != null:
return requestSuccess();case _:
  return null;

}
}

}

/// @nodoc


class MediaInitial implements MediaState {
  const MediaInitial();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is MediaInitial);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'MediaState.initial()';
}


}




/// @nodoc


class MediaLoading implements MediaState {
  const MediaLoading();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is MediaLoading);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'MediaState.loading()';
}


}




/// @nodoc


class MediaLoaded implements MediaState {
  const MediaLoaded(final  List<Media> mediaList): _mediaList = mediaList;
  

 final  List<Media> _mediaList;
 List<Media> get mediaList {
  if (_mediaList is EqualUnmodifiableListView) return _mediaList;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_mediaList);
}


/// Create a copy of MediaState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$MediaLoadedCopyWith<MediaLoaded> get copyWith => _$MediaLoadedCopyWithImpl<MediaLoaded>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is MediaLoaded&&const DeepCollectionEquality().equals(other._mediaList, _mediaList));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(_mediaList));

@override
String toString() {
  return 'MediaState.loaded(mediaList: $mediaList)';
}


}

/// @nodoc
abstract mixin class $MediaLoadedCopyWith<$Res> implements $MediaStateCopyWith<$Res> {
  factory $MediaLoadedCopyWith(MediaLoaded value, $Res Function(MediaLoaded) _then) = _$MediaLoadedCopyWithImpl;
@useResult
$Res call({
 List<Media> mediaList
});




}
/// @nodoc
class _$MediaLoadedCopyWithImpl<$Res>
    implements $MediaLoadedCopyWith<$Res> {
  _$MediaLoadedCopyWithImpl(this._self, this._then);

  final MediaLoaded _self;
  final $Res Function(MediaLoaded) _then;

/// Create a copy of MediaState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? mediaList = null,}) {
  return _then(MediaLoaded(
null == mediaList ? _self._mediaList : mediaList // ignore: cast_nullable_to_non_nullable
as List<Media>,
  ));
}


}

/// @nodoc


class MediaError implements MediaState {
  const MediaError(this.message);
  

 final  String message;

/// Create a copy of MediaState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$MediaErrorCopyWith<MediaError> get copyWith => _$MediaErrorCopyWithImpl<MediaError>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is MediaError&&(identical(other.message, message) || other.message == message));
}


@override
int get hashCode => Object.hash(runtimeType,message);

@override
String toString() {
  return 'MediaState.error(message: $message)';
}


}

/// @nodoc
abstract mixin class $MediaErrorCopyWith<$Res> implements $MediaStateCopyWith<$Res> {
  factory $MediaErrorCopyWith(MediaError value, $Res Function(MediaError) _then) = _$MediaErrorCopyWithImpl;
@useResult
$Res call({
 String message
});




}
/// @nodoc
class _$MediaErrorCopyWithImpl<$Res>
    implements $MediaErrorCopyWith<$Res> {
  _$MediaErrorCopyWithImpl(this._self, this._then);

  final MediaError _self;
  final $Res Function(MediaError) _then;

/// Create a copy of MediaState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? message = null,}) {
  return _then(MediaError(
null == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

/// @nodoc


class RequestSuccess implements MediaState {
  const RequestSuccess();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is RequestSuccess);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'MediaState.requestSuccess()';
}


}




// dart format on
