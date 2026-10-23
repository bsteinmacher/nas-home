// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'music_dl_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$MusicDlEvent {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is MusicDlEvent);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'MusicDlEvent()';
}


}

/// @nodoc
class $MusicDlEventCopyWith<$Res>  {
$MusicDlEventCopyWith(MusicDlEvent _, $Res Function(MusicDlEvent) __);
}


/// Adds pattern-matching-related methods to [MusicDlEvent].
extension MusicDlEventPatterns on MusicDlEvent {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( MusicDlStarted value)?  started,TResult Function( MusicDlUrlChanged value)?  urlChanged,TResult Function( MusicDlInspectRequested value)?  inspectRequested,TResult Function( MusicDlUrlSubmitted value)?  urlSubmitted,TResult Function( MusicDlFolderSelected value)?  folderSelected,TResult Function( MusicDlFolderCreated value)?  folderCreated,TResult Function( MusicDlSetAlbumChanged value)?  setAlbumChanged,TResult Function( MusicDlDraftArtistChanged value)?  draftArtistChanged,TResult Function( MusicDlDraftAlbumChanged value)?  draftAlbumChanged,TResult Function( MusicDlDraftFolderChanged value)?  draftFolderChanged,TResult Function( MusicDlResyncRequested value)?  resyncRequested,TResult Function( MusicDlPollRequested value)?  pollRequested,required TResult orElse(),}){
final _that = this;
switch (_that) {
case MusicDlStarted() when started != null:
return started(_that);case MusicDlUrlChanged() when urlChanged != null:
return urlChanged(_that);case MusicDlInspectRequested() when inspectRequested != null:
return inspectRequested(_that);case MusicDlUrlSubmitted() when urlSubmitted != null:
return urlSubmitted(_that);case MusicDlFolderSelected() when folderSelected != null:
return folderSelected(_that);case MusicDlFolderCreated() when folderCreated != null:
return folderCreated(_that);case MusicDlSetAlbumChanged() when setAlbumChanged != null:
return setAlbumChanged(_that);case MusicDlDraftArtistChanged() when draftArtistChanged != null:
return draftArtistChanged(_that);case MusicDlDraftAlbumChanged() when draftAlbumChanged != null:
return draftAlbumChanged(_that);case MusicDlDraftFolderChanged() when draftFolderChanged != null:
return draftFolderChanged(_that);case MusicDlResyncRequested() when resyncRequested != null:
return resyncRequested(_that);case MusicDlPollRequested() when pollRequested != null:
return pollRequested(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( MusicDlStarted value)  started,required TResult Function( MusicDlUrlChanged value)  urlChanged,required TResult Function( MusicDlInspectRequested value)  inspectRequested,required TResult Function( MusicDlUrlSubmitted value)  urlSubmitted,required TResult Function( MusicDlFolderSelected value)  folderSelected,required TResult Function( MusicDlFolderCreated value)  folderCreated,required TResult Function( MusicDlSetAlbumChanged value)  setAlbumChanged,required TResult Function( MusicDlDraftArtistChanged value)  draftArtistChanged,required TResult Function( MusicDlDraftAlbumChanged value)  draftAlbumChanged,required TResult Function( MusicDlDraftFolderChanged value)  draftFolderChanged,required TResult Function( MusicDlResyncRequested value)  resyncRequested,required TResult Function( MusicDlPollRequested value)  pollRequested,}){
final _that = this;
switch (_that) {
case MusicDlStarted():
return started(_that);case MusicDlUrlChanged():
return urlChanged(_that);case MusicDlInspectRequested():
return inspectRequested(_that);case MusicDlUrlSubmitted():
return urlSubmitted(_that);case MusicDlFolderSelected():
return folderSelected(_that);case MusicDlFolderCreated():
return folderCreated(_that);case MusicDlSetAlbumChanged():
return setAlbumChanged(_that);case MusicDlDraftArtistChanged():
return draftArtistChanged(_that);case MusicDlDraftAlbumChanged():
return draftAlbumChanged(_that);case MusicDlDraftFolderChanged():
return draftFolderChanged(_that);case MusicDlResyncRequested():
return resyncRequested(_that);case MusicDlPollRequested():
return pollRequested(_that);case _:
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( MusicDlStarted value)?  started,TResult? Function( MusicDlUrlChanged value)?  urlChanged,TResult? Function( MusicDlInspectRequested value)?  inspectRequested,TResult? Function( MusicDlUrlSubmitted value)?  urlSubmitted,TResult? Function( MusicDlFolderSelected value)?  folderSelected,TResult? Function( MusicDlFolderCreated value)?  folderCreated,TResult? Function( MusicDlSetAlbumChanged value)?  setAlbumChanged,TResult? Function( MusicDlDraftArtistChanged value)?  draftArtistChanged,TResult? Function( MusicDlDraftAlbumChanged value)?  draftAlbumChanged,TResult? Function( MusicDlDraftFolderChanged value)?  draftFolderChanged,TResult? Function( MusicDlResyncRequested value)?  resyncRequested,TResult? Function( MusicDlPollRequested value)?  pollRequested,}){
final _that = this;
switch (_that) {
case MusicDlStarted() when started != null:
return started(_that);case MusicDlUrlChanged() when urlChanged != null:
return urlChanged(_that);case MusicDlInspectRequested() when inspectRequested != null:
return inspectRequested(_that);case MusicDlUrlSubmitted() when urlSubmitted != null:
return urlSubmitted(_that);case MusicDlFolderSelected() when folderSelected != null:
return folderSelected(_that);case MusicDlFolderCreated() when folderCreated != null:
return folderCreated(_that);case MusicDlSetAlbumChanged() when setAlbumChanged != null:
return setAlbumChanged(_that);case MusicDlDraftArtistChanged() when draftArtistChanged != null:
return draftArtistChanged(_that);case MusicDlDraftAlbumChanged() when draftAlbumChanged != null:
return draftAlbumChanged(_that);case MusicDlDraftFolderChanged() when draftFolderChanged != null:
return draftFolderChanged(_that);case MusicDlResyncRequested() when resyncRequested != null:
return resyncRequested(_that);case MusicDlPollRequested() when pollRequested != null:
return pollRequested(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function()?  started,TResult Function( String url)?  urlChanged,TResult Function( String url,  int generation)?  inspectRequested,TResult Function()?  urlSubmitted,TResult Function( String? folder)?  folderSelected,TResult Function( String name)?  folderCreated,TResult Function( bool value)?  setAlbumChanged,TResult Function( String value)?  draftArtistChanged,TResult Function( String value)?  draftAlbumChanged,TResult Function( String value)?  draftFolderChanged,TResult Function( String folder)?  resyncRequested,TResult Function()?  pollRequested,required TResult orElse(),}) {final _that = this;
switch (_that) {
case MusicDlStarted() when started != null:
return started();case MusicDlUrlChanged() when urlChanged != null:
return urlChanged(_that.url);case MusicDlInspectRequested() when inspectRequested != null:
return inspectRequested(_that.url,_that.generation);case MusicDlUrlSubmitted() when urlSubmitted != null:
return urlSubmitted();case MusicDlFolderSelected() when folderSelected != null:
return folderSelected(_that.folder);case MusicDlFolderCreated() when folderCreated != null:
return folderCreated(_that.name);case MusicDlSetAlbumChanged() when setAlbumChanged != null:
return setAlbumChanged(_that.value);case MusicDlDraftArtistChanged() when draftArtistChanged != null:
return draftArtistChanged(_that.value);case MusicDlDraftAlbumChanged() when draftAlbumChanged != null:
return draftAlbumChanged(_that.value);case MusicDlDraftFolderChanged() when draftFolderChanged != null:
return draftFolderChanged(_that.value);case MusicDlResyncRequested() when resyncRequested != null:
return resyncRequested(_that.folder);case MusicDlPollRequested() when pollRequested != null:
return pollRequested();case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function()  started,required TResult Function( String url)  urlChanged,required TResult Function( String url,  int generation)  inspectRequested,required TResult Function()  urlSubmitted,required TResult Function( String? folder)  folderSelected,required TResult Function( String name)  folderCreated,required TResult Function( bool value)  setAlbumChanged,required TResult Function( String value)  draftArtistChanged,required TResult Function( String value)  draftAlbumChanged,required TResult Function( String value)  draftFolderChanged,required TResult Function( String folder)  resyncRequested,required TResult Function()  pollRequested,}) {final _that = this;
switch (_that) {
case MusicDlStarted():
return started();case MusicDlUrlChanged():
return urlChanged(_that.url);case MusicDlInspectRequested():
return inspectRequested(_that.url,_that.generation);case MusicDlUrlSubmitted():
return urlSubmitted();case MusicDlFolderSelected():
return folderSelected(_that.folder);case MusicDlFolderCreated():
return folderCreated(_that.name);case MusicDlSetAlbumChanged():
return setAlbumChanged(_that.value);case MusicDlDraftArtistChanged():
return draftArtistChanged(_that.value);case MusicDlDraftAlbumChanged():
return draftAlbumChanged(_that.value);case MusicDlDraftFolderChanged():
return draftFolderChanged(_that.value);case MusicDlResyncRequested():
return resyncRequested(_that.folder);case MusicDlPollRequested():
return pollRequested();case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function()?  started,TResult? Function( String url)?  urlChanged,TResult? Function( String url,  int generation)?  inspectRequested,TResult? Function()?  urlSubmitted,TResult? Function( String? folder)?  folderSelected,TResult? Function( String name)?  folderCreated,TResult? Function( bool value)?  setAlbumChanged,TResult? Function( String value)?  draftArtistChanged,TResult? Function( String value)?  draftAlbumChanged,TResult? Function( String value)?  draftFolderChanged,TResult? Function( String folder)?  resyncRequested,TResult? Function()?  pollRequested,}) {final _that = this;
switch (_that) {
case MusicDlStarted() when started != null:
return started();case MusicDlUrlChanged() when urlChanged != null:
return urlChanged(_that.url);case MusicDlInspectRequested() when inspectRequested != null:
return inspectRequested(_that.url,_that.generation);case MusicDlUrlSubmitted() when urlSubmitted != null:
return urlSubmitted();case MusicDlFolderSelected() when folderSelected != null:
return folderSelected(_that.folder);case MusicDlFolderCreated() when folderCreated != null:
return folderCreated(_that.name);case MusicDlSetAlbumChanged() when setAlbumChanged != null:
return setAlbumChanged(_that.value);case MusicDlDraftArtistChanged() when draftArtistChanged != null:
return draftArtistChanged(_that.value);case MusicDlDraftAlbumChanged() when draftAlbumChanged != null:
return draftAlbumChanged(_that.value);case MusicDlDraftFolderChanged() when draftFolderChanged != null:
return draftFolderChanged(_that.value);case MusicDlResyncRequested() when resyncRequested != null:
return resyncRequested(_that.folder);case MusicDlPollRequested() when pollRequested != null:
return pollRequested();case _:
  return null;

}
}

}

/// @nodoc


class MusicDlStarted implements MusicDlEvent {
  const MusicDlStarted();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is MusicDlStarted);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'MusicDlEvent.started()';
}


}




/// @nodoc


class MusicDlUrlChanged implements MusicDlEvent {
  const MusicDlUrlChanged(this.url);
  

 final  String url;

/// Create a copy of MusicDlEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$MusicDlUrlChangedCopyWith<MusicDlUrlChanged> get copyWith => _$MusicDlUrlChangedCopyWithImpl<MusicDlUrlChanged>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is MusicDlUrlChanged&&(identical(other.url, url) || other.url == url));
}


@override
int get hashCode => Object.hash(runtimeType,url);

@override
String toString() {
  return 'MusicDlEvent.urlChanged(url: $url)';
}


}

/// @nodoc
abstract mixin class $MusicDlUrlChangedCopyWith<$Res> implements $MusicDlEventCopyWith<$Res> {
  factory $MusicDlUrlChangedCopyWith(MusicDlUrlChanged value, $Res Function(MusicDlUrlChanged) _then) = _$MusicDlUrlChangedCopyWithImpl;
@useResult
$Res call({
 String url
});




}
/// @nodoc
class _$MusicDlUrlChangedCopyWithImpl<$Res>
    implements $MusicDlUrlChangedCopyWith<$Res> {
  _$MusicDlUrlChangedCopyWithImpl(this._self, this._then);

  final MusicDlUrlChanged _self;
  final $Res Function(MusicDlUrlChanged) _then;

/// Create a copy of MusicDlEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? url = null,}) {
  return _then(MusicDlUrlChanged(
null == url ? _self.url : url // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

/// @nodoc


class MusicDlInspectRequested implements MusicDlEvent {
  const MusicDlInspectRequested(this.url, this.generation);
  

 final  String url;
 final  int generation;

/// Create a copy of MusicDlEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$MusicDlInspectRequestedCopyWith<MusicDlInspectRequested> get copyWith => _$MusicDlInspectRequestedCopyWithImpl<MusicDlInspectRequested>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is MusicDlInspectRequested&&(identical(other.url, url) || other.url == url)&&(identical(other.generation, generation) || other.generation == generation));
}


@override
int get hashCode => Object.hash(runtimeType,url,generation);

@override
String toString() {
  return 'MusicDlEvent.inspectRequested(url: $url, generation: $generation)';
}


}

/// @nodoc
abstract mixin class $MusicDlInspectRequestedCopyWith<$Res> implements $MusicDlEventCopyWith<$Res> {
  factory $MusicDlInspectRequestedCopyWith(MusicDlInspectRequested value, $Res Function(MusicDlInspectRequested) _then) = _$MusicDlInspectRequestedCopyWithImpl;
@useResult
$Res call({
 String url, int generation
});




}
/// @nodoc
class _$MusicDlInspectRequestedCopyWithImpl<$Res>
    implements $MusicDlInspectRequestedCopyWith<$Res> {
  _$MusicDlInspectRequestedCopyWithImpl(this._self, this._then);

  final MusicDlInspectRequested _self;
  final $Res Function(MusicDlInspectRequested) _then;

/// Create a copy of MusicDlEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? url = null,Object? generation = null,}) {
  return _then(MusicDlInspectRequested(
null == url ? _self.url : url // ignore: cast_nullable_to_non_nullable
as String,null == generation ? _self.generation : generation // ignore: cast_nullable_to_non_nullable
as int,
  ));
}


}

/// @nodoc


class MusicDlUrlSubmitted implements MusicDlEvent {
  const MusicDlUrlSubmitted();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is MusicDlUrlSubmitted);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'MusicDlEvent.urlSubmitted()';
}


}




/// @nodoc


class MusicDlFolderSelected implements MusicDlEvent {
  const MusicDlFolderSelected(this.folder);
  

 final  String? folder;

/// Create a copy of MusicDlEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$MusicDlFolderSelectedCopyWith<MusicDlFolderSelected> get copyWith => _$MusicDlFolderSelectedCopyWithImpl<MusicDlFolderSelected>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is MusicDlFolderSelected&&(identical(other.folder, folder) || other.folder == folder));
}


@override
int get hashCode => Object.hash(runtimeType,folder);

@override
String toString() {
  return 'MusicDlEvent.folderSelected(folder: $folder)';
}


}

/// @nodoc
abstract mixin class $MusicDlFolderSelectedCopyWith<$Res> implements $MusicDlEventCopyWith<$Res> {
  factory $MusicDlFolderSelectedCopyWith(MusicDlFolderSelected value, $Res Function(MusicDlFolderSelected) _then) = _$MusicDlFolderSelectedCopyWithImpl;
@useResult
$Res call({
 String? folder
});




}
/// @nodoc
class _$MusicDlFolderSelectedCopyWithImpl<$Res>
    implements $MusicDlFolderSelectedCopyWith<$Res> {
  _$MusicDlFolderSelectedCopyWithImpl(this._self, this._then);

  final MusicDlFolderSelected _self;
  final $Res Function(MusicDlFolderSelected) _then;

/// Create a copy of MusicDlEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? folder = freezed,}) {
  return _then(MusicDlFolderSelected(
freezed == folder ? _self.folder : folder // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

/// @nodoc


class MusicDlFolderCreated implements MusicDlEvent {
  const MusicDlFolderCreated(this.name);
  

 final  String name;

/// Create a copy of MusicDlEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$MusicDlFolderCreatedCopyWith<MusicDlFolderCreated> get copyWith => _$MusicDlFolderCreatedCopyWithImpl<MusicDlFolderCreated>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is MusicDlFolderCreated&&(identical(other.name, name) || other.name == name));
}


@override
int get hashCode => Object.hash(runtimeType,name);

@override
String toString() {
  return 'MusicDlEvent.folderCreated(name: $name)';
}


}

/// @nodoc
abstract mixin class $MusicDlFolderCreatedCopyWith<$Res> implements $MusicDlEventCopyWith<$Res> {
  factory $MusicDlFolderCreatedCopyWith(MusicDlFolderCreated value, $Res Function(MusicDlFolderCreated) _then) = _$MusicDlFolderCreatedCopyWithImpl;
@useResult
$Res call({
 String name
});




}
/// @nodoc
class _$MusicDlFolderCreatedCopyWithImpl<$Res>
    implements $MusicDlFolderCreatedCopyWith<$Res> {
  _$MusicDlFolderCreatedCopyWithImpl(this._self, this._then);

  final MusicDlFolderCreated _self;
  final $Res Function(MusicDlFolderCreated) _then;

/// Create a copy of MusicDlEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? name = null,}) {
  return _then(MusicDlFolderCreated(
null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

/// @nodoc


class MusicDlSetAlbumChanged implements MusicDlEvent {
  const MusicDlSetAlbumChanged(this.value);
  

 final  bool value;

/// Create a copy of MusicDlEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$MusicDlSetAlbumChangedCopyWith<MusicDlSetAlbumChanged> get copyWith => _$MusicDlSetAlbumChangedCopyWithImpl<MusicDlSetAlbumChanged>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is MusicDlSetAlbumChanged&&(identical(other.value, value) || other.value == value));
}


@override
int get hashCode => Object.hash(runtimeType,value);

@override
String toString() {
  return 'MusicDlEvent.setAlbumChanged(value: $value)';
}


}

/// @nodoc
abstract mixin class $MusicDlSetAlbumChangedCopyWith<$Res> implements $MusicDlEventCopyWith<$Res> {
  factory $MusicDlSetAlbumChangedCopyWith(MusicDlSetAlbumChanged value, $Res Function(MusicDlSetAlbumChanged) _then) = _$MusicDlSetAlbumChangedCopyWithImpl;
@useResult
$Res call({
 bool value
});




}
/// @nodoc
class _$MusicDlSetAlbumChangedCopyWithImpl<$Res>
    implements $MusicDlSetAlbumChangedCopyWith<$Res> {
  _$MusicDlSetAlbumChangedCopyWithImpl(this._self, this._then);

  final MusicDlSetAlbumChanged _self;
  final $Res Function(MusicDlSetAlbumChanged) _then;

/// Create a copy of MusicDlEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? value = null,}) {
  return _then(MusicDlSetAlbumChanged(
null == value ? _self.value : value // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}


}

/// @nodoc


class MusicDlDraftArtistChanged implements MusicDlEvent {
  const MusicDlDraftArtistChanged(this.value);
  

 final  String value;

/// Create a copy of MusicDlEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$MusicDlDraftArtistChangedCopyWith<MusicDlDraftArtistChanged> get copyWith => _$MusicDlDraftArtistChangedCopyWithImpl<MusicDlDraftArtistChanged>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is MusicDlDraftArtistChanged&&(identical(other.value, value) || other.value == value));
}


@override
int get hashCode => Object.hash(runtimeType,value);

@override
String toString() {
  return 'MusicDlEvent.draftArtistChanged(value: $value)';
}


}

/// @nodoc
abstract mixin class $MusicDlDraftArtistChangedCopyWith<$Res> implements $MusicDlEventCopyWith<$Res> {
  factory $MusicDlDraftArtistChangedCopyWith(MusicDlDraftArtistChanged value, $Res Function(MusicDlDraftArtistChanged) _then) = _$MusicDlDraftArtistChangedCopyWithImpl;
@useResult
$Res call({
 String value
});




}
/// @nodoc
class _$MusicDlDraftArtistChangedCopyWithImpl<$Res>
    implements $MusicDlDraftArtistChangedCopyWith<$Res> {
  _$MusicDlDraftArtistChangedCopyWithImpl(this._self, this._then);

  final MusicDlDraftArtistChanged _self;
  final $Res Function(MusicDlDraftArtistChanged) _then;

/// Create a copy of MusicDlEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? value = null,}) {
  return _then(MusicDlDraftArtistChanged(
null == value ? _self.value : value // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

/// @nodoc


class MusicDlDraftAlbumChanged implements MusicDlEvent {
  const MusicDlDraftAlbumChanged(this.value);
  

 final  String value;

/// Create a copy of MusicDlEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$MusicDlDraftAlbumChangedCopyWith<MusicDlDraftAlbumChanged> get copyWith => _$MusicDlDraftAlbumChangedCopyWithImpl<MusicDlDraftAlbumChanged>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is MusicDlDraftAlbumChanged&&(identical(other.value, value) || other.value == value));
}


@override
int get hashCode => Object.hash(runtimeType,value);

@override
String toString() {
  return 'MusicDlEvent.draftAlbumChanged(value: $value)';
}


}

/// @nodoc
abstract mixin class $MusicDlDraftAlbumChangedCopyWith<$Res> implements $MusicDlEventCopyWith<$Res> {
  factory $MusicDlDraftAlbumChangedCopyWith(MusicDlDraftAlbumChanged value, $Res Function(MusicDlDraftAlbumChanged) _then) = _$MusicDlDraftAlbumChangedCopyWithImpl;
@useResult
$Res call({
 String value
});




}
/// @nodoc
class _$MusicDlDraftAlbumChangedCopyWithImpl<$Res>
    implements $MusicDlDraftAlbumChangedCopyWith<$Res> {
  _$MusicDlDraftAlbumChangedCopyWithImpl(this._self, this._then);

  final MusicDlDraftAlbumChanged _self;
  final $Res Function(MusicDlDraftAlbumChanged) _then;

/// Create a copy of MusicDlEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? value = null,}) {
  return _then(MusicDlDraftAlbumChanged(
null == value ? _self.value : value // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

/// @nodoc


class MusicDlDraftFolderChanged implements MusicDlEvent {
  const MusicDlDraftFolderChanged(this.value);
  

 final  String value;

/// Create a copy of MusicDlEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$MusicDlDraftFolderChangedCopyWith<MusicDlDraftFolderChanged> get copyWith => _$MusicDlDraftFolderChangedCopyWithImpl<MusicDlDraftFolderChanged>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is MusicDlDraftFolderChanged&&(identical(other.value, value) || other.value == value));
}


@override
int get hashCode => Object.hash(runtimeType,value);

@override
String toString() {
  return 'MusicDlEvent.draftFolderChanged(value: $value)';
}


}

/// @nodoc
abstract mixin class $MusicDlDraftFolderChangedCopyWith<$Res> implements $MusicDlEventCopyWith<$Res> {
  factory $MusicDlDraftFolderChangedCopyWith(MusicDlDraftFolderChanged value, $Res Function(MusicDlDraftFolderChanged) _then) = _$MusicDlDraftFolderChangedCopyWithImpl;
@useResult
$Res call({
 String value
});




}
/// @nodoc
class _$MusicDlDraftFolderChangedCopyWithImpl<$Res>
    implements $MusicDlDraftFolderChangedCopyWith<$Res> {
  _$MusicDlDraftFolderChangedCopyWithImpl(this._self, this._then);

  final MusicDlDraftFolderChanged _self;
  final $Res Function(MusicDlDraftFolderChanged) _then;

/// Create a copy of MusicDlEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? value = null,}) {
  return _then(MusicDlDraftFolderChanged(
null == value ? _self.value : value // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

/// @nodoc


class MusicDlResyncRequested implements MusicDlEvent {
  const MusicDlResyncRequested(this.folder);
  

 final  String folder;

/// Create a copy of MusicDlEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$MusicDlResyncRequestedCopyWith<MusicDlResyncRequested> get copyWith => _$MusicDlResyncRequestedCopyWithImpl<MusicDlResyncRequested>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is MusicDlResyncRequested&&(identical(other.folder, folder) || other.folder == folder));
}


@override
int get hashCode => Object.hash(runtimeType,folder);

@override
String toString() {
  return 'MusicDlEvent.resyncRequested(folder: $folder)';
}


}

/// @nodoc
abstract mixin class $MusicDlResyncRequestedCopyWith<$Res> implements $MusicDlEventCopyWith<$Res> {
  factory $MusicDlResyncRequestedCopyWith(MusicDlResyncRequested value, $Res Function(MusicDlResyncRequested) _then) = _$MusicDlResyncRequestedCopyWithImpl;
@useResult
$Res call({
 String folder
});




}
/// @nodoc
class _$MusicDlResyncRequestedCopyWithImpl<$Res>
    implements $MusicDlResyncRequestedCopyWith<$Res> {
  _$MusicDlResyncRequestedCopyWithImpl(this._self, this._then);

  final MusicDlResyncRequested _self;
  final $Res Function(MusicDlResyncRequested) _then;

/// Create a copy of MusicDlEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? folder = null,}) {
  return _then(MusicDlResyncRequested(
null == folder ? _self.folder : folder // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

/// @nodoc


class MusicDlPollRequested implements MusicDlEvent {
  const MusicDlPollRequested();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is MusicDlPollRequested);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'MusicDlEvent.pollRequested()';
}


}




/// @nodoc
mixin _$MusicDlState {

 bool get loading; bool get submitting; bool get inspecting; String get url; List<MusicFolder> get folders; List<MusicDlJob> get jobs; MusicDlInspection? get inspection; String? get selectedFolder; String? get draftArtist; String? get draftAlbum; String? get draftFolder; bool get setAlbum; String? get error; String? get notice;
/// Create a copy of MusicDlState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$MusicDlStateCopyWith<MusicDlState> get copyWith => _$MusicDlStateCopyWithImpl<MusicDlState>(this as MusicDlState, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is MusicDlState&&(identical(other.loading, loading) || other.loading == loading)&&(identical(other.submitting, submitting) || other.submitting == submitting)&&(identical(other.inspecting, inspecting) || other.inspecting == inspecting)&&(identical(other.url, url) || other.url == url)&&const DeepCollectionEquality().equals(other.folders, folders)&&const DeepCollectionEquality().equals(other.jobs, jobs)&&(identical(other.inspection, inspection) || other.inspection == inspection)&&(identical(other.selectedFolder, selectedFolder) || other.selectedFolder == selectedFolder)&&(identical(other.draftArtist, draftArtist) || other.draftArtist == draftArtist)&&(identical(other.draftAlbum, draftAlbum) || other.draftAlbum == draftAlbum)&&(identical(other.draftFolder, draftFolder) || other.draftFolder == draftFolder)&&(identical(other.setAlbum, setAlbum) || other.setAlbum == setAlbum)&&(identical(other.error, error) || other.error == error)&&(identical(other.notice, notice) || other.notice == notice));
}


@override
int get hashCode => Object.hash(runtimeType,loading,submitting,inspecting,url,const DeepCollectionEquality().hash(folders),const DeepCollectionEquality().hash(jobs),inspection,selectedFolder,draftArtist,draftAlbum,draftFolder,setAlbum,error,notice);

@override
String toString() {
  return 'MusicDlState(loading: $loading, submitting: $submitting, inspecting: $inspecting, url: $url, folders: $folders, jobs: $jobs, inspection: $inspection, selectedFolder: $selectedFolder, draftArtist: $draftArtist, draftAlbum: $draftAlbum, draftFolder: $draftFolder, setAlbum: $setAlbum, error: $error, notice: $notice)';
}


}

/// @nodoc
abstract mixin class $MusicDlStateCopyWith<$Res>  {
  factory $MusicDlStateCopyWith(MusicDlState value, $Res Function(MusicDlState) _then) = _$MusicDlStateCopyWithImpl;
@useResult
$Res call({
 bool loading, bool submitting, bool inspecting, String url, List<MusicFolder> folders, List<MusicDlJob> jobs, MusicDlInspection? inspection, String? selectedFolder, String? draftArtist, String? draftAlbum, String? draftFolder, bool setAlbum, String? error, String? notice
});


$MusicDlInspectionCopyWith<$Res>? get inspection;

}
/// @nodoc
class _$MusicDlStateCopyWithImpl<$Res>
    implements $MusicDlStateCopyWith<$Res> {
  _$MusicDlStateCopyWithImpl(this._self, this._then);

  final MusicDlState _self;
  final $Res Function(MusicDlState) _then;

/// Create a copy of MusicDlState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? loading = null,Object? submitting = null,Object? inspecting = null,Object? url = null,Object? folders = null,Object? jobs = null,Object? inspection = freezed,Object? selectedFolder = freezed,Object? draftArtist = freezed,Object? draftAlbum = freezed,Object? draftFolder = freezed,Object? setAlbum = null,Object? error = freezed,Object? notice = freezed,}) {
  return _then(_self.copyWith(
loading: null == loading ? _self.loading : loading // ignore: cast_nullable_to_non_nullable
as bool,submitting: null == submitting ? _self.submitting : submitting // ignore: cast_nullable_to_non_nullable
as bool,inspecting: null == inspecting ? _self.inspecting : inspecting // ignore: cast_nullable_to_non_nullable
as bool,url: null == url ? _self.url : url // ignore: cast_nullable_to_non_nullable
as String,folders: null == folders ? _self.folders : folders // ignore: cast_nullable_to_non_nullable
as List<MusicFolder>,jobs: null == jobs ? _self.jobs : jobs // ignore: cast_nullable_to_non_nullable
as List<MusicDlJob>,inspection: freezed == inspection ? _self.inspection : inspection // ignore: cast_nullable_to_non_nullable
as MusicDlInspection?,selectedFolder: freezed == selectedFolder ? _self.selectedFolder : selectedFolder // ignore: cast_nullable_to_non_nullable
as String?,draftArtist: freezed == draftArtist ? _self.draftArtist : draftArtist // ignore: cast_nullable_to_non_nullable
as String?,draftAlbum: freezed == draftAlbum ? _self.draftAlbum : draftAlbum // ignore: cast_nullable_to_non_nullable
as String?,draftFolder: freezed == draftFolder ? _self.draftFolder : draftFolder // ignore: cast_nullable_to_non_nullable
as String?,setAlbum: null == setAlbum ? _self.setAlbum : setAlbum // ignore: cast_nullable_to_non_nullable
as bool,error: freezed == error ? _self.error : error // ignore: cast_nullable_to_non_nullable
as String?,notice: freezed == notice ? _self.notice : notice // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}
/// Create a copy of MusicDlState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$MusicDlInspectionCopyWith<$Res>? get inspection {
    if (_self.inspection == null) {
    return null;
  }

  return $MusicDlInspectionCopyWith<$Res>(_self.inspection!, (value) {
    return _then(_self.copyWith(inspection: value));
  });
}
}


/// Adds pattern-matching-related methods to [MusicDlState].
extension MusicDlStatePatterns on MusicDlState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _MusicDlState value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _MusicDlState() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _MusicDlState value)  $default,){
final _that = this;
switch (_that) {
case _MusicDlState():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _MusicDlState value)?  $default,){
final _that = this;
switch (_that) {
case _MusicDlState() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( bool loading,  bool submitting,  bool inspecting,  String url,  List<MusicFolder> folders,  List<MusicDlJob> jobs,  MusicDlInspection? inspection,  String? selectedFolder,  String? draftArtist,  String? draftAlbum,  String? draftFolder,  bool setAlbum,  String? error,  String? notice)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _MusicDlState() when $default != null:
return $default(_that.loading,_that.submitting,_that.inspecting,_that.url,_that.folders,_that.jobs,_that.inspection,_that.selectedFolder,_that.draftArtist,_that.draftAlbum,_that.draftFolder,_that.setAlbum,_that.error,_that.notice);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( bool loading,  bool submitting,  bool inspecting,  String url,  List<MusicFolder> folders,  List<MusicDlJob> jobs,  MusicDlInspection? inspection,  String? selectedFolder,  String? draftArtist,  String? draftAlbum,  String? draftFolder,  bool setAlbum,  String? error,  String? notice)  $default,) {final _that = this;
switch (_that) {
case _MusicDlState():
return $default(_that.loading,_that.submitting,_that.inspecting,_that.url,_that.folders,_that.jobs,_that.inspection,_that.selectedFolder,_that.draftArtist,_that.draftAlbum,_that.draftFolder,_that.setAlbum,_that.error,_that.notice);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( bool loading,  bool submitting,  bool inspecting,  String url,  List<MusicFolder> folders,  List<MusicDlJob> jobs,  MusicDlInspection? inspection,  String? selectedFolder,  String? draftArtist,  String? draftAlbum,  String? draftFolder,  bool setAlbum,  String? error,  String? notice)?  $default,) {final _that = this;
switch (_that) {
case _MusicDlState() when $default != null:
return $default(_that.loading,_that.submitting,_that.inspecting,_that.url,_that.folders,_that.jobs,_that.inspection,_that.selectedFolder,_that.draftArtist,_that.draftAlbum,_that.draftFolder,_that.setAlbum,_that.error,_that.notice);case _:
  return null;

}
}

}

/// @nodoc


class _MusicDlState extends MusicDlState {
  const _MusicDlState({this.loading = true, this.submitting = false, this.inspecting = false, this.url = '', final  List<MusicFolder> folders = const [], final  List<MusicDlJob> jobs = const [], this.inspection, this.selectedFolder, this.draftArtist, this.draftAlbum, this.draftFolder, this.setAlbum = true, this.error, this.notice}): _folders = folders,_jobs = jobs,super._();
  

@override@JsonKey() final  bool loading;
@override@JsonKey() final  bool submitting;
@override@JsonKey() final  bool inspecting;
@override@JsonKey() final  String url;
 final  List<MusicFolder> _folders;
@override@JsonKey() List<MusicFolder> get folders {
  if (_folders is EqualUnmodifiableListView) return _folders;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_folders);
}

 final  List<MusicDlJob> _jobs;
@override@JsonKey() List<MusicDlJob> get jobs {
  if (_jobs is EqualUnmodifiableListView) return _jobs;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_jobs);
}

@override final  MusicDlInspection? inspection;
@override final  String? selectedFolder;
@override final  String? draftArtist;
@override final  String? draftAlbum;
@override final  String? draftFolder;
@override@JsonKey() final  bool setAlbum;
@override final  String? error;
@override final  String? notice;

/// Create a copy of MusicDlState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$MusicDlStateCopyWith<_MusicDlState> get copyWith => __$MusicDlStateCopyWithImpl<_MusicDlState>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _MusicDlState&&(identical(other.loading, loading) || other.loading == loading)&&(identical(other.submitting, submitting) || other.submitting == submitting)&&(identical(other.inspecting, inspecting) || other.inspecting == inspecting)&&(identical(other.url, url) || other.url == url)&&const DeepCollectionEquality().equals(other._folders, _folders)&&const DeepCollectionEquality().equals(other._jobs, _jobs)&&(identical(other.inspection, inspection) || other.inspection == inspection)&&(identical(other.selectedFolder, selectedFolder) || other.selectedFolder == selectedFolder)&&(identical(other.draftArtist, draftArtist) || other.draftArtist == draftArtist)&&(identical(other.draftAlbum, draftAlbum) || other.draftAlbum == draftAlbum)&&(identical(other.draftFolder, draftFolder) || other.draftFolder == draftFolder)&&(identical(other.setAlbum, setAlbum) || other.setAlbum == setAlbum)&&(identical(other.error, error) || other.error == error)&&(identical(other.notice, notice) || other.notice == notice));
}


@override
int get hashCode => Object.hash(runtimeType,loading,submitting,inspecting,url,const DeepCollectionEquality().hash(_folders),const DeepCollectionEquality().hash(_jobs),inspection,selectedFolder,draftArtist,draftAlbum,draftFolder,setAlbum,error,notice);

@override
String toString() {
  return 'MusicDlState(loading: $loading, submitting: $submitting, inspecting: $inspecting, url: $url, folders: $folders, jobs: $jobs, inspection: $inspection, selectedFolder: $selectedFolder, draftArtist: $draftArtist, draftAlbum: $draftAlbum, draftFolder: $draftFolder, setAlbum: $setAlbum, error: $error, notice: $notice)';
}


}

/// @nodoc
abstract mixin class _$MusicDlStateCopyWith<$Res> implements $MusicDlStateCopyWith<$Res> {
  factory _$MusicDlStateCopyWith(_MusicDlState value, $Res Function(_MusicDlState) _then) = __$MusicDlStateCopyWithImpl;
@override @useResult
$Res call({
 bool loading, bool submitting, bool inspecting, String url, List<MusicFolder> folders, List<MusicDlJob> jobs, MusicDlInspection? inspection, String? selectedFolder, String? draftArtist, String? draftAlbum, String? draftFolder, bool setAlbum, String? error, String? notice
});


@override $MusicDlInspectionCopyWith<$Res>? get inspection;

}
/// @nodoc
class __$MusicDlStateCopyWithImpl<$Res>
    implements _$MusicDlStateCopyWith<$Res> {
  __$MusicDlStateCopyWithImpl(this._self, this._then);

  final _MusicDlState _self;
  final $Res Function(_MusicDlState) _then;

/// Create a copy of MusicDlState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? loading = null,Object? submitting = null,Object? inspecting = null,Object? url = null,Object? folders = null,Object? jobs = null,Object? inspection = freezed,Object? selectedFolder = freezed,Object? draftArtist = freezed,Object? draftAlbum = freezed,Object? draftFolder = freezed,Object? setAlbum = null,Object? error = freezed,Object? notice = freezed,}) {
  return _then(_MusicDlState(
loading: null == loading ? _self.loading : loading // ignore: cast_nullable_to_non_nullable
as bool,submitting: null == submitting ? _self.submitting : submitting // ignore: cast_nullable_to_non_nullable
as bool,inspecting: null == inspecting ? _self.inspecting : inspecting // ignore: cast_nullable_to_non_nullable
as bool,url: null == url ? _self.url : url // ignore: cast_nullable_to_non_nullable
as String,folders: null == folders ? _self._folders : folders // ignore: cast_nullable_to_non_nullable
as List<MusicFolder>,jobs: null == jobs ? _self._jobs : jobs // ignore: cast_nullable_to_non_nullable
as List<MusicDlJob>,inspection: freezed == inspection ? _self.inspection : inspection // ignore: cast_nullable_to_non_nullable
as MusicDlInspection?,selectedFolder: freezed == selectedFolder ? _self.selectedFolder : selectedFolder // ignore: cast_nullable_to_non_nullable
as String?,draftArtist: freezed == draftArtist ? _self.draftArtist : draftArtist // ignore: cast_nullable_to_non_nullable
as String?,draftAlbum: freezed == draftAlbum ? _self.draftAlbum : draftAlbum // ignore: cast_nullable_to_non_nullable
as String?,draftFolder: freezed == draftFolder ? _self.draftFolder : draftFolder // ignore: cast_nullable_to_non_nullable
as String?,setAlbum: null == setAlbum ? _self.setAlbum : setAlbum // ignore: cast_nullable_to_non_nullable
as bool,error: freezed == error ? _self.error : error // ignore: cast_nullable_to_non_nullable
as String?,notice: freezed == notice ? _self.notice : notice // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

/// Create a copy of MusicDlState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$MusicDlInspectionCopyWith<$Res>? get inspection {
    if (_self.inspection == null) {
    return null;
  }

  return $MusicDlInspectionCopyWith<$Res>(_self.inspection!, (value) {
    return _then(_self.copyWith(inspection: value));
  });
}
}

// dart format on
