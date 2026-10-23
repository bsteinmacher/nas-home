// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'music_dl.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$MusicFolder {

 String get name;@JsonKey(name: 'track_count') int get trackCount;@JsonKey(name: 'source_url') String? get sourceUrl;@JsonKey(name: 'set_album') bool get setAlbum;
/// Create a copy of MusicFolder
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$MusicFolderCopyWith<MusicFolder> get copyWith => _$MusicFolderCopyWithImpl<MusicFolder>(this as MusicFolder, _$identity);

  /// Serializes this MusicFolder to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is MusicFolder&&(identical(other.name, name) || other.name == name)&&(identical(other.trackCount, trackCount) || other.trackCount == trackCount)&&(identical(other.sourceUrl, sourceUrl) || other.sourceUrl == sourceUrl)&&(identical(other.setAlbum, setAlbum) || other.setAlbum == setAlbum));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,name,trackCount,sourceUrl,setAlbum);

@override
String toString() {
  return 'MusicFolder(name: $name, trackCount: $trackCount, sourceUrl: $sourceUrl, setAlbum: $setAlbum)';
}


}

/// @nodoc
abstract mixin class $MusicFolderCopyWith<$Res>  {
  factory $MusicFolderCopyWith(MusicFolder value, $Res Function(MusicFolder) _then) = _$MusicFolderCopyWithImpl;
@useResult
$Res call({
 String name,@JsonKey(name: 'track_count') int trackCount,@JsonKey(name: 'source_url') String? sourceUrl,@JsonKey(name: 'set_album') bool setAlbum
});




}
/// @nodoc
class _$MusicFolderCopyWithImpl<$Res>
    implements $MusicFolderCopyWith<$Res> {
  _$MusicFolderCopyWithImpl(this._self, this._then);

  final MusicFolder _self;
  final $Res Function(MusicFolder) _then;

/// Create a copy of MusicFolder
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? name = null,Object? trackCount = null,Object? sourceUrl = freezed,Object? setAlbum = null,}) {
  return _then(_self.copyWith(
name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,trackCount: null == trackCount ? _self.trackCount : trackCount // ignore: cast_nullable_to_non_nullable
as int,sourceUrl: freezed == sourceUrl ? _self.sourceUrl : sourceUrl // ignore: cast_nullable_to_non_nullable
as String?,setAlbum: null == setAlbum ? _self.setAlbum : setAlbum // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}

}


/// Adds pattern-matching-related methods to [MusicFolder].
extension MusicFolderPatterns on MusicFolder {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _MusicFolder value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _MusicFolder() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _MusicFolder value)  $default,){
final _that = this;
switch (_that) {
case _MusicFolder():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _MusicFolder value)?  $default,){
final _that = this;
switch (_that) {
case _MusicFolder() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String name, @JsonKey(name: 'track_count')  int trackCount, @JsonKey(name: 'source_url')  String? sourceUrl, @JsonKey(name: 'set_album')  bool setAlbum)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _MusicFolder() when $default != null:
return $default(_that.name,_that.trackCount,_that.sourceUrl,_that.setAlbum);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String name, @JsonKey(name: 'track_count')  int trackCount, @JsonKey(name: 'source_url')  String? sourceUrl, @JsonKey(name: 'set_album')  bool setAlbum)  $default,) {final _that = this;
switch (_that) {
case _MusicFolder():
return $default(_that.name,_that.trackCount,_that.sourceUrl,_that.setAlbum);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String name, @JsonKey(name: 'track_count')  int trackCount, @JsonKey(name: 'source_url')  String? sourceUrl, @JsonKey(name: 'set_album')  bool setAlbum)?  $default,) {final _that = this;
switch (_that) {
case _MusicFolder() when $default != null:
return $default(_that.name,_that.trackCount,_that.sourceUrl,_that.setAlbum);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _MusicFolder implements MusicFolder {
  const _MusicFolder({required this.name, @JsonKey(name: 'track_count') this.trackCount = 0, @JsonKey(name: 'source_url') this.sourceUrl, @JsonKey(name: 'set_album') this.setAlbum = true});
  factory _MusicFolder.fromJson(Map<String, dynamic> json) => _$MusicFolderFromJson(json);

@override final  String name;
@override@JsonKey(name: 'track_count') final  int trackCount;
@override@JsonKey(name: 'source_url') final  String? sourceUrl;
@override@JsonKey(name: 'set_album') final  bool setAlbum;

/// Create a copy of MusicFolder
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$MusicFolderCopyWith<_MusicFolder> get copyWith => __$MusicFolderCopyWithImpl<_MusicFolder>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$MusicFolderToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _MusicFolder&&(identical(other.name, name) || other.name == name)&&(identical(other.trackCount, trackCount) || other.trackCount == trackCount)&&(identical(other.sourceUrl, sourceUrl) || other.sourceUrl == sourceUrl)&&(identical(other.setAlbum, setAlbum) || other.setAlbum == setAlbum));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,name,trackCount,sourceUrl,setAlbum);

@override
String toString() {
  return 'MusicFolder(name: $name, trackCount: $trackCount, sourceUrl: $sourceUrl, setAlbum: $setAlbum)';
}


}

/// @nodoc
abstract mixin class _$MusicFolderCopyWith<$Res> implements $MusicFolderCopyWith<$Res> {
  factory _$MusicFolderCopyWith(_MusicFolder value, $Res Function(_MusicFolder) _then) = __$MusicFolderCopyWithImpl;
@override @useResult
$Res call({
 String name,@JsonKey(name: 'track_count') int trackCount,@JsonKey(name: 'source_url') String? sourceUrl,@JsonKey(name: 'set_album') bool setAlbum
});




}
/// @nodoc
class __$MusicFolderCopyWithImpl<$Res>
    implements _$MusicFolderCopyWith<$Res> {
  __$MusicFolderCopyWithImpl(this._self, this._then);

  final _MusicFolder _self;
  final $Res Function(_MusicFolder) _then;

/// Create a copy of MusicFolder
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? name = null,Object? trackCount = null,Object? sourceUrl = freezed,Object? setAlbum = null,}) {
  return _then(_MusicFolder(
name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,trackCount: null == trackCount ? _self.trackCount : trackCount // ignore: cast_nullable_to_non_nullable
as int,sourceUrl: freezed == sourceUrl ? _self.sourceUrl : sourceUrl // ignore: cast_nullable_to_non_nullable
as String?,setAlbum: null == setAlbum ? _self.setAlbum : setAlbum // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}


}


/// @nodoc
mixin _$MusicDlJob {

 String get id; String get url; String get folder;@JsonKey(name: 'set_album') bool get setAlbum; String get mode; String get status; double get percent; String? get title;@JsonKey(name: 'current_item') int? get currentItem;@JsonKey(name: 'total_items') int? get totalItems; String? get error;@JsonKey(name: 'sponsorblock_cut') bool get sponsorblockCut;@JsonKey(name: 'output_path') String? get outputPath; String? get artist; String? get album; List<String> get files;@JsonKey(name: 'created_at') String? get createdAt;@JsonKey(name: 'updated_at') String? get updatedAt;
/// Create a copy of MusicDlJob
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$MusicDlJobCopyWith<MusicDlJob> get copyWith => _$MusicDlJobCopyWithImpl<MusicDlJob>(this as MusicDlJob, _$identity);

  /// Serializes this MusicDlJob to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is MusicDlJob&&(identical(other.id, id) || other.id == id)&&(identical(other.url, url) || other.url == url)&&(identical(other.folder, folder) || other.folder == folder)&&(identical(other.setAlbum, setAlbum) || other.setAlbum == setAlbum)&&(identical(other.mode, mode) || other.mode == mode)&&(identical(other.status, status) || other.status == status)&&(identical(other.percent, percent) || other.percent == percent)&&(identical(other.title, title) || other.title == title)&&(identical(other.currentItem, currentItem) || other.currentItem == currentItem)&&(identical(other.totalItems, totalItems) || other.totalItems == totalItems)&&(identical(other.error, error) || other.error == error)&&(identical(other.sponsorblockCut, sponsorblockCut) || other.sponsorblockCut == sponsorblockCut)&&(identical(other.outputPath, outputPath) || other.outputPath == outputPath)&&(identical(other.artist, artist) || other.artist == artist)&&(identical(other.album, album) || other.album == album)&&const DeepCollectionEquality().equals(other.files, files)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.updatedAt, updatedAt) || other.updatedAt == updatedAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,url,folder,setAlbum,mode,status,percent,title,currentItem,totalItems,error,sponsorblockCut,outputPath,artist,album,const DeepCollectionEquality().hash(files),createdAt,updatedAt);

@override
String toString() {
  return 'MusicDlJob(id: $id, url: $url, folder: $folder, setAlbum: $setAlbum, mode: $mode, status: $status, percent: $percent, title: $title, currentItem: $currentItem, totalItems: $totalItems, error: $error, sponsorblockCut: $sponsorblockCut, outputPath: $outputPath, artist: $artist, album: $album, files: $files, createdAt: $createdAt, updatedAt: $updatedAt)';
}


}

/// @nodoc
abstract mixin class $MusicDlJobCopyWith<$Res>  {
  factory $MusicDlJobCopyWith(MusicDlJob value, $Res Function(MusicDlJob) _then) = _$MusicDlJobCopyWithImpl;
@useResult
$Res call({
 String id, String url, String folder,@JsonKey(name: 'set_album') bool setAlbum, String mode, String status, double percent, String? title,@JsonKey(name: 'current_item') int? currentItem,@JsonKey(name: 'total_items') int? totalItems, String? error,@JsonKey(name: 'sponsorblock_cut') bool sponsorblockCut,@JsonKey(name: 'output_path') String? outputPath, String? artist, String? album, List<String> files,@JsonKey(name: 'created_at') String? createdAt,@JsonKey(name: 'updated_at') String? updatedAt
});




}
/// @nodoc
class _$MusicDlJobCopyWithImpl<$Res>
    implements $MusicDlJobCopyWith<$Res> {
  _$MusicDlJobCopyWithImpl(this._self, this._then);

  final MusicDlJob _self;
  final $Res Function(MusicDlJob) _then;

/// Create a copy of MusicDlJob
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? url = null,Object? folder = null,Object? setAlbum = null,Object? mode = null,Object? status = null,Object? percent = null,Object? title = freezed,Object? currentItem = freezed,Object? totalItems = freezed,Object? error = freezed,Object? sponsorblockCut = null,Object? outputPath = freezed,Object? artist = freezed,Object? album = freezed,Object? files = null,Object? createdAt = freezed,Object? updatedAt = freezed,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,url: null == url ? _self.url : url // ignore: cast_nullable_to_non_nullable
as String,folder: null == folder ? _self.folder : folder // ignore: cast_nullable_to_non_nullable
as String,setAlbum: null == setAlbum ? _self.setAlbum : setAlbum // ignore: cast_nullable_to_non_nullable
as bool,mode: null == mode ? _self.mode : mode // ignore: cast_nullable_to_non_nullable
as String,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as String,percent: null == percent ? _self.percent : percent // ignore: cast_nullable_to_non_nullable
as double,title: freezed == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String?,currentItem: freezed == currentItem ? _self.currentItem : currentItem // ignore: cast_nullable_to_non_nullable
as int?,totalItems: freezed == totalItems ? _self.totalItems : totalItems // ignore: cast_nullable_to_non_nullable
as int?,error: freezed == error ? _self.error : error // ignore: cast_nullable_to_non_nullable
as String?,sponsorblockCut: null == sponsorblockCut ? _self.sponsorblockCut : sponsorblockCut // ignore: cast_nullable_to_non_nullable
as bool,outputPath: freezed == outputPath ? _self.outputPath : outputPath // ignore: cast_nullable_to_non_nullable
as String?,artist: freezed == artist ? _self.artist : artist // ignore: cast_nullable_to_non_nullable
as String?,album: freezed == album ? _self.album : album // ignore: cast_nullable_to_non_nullable
as String?,files: null == files ? _self.files : files // ignore: cast_nullable_to_non_nullable
as List<String>,createdAt: freezed == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as String?,updatedAt: freezed == updatedAt ? _self.updatedAt : updatedAt // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [MusicDlJob].
extension MusicDlJobPatterns on MusicDlJob {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _MusicDlJob value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _MusicDlJob() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _MusicDlJob value)  $default,){
final _that = this;
switch (_that) {
case _MusicDlJob():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _MusicDlJob value)?  $default,){
final _that = this;
switch (_that) {
case _MusicDlJob() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  String url,  String folder, @JsonKey(name: 'set_album')  bool setAlbum,  String mode,  String status,  double percent,  String? title, @JsonKey(name: 'current_item')  int? currentItem, @JsonKey(name: 'total_items')  int? totalItems,  String? error, @JsonKey(name: 'sponsorblock_cut')  bool sponsorblockCut, @JsonKey(name: 'output_path')  String? outputPath,  String? artist,  String? album,  List<String> files, @JsonKey(name: 'created_at')  String? createdAt, @JsonKey(name: 'updated_at')  String? updatedAt)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _MusicDlJob() when $default != null:
return $default(_that.id,_that.url,_that.folder,_that.setAlbum,_that.mode,_that.status,_that.percent,_that.title,_that.currentItem,_that.totalItems,_that.error,_that.sponsorblockCut,_that.outputPath,_that.artist,_that.album,_that.files,_that.createdAt,_that.updatedAt);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  String url,  String folder, @JsonKey(name: 'set_album')  bool setAlbum,  String mode,  String status,  double percent,  String? title, @JsonKey(name: 'current_item')  int? currentItem, @JsonKey(name: 'total_items')  int? totalItems,  String? error, @JsonKey(name: 'sponsorblock_cut')  bool sponsorblockCut, @JsonKey(name: 'output_path')  String? outputPath,  String? artist,  String? album,  List<String> files, @JsonKey(name: 'created_at')  String? createdAt, @JsonKey(name: 'updated_at')  String? updatedAt)  $default,) {final _that = this;
switch (_that) {
case _MusicDlJob():
return $default(_that.id,_that.url,_that.folder,_that.setAlbum,_that.mode,_that.status,_that.percent,_that.title,_that.currentItem,_that.totalItems,_that.error,_that.sponsorblockCut,_that.outputPath,_that.artist,_that.album,_that.files,_that.createdAt,_that.updatedAt);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  String url,  String folder, @JsonKey(name: 'set_album')  bool setAlbum,  String mode,  String status,  double percent,  String? title, @JsonKey(name: 'current_item')  int? currentItem, @JsonKey(name: 'total_items')  int? totalItems,  String? error, @JsonKey(name: 'sponsorblock_cut')  bool sponsorblockCut, @JsonKey(name: 'output_path')  String? outputPath,  String? artist,  String? album,  List<String> files, @JsonKey(name: 'created_at')  String? createdAt, @JsonKey(name: 'updated_at')  String? updatedAt)?  $default,) {final _that = this;
switch (_that) {
case _MusicDlJob() when $default != null:
return $default(_that.id,_that.url,_that.folder,_that.setAlbum,_that.mode,_that.status,_that.percent,_that.title,_that.currentItem,_that.totalItems,_that.error,_that.sponsorblockCut,_that.outputPath,_that.artist,_that.album,_that.files,_that.createdAt,_that.updatedAt);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _MusicDlJob extends MusicDlJob {
  const _MusicDlJob({required this.id, required this.url, required this.folder, @JsonKey(name: 'set_album') this.setAlbum = true, required this.mode, required this.status, this.percent = 0, this.title, @JsonKey(name: 'current_item') this.currentItem, @JsonKey(name: 'total_items') this.totalItems, this.error, @JsonKey(name: 'sponsorblock_cut') this.sponsorblockCut = false, @JsonKey(name: 'output_path') this.outputPath, this.artist, this.album, final  List<String> files = const [], @JsonKey(name: 'created_at') this.createdAt, @JsonKey(name: 'updated_at') this.updatedAt}): _files = files,super._();
  factory _MusicDlJob.fromJson(Map<String, dynamic> json) => _$MusicDlJobFromJson(json);

@override final  String id;
@override final  String url;
@override final  String folder;
@override@JsonKey(name: 'set_album') final  bool setAlbum;
@override final  String mode;
@override final  String status;
@override@JsonKey() final  double percent;
@override final  String? title;
@override@JsonKey(name: 'current_item') final  int? currentItem;
@override@JsonKey(name: 'total_items') final  int? totalItems;
@override final  String? error;
@override@JsonKey(name: 'sponsorblock_cut') final  bool sponsorblockCut;
@override@JsonKey(name: 'output_path') final  String? outputPath;
@override final  String? artist;
@override final  String? album;
 final  List<String> _files;
@override@JsonKey() List<String> get files {
  if (_files is EqualUnmodifiableListView) return _files;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_files);
}

@override@JsonKey(name: 'created_at') final  String? createdAt;
@override@JsonKey(name: 'updated_at') final  String? updatedAt;

/// Create a copy of MusicDlJob
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$MusicDlJobCopyWith<_MusicDlJob> get copyWith => __$MusicDlJobCopyWithImpl<_MusicDlJob>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$MusicDlJobToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _MusicDlJob&&(identical(other.id, id) || other.id == id)&&(identical(other.url, url) || other.url == url)&&(identical(other.folder, folder) || other.folder == folder)&&(identical(other.setAlbum, setAlbum) || other.setAlbum == setAlbum)&&(identical(other.mode, mode) || other.mode == mode)&&(identical(other.status, status) || other.status == status)&&(identical(other.percent, percent) || other.percent == percent)&&(identical(other.title, title) || other.title == title)&&(identical(other.currentItem, currentItem) || other.currentItem == currentItem)&&(identical(other.totalItems, totalItems) || other.totalItems == totalItems)&&(identical(other.error, error) || other.error == error)&&(identical(other.sponsorblockCut, sponsorblockCut) || other.sponsorblockCut == sponsorblockCut)&&(identical(other.outputPath, outputPath) || other.outputPath == outputPath)&&(identical(other.artist, artist) || other.artist == artist)&&(identical(other.album, album) || other.album == album)&&const DeepCollectionEquality().equals(other._files, _files)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.updatedAt, updatedAt) || other.updatedAt == updatedAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,url,folder,setAlbum,mode,status,percent,title,currentItem,totalItems,error,sponsorblockCut,outputPath,artist,album,const DeepCollectionEquality().hash(_files),createdAt,updatedAt);

@override
String toString() {
  return 'MusicDlJob(id: $id, url: $url, folder: $folder, setAlbum: $setAlbum, mode: $mode, status: $status, percent: $percent, title: $title, currentItem: $currentItem, totalItems: $totalItems, error: $error, sponsorblockCut: $sponsorblockCut, outputPath: $outputPath, artist: $artist, album: $album, files: $files, createdAt: $createdAt, updatedAt: $updatedAt)';
}


}

/// @nodoc
abstract mixin class _$MusicDlJobCopyWith<$Res> implements $MusicDlJobCopyWith<$Res> {
  factory _$MusicDlJobCopyWith(_MusicDlJob value, $Res Function(_MusicDlJob) _then) = __$MusicDlJobCopyWithImpl;
@override @useResult
$Res call({
 String id, String url, String folder,@JsonKey(name: 'set_album') bool setAlbum, String mode, String status, double percent, String? title,@JsonKey(name: 'current_item') int? currentItem,@JsonKey(name: 'total_items') int? totalItems, String? error,@JsonKey(name: 'sponsorblock_cut') bool sponsorblockCut,@JsonKey(name: 'output_path') String? outputPath, String? artist, String? album, List<String> files,@JsonKey(name: 'created_at') String? createdAt,@JsonKey(name: 'updated_at') String? updatedAt
});




}
/// @nodoc
class __$MusicDlJobCopyWithImpl<$Res>
    implements _$MusicDlJobCopyWith<$Res> {
  __$MusicDlJobCopyWithImpl(this._self, this._then);

  final _MusicDlJob _self;
  final $Res Function(_MusicDlJob) _then;

/// Create a copy of MusicDlJob
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? url = null,Object? folder = null,Object? setAlbum = null,Object? mode = null,Object? status = null,Object? percent = null,Object? title = freezed,Object? currentItem = freezed,Object? totalItems = freezed,Object? error = freezed,Object? sponsorblockCut = null,Object? outputPath = freezed,Object? artist = freezed,Object? album = freezed,Object? files = null,Object? createdAt = freezed,Object? updatedAt = freezed,}) {
  return _then(_MusicDlJob(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,url: null == url ? _self.url : url // ignore: cast_nullable_to_non_nullable
as String,folder: null == folder ? _self.folder : folder // ignore: cast_nullable_to_non_nullable
as String,setAlbum: null == setAlbum ? _self.setAlbum : setAlbum // ignore: cast_nullable_to_non_nullable
as bool,mode: null == mode ? _self.mode : mode // ignore: cast_nullable_to_non_nullable
as String,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as String,percent: null == percent ? _self.percent : percent // ignore: cast_nullable_to_non_nullable
as double,title: freezed == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String?,currentItem: freezed == currentItem ? _self.currentItem : currentItem // ignore: cast_nullable_to_non_nullable
as int?,totalItems: freezed == totalItems ? _self.totalItems : totalItems // ignore: cast_nullable_to_non_nullable
as int?,error: freezed == error ? _self.error : error // ignore: cast_nullable_to_non_nullable
as String?,sponsorblockCut: null == sponsorblockCut ? _self.sponsorblockCut : sponsorblockCut // ignore: cast_nullable_to_non_nullable
as bool,outputPath: freezed == outputPath ? _self.outputPath : outputPath // ignore: cast_nullable_to_non_nullable
as String?,artist: freezed == artist ? _self.artist : artist // ignore: cast_nullable_to_non_nullable
as String?,album: freezed == album ? _self.album : album // ignore: cast_nullable_to_non_nullable
as String?,files: null == files ? _self._files : files // ignore: cast_nullable_to_non_nullable
as List<String>,createdAt: freezed == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as String?,updatedAt: freezed == updatedAt ? _self.updatedAt : updatedAt // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}


/// @nodoc
mixin _$MusicDlInspection {

 String get kind; String get url; String? get title; String? get artist;@JsonKey(name: 'track_count') int? get trackCount;@JsonKey(name: 'suggested_artist') String? get suggestedArtist;@JsonKey(name: 'suggested_album') String? get suggestedAlbum;@JsonKey(name: 'suggested_folder') String? get suggestedFolder;@JsonKey(name: 'existing_folder') String? get existingFolder;@JsonKey(name: 'list_id') String? get listId;
/// Create a copy of MusicDlInspection
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$MusicDlInspectionCopyWith<MusicDlInspection> get copyWith => _$MusicDlInspectionCopyWithImpl<MusicDlInspection>(this as MusicDlInspection, _$identity);

  /// Serializes this MusicDlInspection to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is MusicDlInspection&&(identical(other.kind, kind) || other.kind == kind)&&(identical(other.url, url) || other.url == url)&&(identical(other.title, title) || other.title == title)&&(identical(other.artist, artist) || other.artist == artist)&&(identical(other.trackCount, trackCount) || other.trackCount == trackCount)&&(identical(other.suggestedArtist, suggestedArtist) || other.suggestedArtist == suggestedArtist)&&(identical(other.suggestedAlbum, suggestedAlbum) || other.suggestedAlbum == suggestedAlbum)&&(identical(other.suggestedFolder, suggestedFolder) || other.suggestedFolder == suggestedFolder)&&(identical(other.existingFolder, existingFolder) || other.existingFolder == existingFolder)&&(identical(other.listId, listId) || other.listId == listId));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,kind,url,title,artist,trackCount,suggestedArtist,suggestedAlbum,suggestedFolder,existingFolder,listId);

@override
String toString() {
  return 'MusicDlInspection(kind: $kind, url: $url, title: $title, artist: $artist, trackCount: $trackCount, suggestedArtist: $suggestedArtist, suggestedAlbum: $suggestedAlbum, suggestedFolder: $suggestedFolder, existingFolder: $existingFolder, listId: $listId)';
}


}

/// @nodoc
abstract mixin class $MusicDlInspectionCopyWith<$Res>  {
  factory $MusicDlInspectionCopyWith(MusicDlInspection value, $Res Function(MusicDlInspection) _then) = _$MusicDlInspectionCopyWithImpl;
@useResult
$Res call({
 String kind, String url, String? title, String? artist,@JsonKey(name: 'track_count') int? trackCount,@JsonKey(name: 'suggested_artist') String? suggestedArtist,@JsonKey(name: 'suggested_album') String? suggestedAlbum,@JsonKey(name: 'suggested_folder') String? suggestedFolder,@JsonKey(name: 'existing_folder') String? existingFolder,@JsonKey(name: 'list_id') String? listId
});




}
/// @nodoc
class _$MusicDlInspectionCopyWithImpl<$Res>
    implements $MusicDlInspectionCopyWith<$Res> {
  _$MusicDlInspectionCopyWithImpl(this._self, this._then);

  final MusicDlInspection _self;
  final $Res Function(MusicDlInspection) _then;

/// Create a copy of MusicDlInspection
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? kind = null,Object? url = null,Object? title = freezed,Object? artist = freezed,Object? trackCount = freezed,Object? suggestedArtist = freezed,Object? suggestedAlbum = freezed,Object? suggestedFolder = freezed,Object? existingFolder = freezed,Object? listId = freezed,}) {
  return _then(_self.copyWith(
kind: null == kind ? _self.kind : kind // ignore: cast_nullable_to_non_nullable
as String,url: null == url ? _self.url : url // ignore: cast_nullable_to_non_nullable
as String,title: freezed == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String?,artist: freezed == artist ? _self.artist : artist // ignore: cast_nullable_to_non_nullable
as String?,trackCount: freezed == trackCount ? _self.trackCount : trackCount // ignore: cast_nullable_to_non_nullable
as int?,suggestedArtist: freezed == suggestedArtist ? _self.suggestedArtist : suggestedArtist // ignore: cast_nullable_to_non_nullable
as String?,suggestedAlbum: freezed == suggestedAlbum ? _self.suggestedAlbum : suggestedAlbum // ignore: cast_nullable_to_non_nullable
as String?,suggestedFolder: freezed == suggestedFolder ? _self.suggestedFolder : suggestedFolder // ignore: cast_nullable_to_non_nullable
as String?,existingFolder: freezed == existingFolder ? _self.existingFolder : existingFolder // ignore: cast_nullable_to_non_nullable
as String?,listId: freezed == listId ? _self.listId : listId // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [MusicDlInspection].
extension MusicDlInspectionPatterns on MusicDlInspection {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _MusicDlInspection value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _MusicDlInspection() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _MusicDlInspection value)  $default,){
final _that = this;
switch (_that) {
case _MusicDlInspection():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _MusicDlInspection value)?  $default,){
final _that = this;
switch (_that) {
case _MusicDlInspection() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String kind,  String url,  String? title,  String? artist, @JsonKey(name: 'track_count')  int? trackCount, @JsonKey(name: 'suggested_artist')  String? suggestedArtist, @JsonKey(name: 'suggested_album')  String? suggestedAlbum, @JsonKey(name: 'suggested_folder')  String? suggestedFolder, @JsonKey(name: 'existing_folder')  String? existingFolder, @JsonKey(name: 'list_id')  String? listId)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _MusicDlInspection() when $default != null:
return $default(_that.kind,_that.url,_that.title,_that.artist,_that.trackCount,_that.suggestedArtist,_that.suggestedAlbum,_that.suggestedFolder,_that.existingFolder,_that.listId);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String kind,  String url,  String? title,  String? artist, @JsonKey(name: 'track_count')  int? trackCount, @JsonKey(name: 'suggested_artist')  String? suggestedArtist, @JsonKey(name: 'suggested_album')  String? suggestedAlbum, @JsonKey(name: 'suggested_folder')  String? suggestedFolder, @JsonKey(name: 'existing_folder')  String? existingFolder, @JsonKey(name: 'list_id')  String? listId)  $default,) {final _that = this;
switch (_that) {
case _MusicDlInspection():
return $default(_that.kind,_that.url,_that.title,_that.artist,_that.trackCount,_that.suggestedArtist,_that.suggestedAlbum,_that.suggestedFolder,_that.existingFolder,_that.listId);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String kind,  String url,  String? title,  String? artist, @JsonKey(name: 'track_count')  int? trackCount, @JsonKey(name: 'suggested_artist')  String? suggestedArtist, @JsonKey(name: 'suggested_album')  String? suggestedAlbum, @JsonKey(name: 'suggested_folder')  String? suggestedFolder, @JsonKey(name: 'existing_folder')  String? existingFolder, @JsonKey(name: 'list_id')  String? listId)?  $default,) {final _that = this;
switch (_that) {
case _MusicDlInspection() when $default != null:
return $default(_that.kind,_that.url,_that.title,_that.artist,_that.trackCount,_that.suggestedArtist,_that.suggestedAlbum,_that.suggestedFolder,_that.existingFolder,_that.listId);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _MusicDlInspection implements MusicDlInspection {
  const _MusicDlInspection({required this.kind, required this.url, this.title, this.artist, @JsonKey(name: 'track_count') this.trackCount, @JsonKey(name: 'suggested_artist') this.suggestedArtist, @JsonKey(name: 'suggested_album') this.suggestedAlbum, @JsonKey(name: 'suggested_folder') this.suggestedFolder, @JsonKey(name: 'existing_folder') this.existingFolder, @JsonKey(name: 'list_id') this.listId});
  factory _MusicDlInspection.fromJson(Map<String, dynamic> json) => _$MusicDlInspectionFromJson(json);

@override final  String kind;
@override final  String url;
@override final  String? title;
@override final  String? artist;
@override@JsonKey(name: 'track_count') final  int? trackCount;
@override@JsonKey(name: 'suggested_artist') final  String? suggestedArtist;
@override@JsonKey(name: 'suggested_album') final  String? suggestedAlbum;
@override@JsonKey(name: 'suggested_folder') final  String? suggestedFolder;
@override@JsonKey(name: 'existing_folder') final  String? existingFolder;
@override@JsonKey(name: 'list_id') final  String? listId;

/// Create a copy of MusicDlInspection
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$MusicDlInspectionCopyWith<_MusicDlInspection> get copyWith => __$MusicDlInspectionCopyWithImpl<_MusicDlInspection>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$MusicDlInspectionToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _MusicDlInspection&&(identical(other.kind, kind) || other.kind == kind)&&(identical(other.url, url) || other.url == url)&&(identical(other.title, title) || other.title == title)&&(identical(other.artist, artist) || other.artist == artist)&&(identical(other.trackCount, trackCount) || other.trackCount == trackCount)&&(identical(other.suggestedArtist, suggestedArtist) || other.suggestedArtist == suggestedArtist)&&(identical(other.suggestedAlbum, suggestedAlbum) || other.suggestedAlbum == suggestedAlbum)&&(identical(other.suggestedFolder, suggestedFolder) || other.suggestedFolder == suggestedFolder)&&(identical(other.existingFolder, existingFolder) || other.existingFolder == existingFolder)&&(identical(other.listId, listId) || other.listId == listId));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,kind,url,title,artist,trackCount,suggestedArtist,suggestedAlbum,suggestedFolder,existingFolder,listId);

@override
String toString() {
  return 'MusicDlInspection(kind: $kind, url: $url, title: $title, artist: $artist, trackCount: $trackCount, suggestedArtist: $suggestedArtist, suggestedAlbum: $suggestedAlbum, suggestedFolder: $suggestedFolder, existingFolder: $existingFolder, listId: $listId)';
}


}

/// @nodoc
abstract mixin class _$MusicDlInspectionCopyWith<$Res> implements $MusicDlInspectionCopyWith<$Res> {
  factory _$MusicDlInspectionCopyWith(_MusicDlInspection value, $Res Function(_MusicDlInspection) _then) = __$MusicDlInspectionCopyWithImpl;
@override @useResult
$Res call({
 String kind, String url, String? title, String? artist,@JsonKey(name: 'track_count') int? trackCount,@JsonKey(name: 'suggested_artist') String? suggestedArtist,@JsonKey(name: 'suggested_album') String? suggestedAlbum,@JsonKey(name: 'suggested_folder') String? suggestedFolder,@JsonKey(name: 'existing_folder') String? existingFolder,@JsonKey(name: 'list_id') String? listId
});




}
/// @nodoc
class __$MusicDlInspectionCopyWithImpl<$Res>
    implements _$MusicDlInspectionCopyWith<$Res> {
  __$MusicDlInspectionCopyWithImpl(this._self, this._then);

  final _MusicDlInspection _self;
  final $Res Function(_MusicDlInspection) _then;

/// Create a copy of MusicDlInspection
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? kind = null,Object? url = null,Object? title = freezed,Object? artist = freezed,Object? trackCount = freezed,Object? suggestedArtist = freezed,Object? suggestedAlbum = freezed,Object? suggestedFolder = freezed,Object? existingFolder = freezed,Object? listId = freezed,}) {
  return _then(_MusicDlInspection(
kind: null == kind ? _self.kind : kind // ignore: cast_nullable_to_non_nullable
as String,url: null == url ? _self.url : url // ignore: cast_nullable_to_non_nullable
as String,title: freezed == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String?,artist: freezed == artist ? _self.artist : artist // ignore: cast_nullable_to_non_nullable
as String?,trackCount: freezed == trackCount ? _self.trackCount : trackCount // ignore: cast_nullable_to_non_nullable
as int?,suggestedArtist: freezed == suggestedArtist ? _self.suggestedArtist : suggestedArtist // ignore: cast_nullable_to_non_nullable
as String?,suggestedAlbum: freezed == suggestedAlbum ? _self.suggestedAlbum : suggestedAlbum // ignore: cast_nullable_to_non_nullable
as String?,suggestedFolder: freezed == suggestedFolder ? _self.suggestedFolder : suggestedFolder // ignore: cast_nullable_to_non_nullable
as String?,existingFolder: freezed == existingFolder ? _self.existingFolder : existingFolder // ignore: cast_nullable_to_non_nullable
as String?,listId: freezed == listId ? _self.listId : listId // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

// dart format on
