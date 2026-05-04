// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'radarr_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$RadarrEvent {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is RadarrEvent);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'RadarrEvent()';
}


}

/// @nodoc
class $RadarrEventCopyWith<$Res>  {
$RadarrEventCopyWith(RadarrEvent _, $Res Function(RadarrEvent) __);
}


/// Adds pattern-matching-related methods to [RadarrEvent].
extension RadarrEventPatterns on RadarrEvent {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( FetchMovies value)?  fetchMovies,TResult Function( RefreshQueue value)?  refreshQueue,required TResult orElse(),}){
final _that = this;
switch (_that) {
case FetchMovies() when fetchMovies != null:
return fetchMovies(_that);case RefreshQueue() when refreshQueue != null:
return refreshQueue(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( FetchMovies value)  fetchMovies,required TResult Function( RefreshQueue value)  refreshQueue,}){
final _that = this;
switch (_that) {
case FetchMovies():
return fetchMovies(_that);case RefreshQueue():
return refreshQueue(_that);case _:
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( FetchMovies value)?  fetchMovies,TResult? Function( RefreshQueue value)?  refreshQueue,}){
final _that = this;
switch (_that) {
case FetchMovies() when fetchMovies != null:
return fetchMovies(_that);case RefreshQueue() when refreshQueue != null:
return refreshQueue(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function()?  fetchMovies,TResult Function()?  refreshQueue,required TResult orElse(),}) {final _that = this;
switch (_that) {
case FetchMovies() when fetchMovies != null:
return fetchMovies();case RefreshQueue() when refreshQueue != null:
return refreshQueue();case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function()  fetchMovies,required TResult Function()  refreshQueue,}) {final _that = this;
switch (_that) {
case FetchMovies():
return fetchMovies();case RefreshQueue():
return refreshQueue();case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function()?  fetchMovies,TResult? Function()?  refreshQueue,}) {final _that = this;
switch (_that) {
case FetchMovies() when fetchMovies != null:
return fetchMovies();case RefreshQueue() when refreshQueue != null:
return refreshQueue();case _:
  return null;

}
}

}

/// @nodoc


class FetchMovies implements RadarrEvent {
  const FetchMovies();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is FetchMovies);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'RadarrEvent.fetchMovies()';
}


}




/// @nodoc


class RefreshQueue implements RadarrEvent {
  const RefreshQueue();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is RefreshQueue);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'RadarrEvent.refreshQueue()';
}


}




/// @nodoc
mixin _$RadarrState {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is RadarrState);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'RadarrState()';
}


}

/// @nodoc
class $RadarrStateCopyWith<$Res>  {
$RadarrStateCopyWith(RadarrState _, $Res Function(RadarrState) __);
}


/// Adds pattern-matching-related methods to [RadarrState].
extension RadarrStatePatterns on RadarrState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( RadarrInitial value)?  initial,TResult Function( RadarrLoading value)?  loading,TResult Function( RadarrLoaded value)?  loaded,TResult Function( RadarrError value)?  error,required TResult orElse(),}){
final _that = this;
switch (_that) {
case RadarrInitial() when initial != null:
return initial(_that);case RadarrLoading() when loading != null:
return loading(_that);case RadarrLoaded() when loaded != null:
return loaded(_that);case RadarrError() when error != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( RadarrInitial value)  initial,required TResult Function( RadarrLoading value)  loading,required TResult Function( RadarrLoaded value)  loaded,required TResult Function( RadarrError value)  error,}){
final _that = this;
switch (_that) {
case RadarrInitial():
return initial(_that);case RadarrLoading():
return loading(_that);case RadarrLoaded():
return loaded(_that);case RadarrError():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( RadarrInitial value)?  initial,TResult? Function( RadarrLoading value)?  loading,TResult? Function( RadarrLoaded value)?  loaded,TResult? Function( RadarrError value)?  error,}){
final _that = this;
switch (_that) {
case RadarrInitial() when initial != null:
return initial(_that);case RadarrLoading() when loading != null:
return loading(_that);case RadarrLoaded() when loaded != null:
return loaded(_that);case RadarrError() when error != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function()?  initial,TResult Function()?  loading,TResult Function( List<RadarrMovie> movies,  List<dynamic> queue)?  loaded,TResult Function( String message)?  error,required TResult orElse(),}) {final _that = this;
switch (_that) {
case RadarrInitial() when initial != null:
return initial();case RadarrLoading() when loading != null:
return loading();case RadarrLoaded() when loaded != null:
return loaded(_that.movies,_that.queue);case RadarrError() when error != null:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function()  initial,required TResult Function()  loading,required TResult Function( List<RadarrMovie> movies,  List<dynamic> queue)  loaded,required TResult Function( String message)  error,}) {final _that = this;
switch (_that) {
case RadarrInitial():
return initial();case RadarrLoading():
return loading();case RadarrLoaded():
return loaded(_that.movies,_that.queue);case RadarrError():
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function()?  initial,TResult? Function()?  loading,TResult? Function( List<RadarrMovie> movies,  List<dynamic> queue)?  loaded,TResult? Function( String message)?  error,}) {final _that = this;
switch (_that) {
case RadarrInitial() when initial != null:
return initial();case RadarrLoading() when loading != null:
return loading();case RadarrLoaded() when loaded != null:
return loaded(_that.movies,_that.queue);case RadarrError() when error != null:
return error(_that.message);case _:
  return null;

}
}

}

/// @nodoc


class RadarrInitial implements RadarrState {
  const RadarrInitial();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is RadarrInitial);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'RadarrState.initial()';
}


}




/// @nodoc


class RadarrLoading implements RadarrState {
  const RadarrLoading();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is RadarrLoading);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'RadarrState.loading()';
}


}




/// @nodoc


class RadarrLoaded implements RadarrState {
  const RadarrLoaded({required final  List<RadarrMovie> movies, required final  List<dynamic> queue}): _movies = movies,_queue = queue;
  

 final  List<RadarrMovie> _movies;
 List<RadarrMovie> get movies {
  if (_movies is EqualUnmodifiableListView) return _movies;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_movies);
}

 final  List<dynamic> _queue;
 List<dynamic> get queue {
  if (_queue is EqualUnmodifiableListView) return _queue;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_queue);
}


/// Create a copy of RadarrState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$RadarrLoadedCopyWith<RadarrLoaded> get copyWith => _$RadarrLoadedCopyWithImpl<RadarrLoaded>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is RadarrLoaded&&const DeepCollectionEquality().equals(other._movies, _movies)&&const DeepCollectionEquality().equals(other._queue, _queue));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(_movies),const DeepCollectionEquality().hash(_queue));

@override
String toString() {
  return 'RadarrState.loaded(movies: $movies, queue: $queue)';
}


}

/// @nodoc
abstract mixin class $RadarrLoadedCopyWith<$Res> implements $RadarrStateCopyWith<$Res> {
  factory $RadarrLoadedCopyWith(RadarrLoaded value, $Res Function(RadarrLoaded) _then) = _$RadarrLoadedCopyWithImpl;
@useResult
$Res call({
 List<RadarrMovie> movies, List<dynamic> queue
});




}
/// @nodoc
class _$RadarrLoadedCopyWithImpl<$Res>
    implements $RadarrLoadedCopyWith<$Res> {
  _$RadarrLoadedCopyWithImpl(this._self, this._then);

  final RadarrLoaded _self;
  final $Res Function(RadarrLoaded) _then;

/// Create a copy of RadarrState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? movies = null,Object? queue = null,}) {
  return _then(RadarrLoaded(
movies: null == movies ? _self._movies : movies // ignore: cast_nullable_to_non_nullable
as List<RadarrMovie>,queue: null == queue ? _self._queue : queue // ignore: cast_nullable_to_non_nullable
as List<dynamic>,
  ));
}


}

/// @nodoc


class RadarrError implements RadarrState {
  const RadarrError(this.message);
  

 final  String message;

/// Create a copy of RadarrState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$RadarrErrorCopyWith<RadarrError> get copyWith => _$RadarrErrorCopyWithImpl<RadarrError>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is RadarrError&&(identical(other.message, message) || other.message == message));
}


@override
int get hashCode => Object.hash(runtimeType,message);

@override
String toString() {
  return 'RadarrState.error(message: $message)';
}


}

/// @nodoc
abstract mixin class $RadarrErrorCopyWith<$Res> implements $RadarrStateCopyWith<$Res> {
  factory $RadarrErrorCopyWith(RadarrError value, $Res Function(RadarrError) _then) = _$RadarrErrorCopyWithImpl;
@useResult
$Res call({
 String message
});




}
/// @nodoc
class _$RadarrErrorCopyWithImpl<$Res>
    implements $RadarrErrorCopyWith<$Res> {
  _$RadarrErrorCopyWithImpl(this._self, this._then);

  final RadarrError _self;
  final $Res Function(RadarrError) _then;

/// Create a copy of RadarrState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? message = null,}) {
  return _then(RadarrError(
null == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
