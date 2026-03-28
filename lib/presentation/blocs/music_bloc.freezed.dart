// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'music_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$MusicEvent {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is MusicEvent);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'MusicEvent()';
}


}

/// @nodoc
class $MusicEventCopyWith<$Res>  {
$MusicEventCopyWith(MusicEvent _, $Res Function(MusicEvent) __);
}


/// Adds pattern-matching-related methods to [MusicEvent].
extension MusicEventPatterns on MusicEvent {
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function( String query)?  searchRequested,TResult Function( Artist artist)?  artistRequested,TResult Function( String artistId)?  albumsRequested,required TResult orElse(),}) {final _that = this;
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function( String query)  searchRequested,required TResult Function( Artist artist)  artistRequested,required TResult Function( String artistId)  albumsRequested,}) {final _that = this;
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function( String query)?  searchRequested,TResult? Function( Artist artist)?  artistRequested,TResult? Function( String artistId)?  albumsRequested,}) {final _that = this;
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


class SearchRequested implements MusicEvent {
  const SearchRequested(this.query);
  

 final  String query;

/// Create a copy of MusicEvent
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
  return 'MusicEvent.searchRequested(query: $query)';
}


}

/// @nodoc
abstract mixin class $SearchRequestedCopyWith<$Res> implements $MusicEventCopyWith<$Res> {
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

/// Create a copy of MusicEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? query = null,}) {
  return _then(SearchRequested(
null == query ? _self.query : query // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

/// @nodoc


class ArtistRequested implements MusicEvent {
  const ArtistRequested(this.artist);
  

 final  Artist artist;

/// Create a copy of MusicEvent
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
  return 'MusicEvent.artistRequested(artist: $artist)';
}


}

/// @nodoc
abstract mixin class $ArtistRequestedCopyWith<$Res> implements $MusicEventCopyWith<$Res> {
  factory $ArtistRequestedCopyWith(ArtistRequested value, $Res Function(ArtistRequested) _then) = _$ArtistRequestedCopyWithImpl;
@useResult
$Res call({
 Artist artist
});


$ArtistCopyWith<$Res> get artist;

}
/// @nodoc
class _$ArtistRequestedCopyWithImpl<$Res>
    implements $ArtistRequestedCopyWith<$Res> {
  _$ArtistRequestedCopyWithImpl(this._self, this._then);

  final ArtistRequested _self;
  final $Res Function(ArtistRequested) _then;

/// Create a copy of MusicEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? artist = null,}) {
  return _then(ArtistRequested(
null == artist ? _self.artist : artist // ignore: cast_nullable_to_non_nullable
as Artist,
  ));
}

/// Create a copy of MusicEvent
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$ArtistCopyWith<$Res> get artist {
  
  return $ArtistCopyWith<$Res>(_self.artist, (value) {
    return _then(_self.copyWith(artist: value));
  });
}
}

/// @nodoc


class AlbumsRequested implements MusicEvent {
  const AlbumsRequested(this.artistId);
  

 final  String artistId;

/// Create a copy of MusicEvent
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
  return 'MusicEvent.albumsRequested(artistId: $artistId)';
}


}

/// @nodoc
abstract mixin class $AlbumsRequestedCopyWith<$Res> implements $MusicEventCopyWith<$Res> {
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

/// Create a copy of MusicEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? artistId = null,}) {
  return _then(AlbumsRequested(
null == artistId ? _self.artistId : artistId // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

/// @nodoc
mixin _$MusicState {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is MusicState);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'MusicState()';
}


}

/// @nodoc
class $MusicStateCopyWith<$Res>  {
$MusicStateCopyWith(MusicState _, $Res Function(MusicState) __);
}


/// Adds pattern-matching-related methods to [MusicState].
extension MusicStatePatterns on MusicState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( MusicInitial value)?  initial,TResult Function( MusicLoading value)?  loading,TResult Function( ArtistsLoaded value)?  artistsLoaded,TResult Function( AlbumsLoaded value)?  albumsLoaded,TResult Function( MusicSuccess value)?  success,TResult Function( MusicError value)?  error,required TResult orElse(),}){
final _that = this;
switch (_that) {
case MusicInitial() when initial != null:
return initial(_that);case MusicLoading() when loading != null:
return loading(_that);case ArtistsLoaded() when artistsLoaded != null:
return artistsLoaded(_that);case AlbumsLoaded() when albumsLoaded != null:
return albumsLoaded(_that);case MusicSuccess() when success != null:
return success(_that);case MusicError() when error != null:
return error(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( MusicInitial value)  initial,required TResult Function( MusicLoading value)  loading,required TResult Function( ArtistsLoaded value)  artistsLoaded,required TResult Function( AlbumsLoaded value)  albumsLoaded,required TResult Function( MusicSuccess value)  success,required TResult Function( MusicError value)  error,}){
final _that = this;
switch (_that) {
case MusicInitial():
return initial(_that);case MusicLoading():
return loading(_that);case ArtistsLoaded():
return artistsLoaded(_that);case AlbumsLoaded():
return albumsLoaded(_that);case MusicSuccess():
return success(_that);case MusicError():
return error(_that);case _:
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( MusicInitial value)?  initial,TResult? Function( MusicLoading value)?  loading,TResult? Function( ArtistsLoaded value)?  artistsLoaded,TResult? Function( AlbumsLoaded value)?  albumsLoaded,TResult? Function( MusicSuccess value)?  success,TResult? Function( MusicError value)?  error,}){
final _that = this;
switch (_that) {
case MusicInitial() when initial != null:
return initial(_that);case MusicLoading() when loading != null:
return loading(_that);case ArtistsLoaded() when artistsLoaded != null:
return artistsLoaded(_that);case AlbumsLoaded() when albumsLoaded != null:
return albumsLoaded(_that);case MusicSuccess() when success != null:
return success(_that);case MusicError() when error != null:
return error(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function()?  initial,TResult Function()?  loading,TResult Function( List<Artist> artists)?  artistsLoaded,TResult Function( List<Album> albums)?  albumsLoaded,TResult Function( String message)?  success,TResult Function( String message)?  error,required TResult orElse(),}) {final _that = this;
switch (_that) {
case MusicInitial() when initial != null:
return initial();case MusicLoading() when loading != null:
return loading();case ArtistsLoaded() when artistsLoaded != null:
return artistsLoaded(_that.artists);case AlbumsLoaded() when albumsLoaded != null:
return albumsLoaded(_that.albums);case MusicSuccess() when success != null:
return success(_that.message);case MusicError() when error != null:
return error(_that.message);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function()  initial,required TResult Function()  loading,required TResult Function( List<Artist> artists)  artistsLoaded,required TResult Function( List<Album> albums)  albumsLoaded,required TResult Function( String message)  success,required TResult Function( String message)  error,}) {final _that = this;
switch (_that) {
case MusicInitial():
return initial();case MusicLoading():
return loading();case ArtistsLoaded():
return artistsLoaded(_that.artists);case AlbumsLoaded():
return albumsLoaded(_that.albums);case MusicSuccess():
return success(_that.message);case MusicError():
return error(_that.message);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function()?  initial,TResult? Function()?  loading,TResult? Function( List<Artist> artists)?  artistsLoaded,TResult? Function( List<Album> albums)?  albumsLoaded,TResult? Function( String message)?  success,TResult? Function( String message)?  error,}) {final _that = this;
switch (_that) {
case MusicInitial() when initial != null:
return initial();case MusicLoading() when loading != null:
return loading();case ArtistsLoaded() when artistsLoaded != null:
return artistsLoaded(_that.artists);case AlbumsLoaded() when albumsLoaded != null:
return albumsLoaded(_that.albums);case MusicSuccess() when success != null:
return success(_that.message);case MusicError() when error != null:
return error(_that.message);case _:
  return null;

}
}

}

/// @nodoc


class MusicInitial implements MusicState {
  const MusicInitial();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is MusicInitial);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'MusicState.initial()';
}


}




/// @nodoc


class MusicLoading implements MusicState {
  const MusicLoading();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is MusicLoading);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'MusicState.loading()';
}


}




/// @nodoc


class ArtistsLoaded implements MusicState {
  const ArtistsLoaded(final  List<Artist> artists): _artists = artists;
  

 final  List<Artist> _artists;
 List<Artist> get artists {
  if (_artists is EqualUnmodifiableListView) return _artists;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_artists);
}


/// Create a copy of MusicState
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
  return 'MusicState.artistsLoaded(artists: $artists)';
}


}

/// @nodoc
abstract mixin class $ArtistsLoadedCopyWith<$Res> implements $MusicStateCopyWith<$Res> {
  factory $ArtistsLoadedCopyWith(ArtistsLoaded value, $Res Function(ArtistsLoaded) _then) = _$ArtistsLoadedCopyWithImpl;
@useResult
$Res call({
 List<Artist> artists
});




}
/// @nodoc
class _$ArtistsLoadedCopyWithImpl<$Res>
    implements $ArtistsLoadedCopyWith<$Res> {
  _$ArtistsLoadedCopyWithImpl(this._self, this._then);

  final ArtistsLoaded _self;
  final $Res Function(ArtistsLoaded) _then;

/// Create a copy of MusicState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? artists = null,}) {
  return _then(ArtistsLoaded(
null == artists ? _self._artists : artists // ignore: cast_nullable_to_non_nullable
as List<Artist>,
  ));
}


}

/// @nodoc


class AlbumsLoaded implements MusicState {
  const AlbumsLoaded(final  List<Album> albums): _albums = albums;
  

 final  List<Album> _albums;
 List<Album> get albums {
  if (_albums is EqualUnmodifiableListView) return _albums;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_albums);
}


/// Create a copy of MusicState
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
  return 'MusicState.albumsLoaded(albums: $albums)';
}


}

/// @nodoc
abstract mixin class $AlbumsLoadedCopyWith<$Res> implements $MusicStateCopyWith<$Res> {
  factory $AlbumsLoadedCopyWith(AlbumsLoaded value, $Res Function(AlbumsLoaded) _then) = _$AlbumsLoadedCopyWithImpl;
@useResult
$Res call({
 List<Album> albums
});




}
/// @nodoc
class _$AlbumsLoadedCopyWithImpl<$Res>
    implements $AlbumsLoadedCopyWith<$Res> {
  _$AlbumsLoadedCopyWithImpl(this._self, this._then);

  final AlbumsLoaded _self;
  final $Res Function(AlbumsLoaded) _then;

/// Create a copy of MusicState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? albums = null,}) {
  return _then(AlbumsLoaded(
null == albums ? _self._albums : albums // ignore: cast_nullable_to_non_nullable
as List<Album>,
  ));
}


}

/// @nodoc


class MusicSuccess implements MusicState {
  const MusicSuccess(this.message);
  

 final  String message;

/// Create a copy of MusicState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$MusicSuccessCopyWith<MusicSuccess> get copyWith => _$MusicSuccessCopyWithImpl<MusicSuccess>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is MusicSuccess&&(identical(other.message, message) || other.message == message));
}


@override
int get hashCode => Object.hash(runtimeType,message);

@override
String toString() {
  return 'MusicState.success(message: $message)';
}


}

/// @nodoc
abstract mixin class $MusicSuccessCopyWith<$Res> implements $MusicStateCopyWith<$Res> {
  factory $MusicSuccessCopyWith(MusicSuccess value, $Res Function(MusicSuccess) _then) = _$MusicSuccessCopyWithImpl;
@useResult
$Res call({
 String message
});




}
/// @nodoc
class _$MusicSuccessCopyWithImpl<$Res>
    implements $MusicSuccessCopyWith<$Res> {
  _$MusicSuccessCopyWithImpl(this._self, this._then);

  final MusicSuccess _self;
  final $Res Function(MusicSuccess) _then;

/// Create a copy of MusicState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? message = null,}) {
  return _then(MusicSuccess(
null == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

/// @nodoc


class MusicError implements MusicState {
  const MusicError(this.message);
  

 final  String message;

/// Create a copy of MusicState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$MusicErrorCopyWith<MusicError> get copyWith => _$MusicErrorCopyWithImpl<MusicError>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is MusicError&&(identical(other.message, message) || other.message == message));
}


@override
int get hashCode => Object.hash(runtimeType,message);

@override
String toString() {
  return 'MusicState.error(message: $message)';
}


}

/// @nodoc
abstract mixin class $MusicErrorCopyWith<$Res> implements $MusicStateCopyWith<$Res> {
  factory $MusicErrorCopyWith(MusicError value, $Res Function(MusicError) _then) = _$MusicErrorCopyWithImpl;
@useResult
$Res call({
 String message
});




}
/// @nodoc
class _$MusicErrorCopyWithImpl<$Res>
    implements $MusicErrorCopyWith<$Res> {
  _$MusicErrorCopyWithImpl(this._self, this._then);

  final MusicError _self;
  final $Res Function(MusicError) _then;

/// Create a copy of MusicState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? message = null,}) {
  return _then(MusicError(
null == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
