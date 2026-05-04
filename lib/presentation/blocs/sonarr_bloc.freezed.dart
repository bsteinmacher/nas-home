// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'sonarr_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$SonarrEvent {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is SonarrEvent);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'SonarrEvent()';
}


}

/// @nodoc
class $SonarrEventCopyWith<$Res>  {
$SonarrEventCopyWith(SonarrEvent _, $Res Function(SonarrEvent) __);
}


/// Adds pattern-matching-related methods to [SonarrEvent].
extension SonarrEventPatterns on SonarrEvent {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( FetchSeries value)?  fetchSeries,TResult Function( RefreshQueue value)?  refreshQueue,required TResult orElse(),}){
final _that = this;
switch (_that) {
case FetchSeries() when fetchSeries != null:
return fetchSeries(_that);case RefreshQueue() when refreshQueue != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( FetchSeries value)  fetchSeries,required TResult Function( RefreshQueue value)  refreshQueue,}){
final _that = this;
switch (_that) {
case FetchSeries():
return fetchSeries(_that);case RefreshQueue():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( FetchSeries value)?  fetchSeries,TResult? Function( RefreshQueue value)?  refreshQueue,}){
final _that = this;
switch (_that) {
case FetchSeries() when fetchSeries != null:
return fetchSeries(_that);case RefreshQueue() when refreshQueue != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function()?  fetchSeries,TResult Function()?  refreshQueue,required TResult orElse(),}) {final _that = this;
switch (_that) {
case FetchSeries() when fetchSeries != null:
return fetchSeries();case RefreshQueue() when refreshQueue != null:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function()  fetchSeries,required TResult Function()  refreshQueue,}) {final _that = this;
switch (_that) {
case FetchSeries():
return fetchSeries();case RefreshQueue():
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function()?  fetchSeries,TResult? Function()?  refreshQueue,}) {final _that = this;
switch (_that) {
case FetchSeries() when fetchSeries != null:
return fetchSeries();case RefreshQueue() when refreshQueue != null:
return refreshQueue();case _:
  return null;

}
}

}

/// @nodoc


class FetchSeries implements SonarrEvent {
  const FetchSeries();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is FetchSeries);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'SonarrEvent.fetchSeries()';
}


}




/// @nodoc


class RefreshQueue implements SonarrEvent {
  const RefreshQueue();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is RefreshQueue);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'SonarrEvent.refreshQueue()';
}


}




/// @nodoc
mixin _$SonarrState {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is SonarrState);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'SonarrState()';
}


}

/// @nodoc
class $SonarrStateCopyWith<$Res>  {
$SonarrStateCopyWith(SonarrState _, $Res Function(SonarrState) __);
}


/// Adds pattern-matching-related methods to [SonarrState].
extension SonarrStatePatterns on SonarrState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( SonarrInitial value)?  initial,TResult Function( SonarrLoading value)?  loading,TResult Function( SonarrLoaded value)?  loaded,TResult Function( SonarrError value)?  error,required TResult orElse(),}){
final _that = this;
switch (_that) {
case SonarrInitial() when initial != null:
return initial(_that);case SonarrLoading() when loading != null:
return loading(_that);case SonarrLoaded() when loaded != null:
return loaded(_that);case SonarrError() when error != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( SonarrInitial value)  initial,required TResult Function( SonarrLoading value)  loading,required TResult Function( SonarrLoaded value)  loaded,required TResult Function( SonarrError value)  error,}){
final _that = this;
switch (_that) {
case SonarrInitial():
return initial(_that);case SonarrLoading():
return loading(_that);case SonarrLoaded():
return loaded(_that);case SonarrError():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( SonarrInitial value)?  initial,TResult? Function( SonarrLoading value)?  loading,TResult? Function( SonarrLoaded value)?  loaded,TResult? Function( SonarrError value)?  error,}){
final _that = this;
switch (_that) {
case SonarrInitial() when initial != null:
return initial(_that);case SonarrLoading() when loading != null:
return loading(_that);case SonarrLoaded() when loaded != null:
return loaded(_that);case SonarrError() when error != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function()?  initial,TResult Function()?  loading,TResult Function( List<SonarrSeries> series,  List<dynamic> queue)?  loaded,TResult Function( String message)?  error,required TResult orElse(),}) {final _that = this;
switch (_that) {
case SonarrInitial() when initial != null:
return initial();case SonarrLoading() when loading != null:
return loading();case SonarrLoaded() when loaded != null:
return loaded(_that.series,_that.queue);case SonarrError() when error != null:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function()  initial,required TResult Function()  loading,required TResult Function( List<SonarrSeries> series,  List<dynamic> queue)  loaded,required TResult Function( String message)  error,}) {final _that = this;
switch (_that) {
case SonarrInitial():
return initial();case SonarrLoading():
return loading();case SonarrLoaded():
return loaded(_that.series,_that.queue);case SonarrError():
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function()?  initial,TResult? Function()?  loading,TResult? Function( List<SonarrSeries> series,  List<dynamic> queue)?  loaded,TResult? Function( String message)?  error,}) {final _that = this;
switch (_that) {
case SonarrInitial() when initial != null:
return initial();case SonarrLoading() when loading != null:
return loading();case SonarrLoaded() when loaded != null:
return loaded(_that.series,_that.queue);case SonarrError() when error != null:
return error(_that.message);case _:
  return null;

}
}

}

/// @nodoc


class SonarrInitial implements SonarrState {
  const SonarrInitial();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is SonarrInitial);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'SonarrState.initial()';
}


}




/// @nodoc


class SonarrLoading implements SonarrState {
  const SonarrLoading();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is SonarrLoading);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'SonarrState.loading()';
}


}




/// @nodoc


class SonarrLoaded implements SonarrState {
  const SonarrLoaded({required final  List<SonarrSeries> series, required final  List<dynamic> queue}): _series = series,_queue = queue;
  

 final  List<SonarrSeries> _series;
 List<SonarrSeries> get series {
  if (_series is EqualUnmodifiableListView) return _series;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_series);
}

 final  List<dynamic> _queue;
 List<dynamic> get queue {
  if (_queue is EqualUnmodifiableListView) return _queue;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_queue);
}


/// Create a copy of SonarrState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$SonarrLoadedCopyWith<SonarrLoaded> get copyWith => _$SonarrLoadedCopyWithImpl<SonarrLoaded>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is SonarrLoaded&&const DeepCollectionEquality().equals(other._series, _series)&&const DeepCollectionEquality().equals(other._queue, _queue));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(_series),const DeepCollectionEquality().hash(_queue));

@override
String toString() {
  return 'SonarrState.loaded(series: $series, queue: $queue)';
}


}

/// @nodoc
abstract mixin class $SonarrLoadedCopyWith<$Res> implements $SonarrStateCopyWith<$Res> {
  factory $SonarrLoadedCopyWith(SonarrLoaded value, $Res Function(SonarrLoaded) _then) = _$SonarrLoadedCopyWithImpl;
@useResult
$Res call({
 List<SonarrSeries> series, List<dynamic> queue
});




}
/// @nodoc
class _$SonarrLoadedCopyWithImpl<$Res>
    implements $SonarrLoadedCopyWith<$Res> {
  _$SonarrLoadedCopyWithImpl(this._self, this._then);

  final SonarrLoaded _self;
  final $Res Function(SonarrLoaded) _then;

/// Create a copy of SonarrState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? series = null,Object? queue = null,}) {
  return _then(SonarrLoaded(
series: null == series ? _self._series : series // ignore: cast_nullable_to_non_nullable
as List<SonarrSeries>,queue: null == queue ? _self._queue : queue // ignore: cast_nullable_to_non_nullable
as List<dynamic>,
  ));
}


}

/// @nodoc


class SonarrError implements SonarrState {
  const SonarrError(this.message);
  

 final  String message;

/// Create a copy of SonarrState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$SonarrErrorCopyWith<SonarrError> get copyWith => _$SonarrErrorCopyWithImpl<SonarrError>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is SonarrError&&(identical(other.message, message) || other.message == message));
}


@override
int get hashCode => Object.hash(runtimeType,message);

@override
String toString() {
  return 'SonarrState.error(message: $message)';
}


}

/// @nodoc
abstract mixin class $SonarrErrorCopyWith<$Res> implements $SonarrStateCopyWith<$Res> {
  factory $SonarrErrorCopyWith(SonarrError value, $Res Function(SonarrError) _then) = _$SonarrErrorCopyWithImpl;
@useResult
$Res call({
 String message
});




}
/// @nodoc
class _$SonarrErrorCopyWithImpl<$Res>
    implements $SonarrErrorCopyWith<$Res> {
  _$SonarrErrorCopyWithImpl(this._self, this._then);

  final SonarrError _self;
  final $Res Function(SonarrError) _then;

/// Create a copy of SonarrState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? message = null,}) {
  return _then(SonarrError(
null == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
