// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'lidarr_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$LidarrEvent {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is LidarrEvent);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'LidarrEvent()';
}


}

/// @nodoc
class $LidarrEventCopyWith<$Res>  {
$LidarrEventCopyWith(LidarrEvent _, $Res Function(LidarrEvent) __);
}


/// Adds pattern-matching-related methods to [LidarrEvent].
extension LidarrEventPatterns on LidarrEvent {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( SearchRequested value)?  searchRequested,TResult Function( ArtistRequested value)?  artistRequested,TResult Function( AlbumsRequested value)?  albumsRequested,required TResult orElse(),}){
final _that = this;
switch (_that) {
case SearchRequested() when searchRequested != null:
return searchRequested(_that);case ArtistRequested() when artistRequested != null:
return artistRequested(_that);case AlbumsRequested() when albumsRequested != null:
return albumsRequested(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( SearchRequested value)  searchRequested,required TResult Function( ArtistRequested value)  artistRequested,required TResult Function( AlbumsRequested value)  albumsRequested,}){
final _that = this;
switch (_that) {
case SearchRequested():
return searchRequested(_that);case ArtistRequested():
return artistRequested(_that);case AlbumsRequested():
return albumsRequested(_that);case _:
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( SearchRequested value)?  searchRequested,TResult? Function( ArtistRequested value)?  artistRequested,TResult? Function( AlbumsRequested value)?  albumsRequested,}){
final _that = this;
switch (_that) {
case SearchRequested() when searchRequested != null:
return searchRequested(_that);case ArtistRequested() when artistRequested != null:
return artistRequested(_that);case AlbumsRequested() when albumsRequested != null:
return albumsRequested(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function( String query)?  searchRequested,TResult Function( LidarrArtist artist)?  artistRequested,TResult Function( String artistId)?  albumsRequested,required TResult orElse(),}) {final _that = this;
switch (_that) {
case SearchRequested() when searchRequested != null:
return searchRequested(_that.query);case ArtistRequested() when artistRequested != null:
return artistRequested(_that.artist);case AlbumsRequested() when albumsRequested != null:
return albumsRequested(_that.artistId);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function( String query)  searchRequested,required TResult Function( LidarrArtist artist)  artistRequested,required TResult Function( String artistId)  albumsRequested,}) {final _that = this;
switch (_that) {
case SearchRequested():
return searchRequested(_that.query);case ArtistRequested():
return artistRequested(_that.artist);case AlbumsRequested():
return albumsRequested(_that.artistId);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function( String query)?  searchRequested,TResult? Function( LidarrArtist artist)?  artistRequested,TResult? Function( String artistId)?  albumsRequested,}) {final _that = this;
switch (_that) {
case SearchRequested() when searchRequested != null:
return searchRequested(_that.query);case ArtistRequested() when artistRequested != null:
return artistRequested(_that.artist);case AlbumsRequested() when albumsRequested != null:
return albumsRequested(_that.artistId);case _:
  return null;

}
}

}

/// @nodoc


class SearchRequested implements LidarrEvent {
  const SearchRequested(this.query);
  

 final  String query;

/// Create a copy of LidarrEvent
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
  return 'LidarrEvent.searchRequested(query: $query)';
}


}

/// @nodoc
abstract mixin class $SearchRequestedCopyWith<$Res> implements $LidarrEventCopyWith<$Res> {
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

/// Create a copy of LidarrEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? query = null,}) {
  return _then(SearchRequested(
null == query ? _self.query : query // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

/// @nodoc


class ArtistRequested implements LidarrEvent {
  const ArtistRequested(this.artist);
  

 final  LidarrArtist artist;

/// Create a copy of LidarrEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ArtistRequestedCopyWith<ArtistRequested> get copyWith => _$ArtistRequestedCopyWithImpl<ArtistRequested>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ArtistRequested&&(identical(other.artist, artist) || other.artist == artist));
}


@override
int get hashCode => Object.hash(runtimeType,artist);

@override
String toString() {
  return 'LidarrEvent.artistRequested(artist: $artist)';
}


}

/// @nodoc
abstract mixin class $ArtistRequestedCopyWith<$Res> implements $LidarrEventCopyWith<$Res> {
  factory $ArtistRequestedCopyWith(ArtistRequested value, $Res Function(ArtistRequested) _then) = _$ArtistRequestedCopyWithImpl;
@useResult
$Res call({
 LidarrArtist artist
});


$LidarrArtistCopyWith<$Res> get artist;

}
/// @nodoc
class _$ArtistRequestedCopyWithImpl<$Res>
    implements $ArtistRequestedCopyWith<$Res> {
  _$ArtistRequestedCopyWithImpl(this._self, this._then);

  final ArtistRequested _self;
  final $Res Function(ArtistRequested) _then;

/// Create a copy of LidarrEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? artist = null,}) {
  return _then(ArtistRequested(
null == artist ? _self.artist : artist // ignore: cast_nullable_to_non_nullable
as LidarrArtist,
  ));
}

/// Create a copy of LidarrEvent
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$LidarrArtistCopyWith<$Res> get artist {
  
  return $LidarrArtistCopyWith<$Res>(_self.artist, (value) {
    return _then(_self.copyWith(artist: value));
  });
}
}

/// @nodoc


class AlbumsRequested implements LidarrEvent {
  const AlbumsRequested(this.artistId);
  

 final  String artistId;

/// Create a copy of LidarrEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$AlbumsRequestedCopyWith<AlbumsRequested> get copyWith => _$AlbumsRequestedCopyWithImpl<AlbumsRequested>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is AlbumsRequested&&(identical(other.artistId, artistId) || other.artistId == artistId));
}


@override
int get hashCode => Object.hash(runtimeType,artistId);

@override
String toString() {
  return 'LidarrEvent.albumsRequested(artistId: $artistId)';
}


}

/// @nodoc
abstract mixin class $AlbumsRequestedCopyWith<$Res> implements $LidarrEventCopyWith<$Res> {
  factory $AlbumsRequestedCopyWith(AlbumsRequested value, $Res Function(AlbumsRequested) _then) = _$AlbumsRequestedCopyWithImpl;
@useResult
$Res call({
 String artistId
});




}
/// @nodoc
class _$AlbumsRequestedCopyWithImpl<$Res>
    implements $AlbumsRequestedCopyWith<$Res> {
  _$AlbumsRequestedCopyWithImpl(this._self, this._then);

  final AlbumsRequested _self;
  final $Res Function(AlbumsRequested) _then;

/// Create a copy of LidarrEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? artistId = null,}) {
  return _then(AlbumsRequested(
null == artistId ? _self.artistId : artistId // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

/// @nodoc
mixin _$LidarrState {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is LidarrState);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'LidarrState()';
}


}

/// @nodoc
class $LidarrStateCopyWith<$Res>  {
$LidarrStateCopyWith(LidarrState _, $Res Function(LidarrState) __);
}


/// Adds pattern-matching-related methods to [LidarrState].
extension LidarrStatePatterns on LidarrState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( LidarrInitial value)?  initial,TResult Function( LidarrLoading value)?  loading,TResult Function( ArtistsLoaded value)?  artistsLoaded,TResult Function( AlbumsLoaded value)?  albumsLoaded,TResult Function( LidarrError value)?  error,TResult Function( LidarrSuccess value)?  success,required TResult orElse(),}){
final _that = this;
switch (_that) {
case LidarrInitial() when initial != null:
return initial(_that);case LidarrLoading() when loading != null:
return loading(_that);case ArtistsLoaded() when artistsLoaded != null:
return artistsLoaded(_that);case AlbumsLoaded() when albumsLoaded != null:
return albumsLoaded(_that);case LidarrError() when error != null:
return error(_that);case LidarrSuccess() when success != null:
return success(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( LidarrInitial value)  initial,required TResult Function( LidarrLoading value)  loading,required TResult Function( ArtistsLoaded value)  artistsLoaded,required TResult Function( AlbumsLoaded value)  albumsLoaded,required TResult Function( LidarrError value)  error,required TResult Function( LidarrSuccess value)  success,}){
final _that = this;
switch (_that) {
case LidarrInitial():
return initial(_that);case LidarrLoading():
return loading(_that);case ArtistsLoaded():
return artistsLoaded(_that);case AlbumsLoaded():
return albumsLoaded(_that);case LidarrError():
return error(_that);case LidarrSuccess():
return success(_that);case _:
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( LidarrInitial value)?  initial,TResult? Function( LidarrLoading value)?  loading,TResult? Function( ArtistsLoaded value)?  artistsLoaded,TResult? Function( AlbumsLoaded value)?  albumsLoaded,TResult? Function( LidarrError value)?  error,TResult? Function( LidarrSuccess value)?  success,}){
final _that = this;
switch (_that) {
case LidarrInitial() when initial != null:
return initial(_that);case LidarrLoading() when loading != null:
return loading(_that);case ArtistsLoaded() when artistsLoaded != null:
return artistsLoaded(_that);case AlbumsLoaded() when albumsLoaded != null:
return albumsLoaded(_that);case LidarrError() when error != null:
return error(_that);case LidarrSuccess() when success != null:
return success(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function()?  initial,TResult Function()?  loading,TResult Function( List<LidarrArtist> artists)?  artistsLoaded,TResult Function( List<LidarrAlbum> albums)?  albumsLoaded,TResult Function( String message)?  error,TResult Function( String message)?  success,required TResult orElse(),}) {final _that = this;
switch (_that) {
case LidarrInitial() when initial != null:
return initial();case LidarrLoading() when loading != null:
return loading();case ArtistsLoaded() when artistsLoaded != null:
return artistsLoaded(_that.artists);case AlbumsLoaded() when albumsLoaded != null:
return albumsLoaded(_that.albums);case LidarrError() when error != null:
return error(_that.message);case LidarrSuccess() when success != null:
return success(_that.message);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function()  initial,required TResult Function()  loading,required TResult Function( List<LidarrArtist> artists)  artistsLoaded,required TResult Function( List<LidarrAlbum> albums)  albumsLoaded,required TResult Function( String message)  error,required TResult Function( String message)  success,}) {final _that = this;
switch (_that) {
case LidarrInitial():
return initial();case LidarrLoading():
return loading();case ArtistsLoaded():
return artistsLoaded(_that.artists);case AlbumsLoaded():
return albumsLoaded(_that.albums);case LidarrError():
return error(_that.message);case LidarrSuccess():
return success(_that.message);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function()?  initial,TResult? Function()?  loading,TResult? Function( List<LidarrArtist> artists)?  artistsLoaded,TResult? Function( List<LidarrAlbum> albums)?  albumsLoaded,TResult? Function( String message)?  error,TResult? Function( String message)?  success,}) {final _that = this;
switch (_that) {
case LidarrInitial() when initial != null:
return initial();case LidarrLoading() when loading != null:
return loading();case ArtistsLoaded() when artistsLoaded != null:
return artistsLoaded(_that.artists);case AlbumsLoaded() when albumsLoaded != null:
return albumsLoaded(_that.albums);case LidarrError() when error != null:
return error(_that.message);case LidarrSuccess() when success != null:
return success(_that.message);case _:
  return null;

}
}

}

/// @nodoc


class LidarrInitial implements LidarrState {
  const LidarrInitial();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is LidarrInitial);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'LidarrState.initial()';
}


}




/// @nodoc


class LidarrLoading implements LidarrState {
  const LidarrLoading();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is LidarrLoading);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'LidarrState.loading()';
}


}




/// @nodoc


class ArtistsLoaded implements LidarrState {
  const ArtistsLoaded(final  List<LidarrArtist> artists): _artists = artists;
  

 final  List<LidarrArtist> _artists;
 List<LidarrArtist> get artists {
  if (_artists is EqualUnmodifiableListView) return _artists;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_artists);
}


/// Create a copy of LidarrState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ArtistsLoadedCopyWith<ArtistsLoaded> get copyWith => _$ArtistsLoadedCopyWithImpl<ArtistsLoaded>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ArtistsLoaded&&const DeepCollectionEquality().equals(other._artists, _artists));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(_artists));

@override
String toString() {
  return 'LidarrState.artistsLoaded(artists: $artists)';
}


}

/// @nodoc
abstract mixin class $ArtistsLoadedCopyWith<$Res> implements $LidarrStateCopyWith<$Res> {
  factory $ArtistsLoadedCopyWith(ArtistsLoaded value, $Res Function(ArtistsLoaded) _then) = _$ArtistsLoadedCopyWithImpl;
@useResult
$Res call({
 List<LidarrArtist> artists
});




}
/// @nodoc
class _$ArtistsLoadedCopyWithImpl<$Res>
    implements $ArtistsLoadedCopyWith<$Res> {
  _$ArtistsLoadedCopyWithImpl(this._self, this._then);

  final ArtistsLoaded _self;
  final $Res Function(ArtistsLoaded) _then;

/// Create a copy of LidarrState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? artists = null,}) {
  return _then(ArtistsLoaded(
null == artists ? _self._artists : artists // ignore: cast_nullable_to_non_nullable
as List<LidarrArtist>,
  ));
}


}

/// @nodoc


class AlbumsLoaded implements LidarrState {
  const AlbumsLoaded(final  List<LidarrAlbum> albums): _albums = albums;
  

 final  List<LidarrAlbum> _albums;
 List<LidarrAlbum> get albums {
  if (_albums is EqualUnmodifiableListView) return _albums;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_albums);
}


/// Create a copy of LidarrState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$AlbumsLoadedCopyWith<AlbumsLoaded> get copyWith => _$AlbumsLoadedCopyWithImpl<AlbumsLoaded>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is AlbumsLoaded&&const DeepCollectionEquality().equals(other._albums, _albums));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(_albums));

@override
String toString() {
  return 'LidarrState.albumsLoaded(albums: $albums)';
}


}

/// @nodoc
abstract mixin class $AlbumsLoadedCopyWith<$Res> implements $LidarrStateCopyWith<$Res> {
  factory $AlbumsLoadedCopyWith(AlbumsLoaded value, $Res Function(AlbumsLoaded) _then) = _$AlbumsLoadedCopyWithImpl;
@useResult
$Res call({
 List<LidarrAlbum> albums
});




}
/// @nodoc
class _$AlbumsLoadedCopyWithImpl<$Res>
    implements $AlbumsLoadedCopyWith<$Res> {
  _$AlbumsLoadedCopyWithImpl(this._self, this._then);

  final AlbumsLoaded _self;
  final $Res Function(AlbumsLoaded) _then;

/// Create a copy of LidarrState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? albums = null,}) {
  return _then(AlbumsLoaded(
null == albums ? _self._albums : albums // ignore: cast_nullable_to_non_nullable
as List<LidarrAlbum>,
  ));
}


}

/// @nodoc


class LidarrError implements LidarrState {
  const LidarrError(this.message);
  

 final  String message;

/// Create a copy of LidarrState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$LidarrErrorCopyWith<LidarrError> get copyWith => _$LidarrErrorCopyWithImpl<LidarrError>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is LidarrError&&(identical(other.message, message) || other.message == message));
}


@override
int get hashCode => Object.hash(runtimeType,message);

@override
String toString() {
  return 'LidarrState.error(message: $message)';
}


}

/// @nodoc
abstract mixin class $LidarrErrorCopyWith<$Res> implements $LidarrStateCopyWith<$Res> {
  factory $LidarrErrorCopyWith(LidarrError value, $Res Function(LidarrError) _then) = _$LidarrErrorCopyWithImpl;
@useResult
$Res call({
 String message
});




}
/// @nodoc
class _$LidarrErrorCopyWithImpl<$Res>
    implements $LidarrErrorCopyWith<$Res> {
  _$LidarrErrorCopyWithImpl(this._self, this._then);

  final LidarrError _self;
  final $Res Function(LidarrError) _then;

/// Create a copy of LidarrState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? message = null,}) {
  return _then(LidarrError(
null == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

/// @nodoc


class LidarrSuccess implements LidarrState {
  const LidarrSuccess(this.message);
  

 final  String message;

/// Create a copy of LidarrState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$LidarrSuccessCopyWith<LidarrSuccess> get copyWith => _$LidarrSuccessCopyWithImpl<LidarrSuccess>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is LidarrSuccess&&(identical(other.message, message) || other.message == message));
}


@override
int get hashCode => Object.hash(runtimeType,message);

@override
String toString() {
  return 'LidarrState.success(message: $message)';
}


}

/// @nodoc
abstract mixin class $LidarrSuccessCopyWith<$Res> implements $LidarrStateCopyWith<$Res> {
  factory $LidarrSuccessCopyWith(LidarrSuccess value, $Res Function(LidarrSuccess) _then) = _$LidarrSuccessCopyWithImpl;
@useResult
$Res call({
 String message
});




}
/// @nodoc
class _$LidarrSuccessCopyWithImpl<$Res>
    implements $LidarrSuccessCopyWith<$Res> {
  _$LidarrSuccessCopyWithImpl(this._self, this._then);

  final LidarrSuccess _self;
  final $Res Function(LidarrSuccess) _then;

/// Create a copy of LidarrState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? message = null,}) {
  return _then(LidarrSuccess(
null == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
