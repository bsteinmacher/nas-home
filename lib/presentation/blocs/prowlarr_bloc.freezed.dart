// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'prowlarr_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$ProwlarrEvent {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ProwlarrEvent);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'ProwlarrEvent()';
}


}

/// @nodoc
class $ProwlarrEventCopyWith<$Res>  {
$ProwlarrEventCopyWith(ProwlarrEvent _, $Res Function(ProwlarrEvent) __);
}


/// Adds pattern-matching-related methods to [ProwlarrEvent].
extension ProwlarrEventPatterns on ProwlarrEvent {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( FetchIndexers value)?  fetchIndexers,required TResult orElse(),}){
final _that = this;
switch (_that) {
case FetchIndexers() when fetchIndexers != null:
return fetchIndexers(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( FetchIndexers value)  fetchIndexers,}){
final _that = this;
switch (_that) {
case FetchIndexers():
return fetchIndexers(_that);case _:
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( FetchIndexers value)?  fetchIndexers,}){
final _that = this;
switch (_that) {
case FetchIndexers() when fetchIndexers != null:
return fetchIndexers(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function()?  fetchIndexers,required TResult orElse(),}) {final _that = this;
switch (_that) {
case FetchIndexers() when fetchIndexers != null:
return fetchIndexers();case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function()  fetchIndexers,}) {final _that = this;
switch (_that) {
case FetchIndexers():
return fetchIndexers();case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function()?  fetchIndexers,}) {final _that = this;
switch (_that) {
case FetchIndexers() when fetchIndexers != null:
return fetchIndexers();case _:
  return null;

}
}

}

/// @nodoc


class FetchIndexers implements ProwlarrEvent {
  const FetchIndexers();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is FetchIndexers);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'ProwlarrEvent.fetchIndexers()';
}


}




/// @nodoc
mixin _$ProwlarrState {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ProwlarrState);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'ProwlarrState()';
}


}

/// @nodoc
class $ProwlarrStateCopyWith<$Res>  {
$ProwlarrStateCopyWith(ProwlarrState _, $Res Function(ProwlarrState) __);
}


/// Adds pattern-matching-related methods to [ProwlarrState].
extension ProwlarrStatePatterns on ProwlarrState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( ProwlarrInitial value)?  initial,TResult Function( ProwlarrLoading value)?  loading,TResult Function( ProwlarrLoaded value)?  loaded,TResult Function( ProwlarrError value)?  error,required TResult orElse(),}){
final _that = this;
switch (_that) {
case ProwlarrInitial() when initial != null:
return initial(_that);case ProwlarrLoading() when loading != null:
return loading(_that);case ProwlarrLoaded() when loaded != null:
return loaded(_that);case ProwlarrError() when error != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( ProwlarrInitial value)  initial,required TResult Function( ProwlarrLoading value)  loading,required TResult Function( ProwlarrLoaded value)  loaded,required TResult Function( ProwlarrError value)  error,}){
final _that = this;
switch (_that) {
case ProwlarrInitial():
return initial(_that);case ProwlarrLoading():
return loading(_that);case ProwlarrLoaded():
return loaded(_that);case ProwlarrError():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( ProwlarrInitial value)?  initial,TResult? Function( ProwlarrLoading value)?  loading,TResult? Function( ProwlarrLoaded value)?  loaded,TResult? Function( ProwlarrError value)?  error,}){
final _that = this;
switch (_that) {
case ProwlarrInitial() when initial != null:
return initial(_that);case ProwlarrLoading() when loading != null:
return loading(_that);case ProwlarrLoaded() when loaded != null:
return loaded(_that);case ProwlarrError() when error != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function()?  initial,TResult Function()?  loading,TResult Function( List<ProwlarrIndexer> indexers)?  loaded,TResult Function( String message)?  error,required TResult orElse(),}) {final _that = this;
switch (_that) {
case ProwlarrInitial() when initial != null:
return initial();case ProwlarrLoading() when loading != null:
return loading();case ProwlarrLoaded() when loaded != null:
return loaded(_that.indexers);case ProwlarrError() when error != null:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function()  initial,required TResult Function()  loading,required TResult Function( List<ProwlarrIndexer> indexers)  loaded,required TResult Function( String message)  error,}) {final _that = this;
switch (_that) {
case ProwlarrInitial():
return initial();case ProwlarrLoading():
return loading();case ProwlarrLoaded():
return loaded(_that.indexers);case ProwlarrError():
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function()?  initial,TResult? Function()?  loading,TResult? Function( List<ProwlarrIndexer> indexers)?  loaded,TResult? Function( String message)?  error,}) {final _that = this;
switch (_that) {
case ProwlarrInitial() when initial != null:
return initial();case ProwlarrLoading() when loading != null:
return loading();case ProwlarrLoaded() when loaded != null:
return loaded(_that.indexers);case ProwlarrError() when error != null:
return error(_that.message);case _:
  return null;

}
}

}

/// @nodoc


class ProwlarrInitial implements ProwlarrState {
  const ProwlarrInitial();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ProwlarrInitial);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'ProwlarrState.initial()';
}


}




/// @nodoc


class ProwlarrLoading implements ProwlarrState {
  const ProwlarrLoading();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ProwlarrLoading);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'ProwlarrState.loading()';
}


}




/// @nodoc


class ProwlarrLoaded implements ProwlarrState {
  const ProwlarrLoaded({required final  List<ProwlarrIndexer> indexers}): _indexers = indexers;
  

 final  List<ProwlarrIndexer> _indexers;
 List<ProwlarrIndexer> get indexers {
  if (_indexers is EqualUnmodifiableListView) return _indexers;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_indexers);
}


/// Create a copy of ProwlarrState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ProwlarrLoadedCopyWith<ProwlarrLoaded> get copyWith => _$ProwlarrLoadedCopyWithImpl<ProwlarrLoaded>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ProwlarrLoaded&&const DeepCollectionEquality().equals(other._indexers, _indexers));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(_indexers));

@override
String toString() {
  return 'ProwlarrState.loaded(indexers: $indexers)';
}


}

/// @nodoc
abstract mixin class $ProwlarrLoadedCopyWith<$Res> implements $ProwlarrStateCopyWith<$Res> {
  factory $ProwlarrLoadedCopyWith(ProwlarrLoaded value, $Res Function(ProwlarrLoaded) _then) = _$ProwlarrLoadedCopyWithImpl;
@useResult
$Res call({
 List<ProwlarrIndexer> indexers
});




}
/// @nodoc
class _$ProwlarrLoadedCopyWithImpl<$Res>
    implements $ProwlarrLoadedCopyWith<$Res> {
  _$ProwlarrLoadedCopyWithImpl(this._self, this._then);

  final ProwlarrLoaded _self;
  final $Res Function(ProwlarrLoaded) _then;

/// Create a copy of ProwlarrState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? indexers = null,}) {
  return _then(ProwlarrLoaded(
indexers: null == indexers ? _self._indexers : indexers // ignore: cast_nullable_to_non_nullable
as List<ProwlarrIndexer>,
  ));
}


}

/// @nodoc


class ProwlarrError implements ProwlarrState {
  const ProwlarrError(this.message);
  

 final  String message;

/// Create a copy of ProwlarrState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ProwlarrErrorCopyWith<ProwlarrError> get copyWith => _$ProwlarrErrorCopyWithImpl<ProwlarrError>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ProwlarrError&&(identical(other.message, message) || other.message == message));
}


@override
int get hashCode => Object.hash(runtimeType,message);

@override
String toString() {
  return 'ProwlarrState.error(message: $message)';
}


}

/// @nodoc
abstract mixin class $ProwlarrErrorCopyWith<$Res> implements $ProwlarrStateCopyWith<$Res> {
  factory $ProwlarrErrorCopyWith(ProwlarrError value, $Res Function(ProwlarrError) _then) = _$ProwlarrErrorCopyWithImpl;
@useResult
$Res call({
 String message
});




}
/// @nodoc
class _$ProwlarrErrorCopyWithImpl<$Res>
    implements $ProwlarrErrorCopyWith<$Res> {
  _$ProwlarrErrorCopyWithImpl(this._self, this._then);

  final ProwlarrError _self;
  final $Res Function(ProwlarrError) _then;

/// Create a copy of ProwlarrState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? message = null,}) {
  return _then(ProwlarrError(
null == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
