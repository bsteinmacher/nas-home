// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'nas_status_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$NasStatusEvent {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is NasStatusEvent);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'NasStatusEvent()';
}


}

/// @nodoc
class $NasStatusEventCopyWith<$Res>  {
$NasStatusEventCopyWith(NasStatusEvent _, $Res Function(NasStatusEvent) __);
}


/// Adds pattern-matching-related methods to [NasStatusEvent].
extension NasStatusEventPatterns on NasStatusEvent {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( RefreshRequested value)?  refreshRequested,TResult Function( CheckUpdatesRequested value)?  checkUpdatesRequested,TResult Function( CheckServiceUpdateRequested value)?  checkServiceUpdateRequested,TResult Function( UpdateServiceRequested value)?  updateServiceRequested,required TResult orElse(),}){
final _that = this;
switch (_that) {
case RefreshRequested() when refreshRequested != null:
return refreshRequested(_that);case CheckUpdatesRequested() when checkUpdatesRequested != null:
return checkUpdatesRequested(_that);case CheckServiceUpdateRequested() when checkServiceUpdateRequested != null:
return checkServiceUpdateRequested(_that);case UpdateServiceRequested() when updateServiceRequested != null:
return updateServiceRequested(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( RefreshRequested value)  refreshRequested,required TResult Function( CheckUpdatesRequested value)  checkUpdatesRequested,required TResult Function( CheckServiceUpdateRequested value)  checkServiceUpdateRequested,required TResult Function( UpdateServiceRequested value)  updateServiceRequested,}){
final _that = this;
switch (_that) {
case RefreshRequested():
return refreshRequested(_that);case CheckUpdatesRequested():
return checkUpdatesRequested(_that);case CheckServiceUpdateRequested():
return checkServiceUpdateRequested(_that);case UpdateServiceRequested():
return updateServiceRequested(_that);case _:
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( RefreshRequested value)?  refreshRequested,TResult? Function( CheckUpdatesRequested value)?  checkUpdatesRequested,TResult? Function( CheckServiceUpdateRequested value)?  checkServiceUpdateRequested,TResult? Function( UpdateServiceRequested value)?  updateServiceRequested,}){
final _that = this;
switch (_that) {
case RefreshRequested() when refreshRequested != null:
return refreshRequested(_that);case CheckUpdatesRequested() when checkUpdatesRequested != null:
return checkUpdatesRequested(_that);case CheckServiceUpdateRequested() when checkServiceUpdateRequested != null:
return checkServiceUpdateRequested(_that);case UpdateServiceRequested() when updateServiceRequested != null:
return updateServiceRequested(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function()?  refreshRequested,TResult Function()?  checkUpdatesRequested,TResult Function( String serviceName)?  checkServiceUpdateRequested,TResult Function( String serviceName)?  updateServiceRequested,required TResult orElse(),}) {final _that = this;
switch (_that) {
case RefreshRequested() when refreshRequested != null:
return refreshRequested();case CheckUpdatesRequested() when checkUpdatesRequested != null:
return checkUpdatesRequested();case CheckServiceUpdateRequested() when checkServiceUpdateRequested != null:
return checkServiceUpdateRequested(_that.serviceName);case UpdateServiceRequested() when updateServiceRequested != null:
return updateServiceRequested(_that.serviceName);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function()  refreshRequested,required TResult Function()  checkUpdatesRequested,required TResult Function( String serviceName)  checkServiceUpdateRequested,required TResult Function( String serviceName)  updateServiceRequested,}) {final _that = this;
switch (_that) {
case RefreshRequested():
return refreshRequested();case CheckUpdatesRequested():
return checkUpdatesRequested();case CheckServiceUpdateRequested():
return checkServiceUpdateRequested(_that.serviceName);case UpdateServiceRequested():
return updateServiceRequested(_that.serviceName);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function()?  refreshRequested,TResult? Function()?  checkUpdatesRequested,TResult? Function( String serviceName)?  checkServiceUpdateRequested,TResult? Function( String serviceName)?  updateServiceRequested,}) {final _that = this;
switch (_that) {
case RefreshRequested() when refreshRequested != null:
return refreshRequested();case CheckUpdatesRequested() when checkUpdatesRequested != null:
return checkUpdatesRequested();case CheckServiceUpdateRequested() when checkServiceUpdateRequested != null:
return checkServiceUpdateRequested(_that.serviceName);case UpdateServiceRequested() when updateServiceRequested != null:
return updateServiceRequested(_that.serviceName);case _:
  return null;

}
}

}

/// @nodoc


class RefreshRequested implements NasStatusEvent {
  const RefreshRequested();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is RefreshRequested);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'NasStatusEvent.refreshRequested()';
}


}




/// @nodoc


class CheckUpdatesRequested implements NasStatusEvent {
  const CheckUpdatesRequested();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is CheckUpdatesRequested);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'NasStatusEvent.checkUpdatesRequested()';
}


}




/// @nodoc


class CheckServiceUpdateRequested implements NasStatusEvent {
  const CheckServiceUpdateRequested(this.serviceName);
  

 final  String serviceName;

/// Create a copy of NasStatusEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$CheckServiceUpdateRequestedCopyWith<CheckServiceUpdateRequested> get copyWith => _$CheckServiceUpdateRequestedCopyWithImpl<CheckServiceUpdateRequested>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is CheckServiceUpdateRequested&&(identical(other.serviceName, serviceName) || other.serviceName == serviceName));
}


@override
int get hashCode => Object.hash(runtimeType,serviceName);

@override
String toString() {
  return 'NasStatusEvent.checkServiceUpdateRequested(serviceName: $serviceName)';
}


}

/// @nodoc
abstract mixin class $CheckServiceUpdateRequestedCopyWith<$Res> implements $NasStatusEventCopyWith<$Res> {
  factory $CheckServiceUpdateRequestedCopyWith(CheckServiceUpdateRequested value, $Res Function(CheckServiceUpdateRequested) _then) = _$CheckServiceUpdateRequestedCopyWithImpl;
@useResult
$Res call({
 String serviceName
});




}
/// @nodoc
class _$CheckServiceUpdateRequestedCopyWithImpl<$Res>
    implements $CheckServiceUpdateRequestedCopyWith<$Res> {
  _$CheckServiceUpdateRequestedCopyWithImpl(this._self, this._then);

  final CheckServiceUpdateRequested _self;
  final $Res Function(CheckServiceUpdateRequested) _then;

/// Create a copy of NasStatusEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? serviceName = null,}) {
  return _then(CheckServiceUpdateRequested(
null == serviceName ? _self.serviceName : serviceName // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

/// @nodoc


class UpdateServiceRequested implements NasStatusEvent {
  const UpdateServiceRequested(this.serviceName);
  

 final  String serviceName;

/// Create a copy of NasStatusEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$UpdateServiceRequestedCopyWith<UpdateServiceRequested> get copyWith => _$UpdateServiceRequestedCopyWithImpl<UpdateServiceRequested>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is UpdateServiceRequested&&(identical(other.serviceName, serviceName) || other.serviceName == serviceName));
}


@override
int get hashCode => Object.hash(runtimeType,serviceName);

@override
String toString() {
  return 'NasStatusEvent.updateServiceRequested(serviceName: $serviceName)';
}


}

/// @nodoc
abstract mixin class $UpdateServiceRequestedCopyWith<$Res> implements $NasStatusEventCopyWith<$Res> {
  factory $UpdateServiceRequestedCopyWith(UpdateServiceRequested value, $Res Function(UpdateServiceRequested) _then) = _$UpdateServiceRequestedCopyWithImpl;
@useResult
$Res call({
 String serviceName
});




}
/// @nodoc
class _$UpdateServiceRequestedCopyWithImpl<$Res>
    implements $UpdateServiceRequestedCopyWith<$Res> {
  _$UpdateServiceRequestedCopyWithImpl(this._self, this._then);

  final UpdateServiceRequested _self;
  final $Res Function(UpdateServiceRequested) _then;

/// Create a copy of NasStatusEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? serviceName = null,}) {
  return _then(UpdateServiceRequested(
null == serviceName ? _self.serviceName : serviceName // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

/// @nodoc
mixin _$NasStatusState {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is NasStatusState);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'NasStatusState()';
}


}

/// @nodoc
class $NasStatusStateCopyWith<$Res>  {
$NasStatusStateCopyWith(NasStatusState _, $Res Function(NasStatusState) __);
}


/// Adds pattern-matching-related methods to [NasStatusState].
extension NasStatusStatePatterns on NasStatusState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( Initial value)?  initial,TResult Function( Loading value)?  loading,TResult Function( Loaded value)?  loaded,TResult Function( Updating value)?  updating,TResult Function( CheckingUpdate value)?  checkingUpdate,TResult Function( Error value)?  error,required TResult orElse(),}){
final _that = this;
switch (_that) {
case Initial() when initial != null:
return initial(_that);case Loading() when loading != null:
return loading(_that);case Loaded() when loaded != null:
return loaded(_that);case Updating() when updating != null:
return updating(_that);case CheckingUpdate() when checkingUpdate != null:
return checkingUpdate(_that);case Error() when error != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( Initial value)  initial,required TResult Function( Loading value)  loading,required TResult Function( Loaded value)  loaded,required TResult Function( Updating value)  updating,required TResult Function( CheckingUpdate value)  checkingUpdate,required TResult Function( Error value)  error,}){
final _that = this;
switch (_that) {
case Initial():
return initial(_that);case Loading():
return loading(_that);case Loaded():
return loaded(_that);case Updating():
return updating(_that);case CheckingUpdate():
return checkingUpdate(_that);case Error():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( Initial value)?  initial,TResult? Function( Loading value)?  loading,TResult? Function( Loaded value)?  loaded,TResult? Function( Updating value)?  updating,TResult? Function( CheckingUpdate value)?  checkingUpdate,TResult? Function( Error value)?  error,}){
final _that = this;
switch (_that) {
case Initial() when initial != null:
return initial(_that);case Loading() when loading != null:
return loading(_that);case Loaded() when loaded != null:
return loaded(_that);case Updating() when updating != null:
return updating(_that);case CheckingUpdate() when checkingUpdate != null:
return checkingUpdate(_that);case Error() when error != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function()?  initial,TResult Function()?  loading,TResult Function( List<NasService> services,  HardwareInfo hardwareInfo)?  loaded,TResult Function( String serviceName,  List<NasService> services,  HardwareInfo hardwareInfo)?  updating,TResult Function( String serviceName,  List<NasService> services,  HardwareInfo hardwareInfo)?  checkingUpdate,TResult Function( String message)?  error,required TResult orElse(),}) {final _that = this;
switch (_that) {
case Initial() when initial != null:
return initial();case Loading() when loading != null:
return loading();case Loaded() when loaded != null:
return loaded(_that.services,_that.hardwareInfo);case Updating() when updating != null:
return updating(_that.serviceName,_that.services,_that.hardwareInfo);case CheckingUpdate() when checkingUpdate != null:
return checkingUpdate(_that.serviceName,_that.services,_that.hardwareInfo);case Error() when error != null:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function()  initial,required TResult Function()  loading,required TResult Function( List<NasService> services,  HardwareInfo hardwareInfo)  loaded,required TResult Function( String serviceName,  List<NasService> services,  HardwareInfo hardwareInfo)  updating,required TResult Function( String serviceName,  List<NasService> services,  HardwareInfo hardwareInfo)  checkingUpdate,required TResult Function( String message)  error,}) {final _that = this;
switch (_that) {
case Initial():
return initial();case Loading():
return loading();case Loaded():
return loaded(_that.services,_that.hardwareInfo);case Updating():
return updating(_that.serviceName,_that.services,_that.hardwareInfo);case CheckingUpdate():
return checkingUpdate(_that.serviceName,_that.services,_that.hardwareInfo);case Error():
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function()?  initial,TResult? Function()?  loading,TResult? Function( List<NasService> services,  HardwareInfo hardwareInfo)?  loaded,TResult? Function( String serviceName,  List<NasService> services,  HardwareInfo hardwareInfo)?  updating,TResult? Function( String serviceName,  List<NasService> services,  HardwareInfo hardwareInfo)?  checkingUpdate,TResult? Function( String message)?  error,}) {final _that = this;
switch (_that) {
case Initial() when initial != null:
return initial();case Loading() when loading != null:
return loading();case Loaded() when loaded != null:
return loaded(_that.services,_that.hardwareInfo);case Updating() when updating != null:
return updating(_that.serviceName,_that.services,_that.hardwareInfo);case CheckingUpdate() when checkingUpdate != null:
return checkingUpdate(_that.serviceName,_that.services,_that.hardwareInfo);case Error() when error != null:
return error(_that.message);case _:
  return null;

}
}

}

/// @nodoc


class Initial implements NasStatusState {
  const Initial();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Initial);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'NasStatusState.initial()';
}


}




/// @nodoc


class Loading implements NasStatusState {
  const Loading();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Loading);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'NasStatusState.loading()';
}


}




/// @nodoc


class Loaded implements NasStatusState {
  const Loaded(final  List<NasService> services, this.hardwareInfo): _services = services;
  

 final  List<NasService> _services;
 List<NasService> get services {
  if (_services is EqualUnmodifiableListView) return _services;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_services);
}

 final  HardwareInfo hardwareInfo;

/// Create a copy of NasStatusState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$LoadedCopyWith<Loaded> get copyWith => _$LoadedCopyWithImpl<Loaded>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Loaded&&const DeepCollectionEquality().equals(other._services, _services)&&(identical(other.hardwareInfo, hardwareInfo) || other.hardwareInfo == hardwareInfo));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(_services),hardwareInfo);

@override
String toString() {
  return 'NasStatusState.loaded(services: $services, hardwareInfo: $hardwareInfo)';
}


}

/// @nodoc
abstract mixin class $LoadedCopyWith<$Res> implements $NasStatusStateCopyWith<$Res> {
  factory $LoadedCopyWith(Loaded value, $Res Function(Loaded) _then) = _$LoadedCopyWithImpl;
@useResult
$Res call({
 List<NasService> services, HardwareInfo hardwareInfo
});


$HardwareInfoCopyWith<$Res> get hardwareInfo;

}
/// @nodoc
class _$LoadedCopyWithImpl<$Res>
    implements $LoadedCopyWith<$Res> {
  _$LoadedCopyWithImpl(this._self, this._then);

  final Loaded _self;
  final $Res Function(Loaded) _then;

/// Create a copy of NasStatusState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? services = null,Object? hardwareInfo = null,}) {
  return _then(Loaded(
null == services ? _self._services : services // ignore: cast_nullable_to_non_nullable
as List<NasService>,null == hardwareInfo ? _self.hardwareInfo : hardwareInfo // ignore: cast_nullable_to_non_nullable
as HardwareInfo,
  ));
}

/// Create a copy of NasStatusState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$HardwareInfoCopyWith<$Res> get hardwareInfo {
  
  return $HardwareInfoCopyWith<$Res>(_self.hardwareInfo, (value) {
    return _then(_self.copyWith(hardwareInfo: value));
  });
}
}

/// @nodoc


class Updating implements NasStatusState {
  const Updating(this.serviceName, final  List<NasService> services, this.hardwareInfo): _services = services;
  

 final  String serviceName;
 final  List<NasService> _services;
 List<NasService> get services {
  if (_services is EqualUnmodifiableListView) return _services;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_services);
}

 final  HardwareInfo hardwareInfo;

/// Create a copy of NasStatusState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$UpdatingCopyWith<Updating> get copyWith => _$UpdatingCopyWithImpl<Updating>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Updating&&(identical(other.serviceName, serviceName) || other.serviceName == serviceName)&&const DeepCollectionEquality().equals(other._services, _services)&&(identical(other.hardwareInfo, hardwareInfo) || other.hardwareInfo == hardwareInfo));
}


@override
int get hashCode => Object.hash(runtimeType,serviceName,const DeepCollectionEquality().hash(_services),hardwareInfo);

@override
String toString() {
  return 'NasStatusState.updating(serviceName: $serviceName, services: $services, hardwareInfo: $hardwareInfo)';
}


}

/// @nodoc
abstract mixin class $UpdatingCopyWith<$Res> implements $NasStatusStateCopyWith<$Res> {
  factory $UpdatingCopyWith(Updating value, $Res Function(Updating) _then) = _$UpdatingCopyWithImpl;
@useResult
$Res call({
 String serviceName, List<NasService> services, HardwareInfo hardwareInfo
});


$HardwareInfoCopyWith<$Res> get hardwareInfo;

}
/// @nodoc
class _$UpdatingCopyWithImpl<$Res>
    implements $UpdatingCopyWith<$Res> {
  _$UpdatingCopyWithImpl(this._self, this._then);

  final Updating _self;
  final $Res Function(Updating) _then;

/// Create a copy of NasStatusState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? serviceName = null,Object? services = null,Object? hardwareInfo = null,}) {
  return _then(Updating(
null == serviceName ? _self.serviceName : serviceName // ignore: cast_nullable_to_non_nullable
as String,null == services ? _self._services : services // ignore: cast_nullable_to_non_nullable
as List<NasService>,null == hardwareInfo ? _self.hardwareInfo : hardwareInfo // ignore: cast_nullable_to_non_nullable
as HardwareInfo,
  ));
}

/// Create a copy of NasStatusState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$HardwareInfoCopyWith<$Res> get hardwareInfo {
  
  return $HardwareInfoCopyWith<$Res>(_self.hardwareInfo, (value) {
    return _then(_self.copyWith(hardwareInfo: value));
  });
}
}

/// @nodoc


class CheckingUpdate implements NasStatusState {
  const CheckingUpdate(this.serviceName, final  List<NasService> services, this.hardwareInfo): _services = services;
  

 final  String serviceName;
 final  List<NasService> _services;
 List<NasService> get services {
  if (_services is EqualUnmodifiableListView) return _services;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_services);
}

 final  HardwareInfo hardwareInfo;

/// Create a copy of NasStatusState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$CheckingUpdateCopyWith<CheckingUpdate> get copyWith => _$CheckingUpdateCopyWithImpl<CheckingUpdate>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is CheckingUpdate&&(identical(other.serviceName, serviceName) || other.serviceName == serviceName)&&const DeepCollectionEquality().equals(other._services, _services)&&(identical(other.hardwareInfo, hardwareInfo) || other.hardwareInfo == hardwareInfo));
}


@override
int get hashCode => Object.hash(runtimeType,serviceName,const DeepCollectionEquality().hash(_services),hardwareInfo);

@override
String toString() {
  return 'NasStatusState.checkingUpdate(serviceName: $serviceName, services: $services, hardwareInfo: $hardwareInfo)';
}


}

/// @nodoc
abstract mixin class $CheckingUpdateCopyWith<$Res> implements $NasStatusStateCopyWith<$Res> {
  factory $CheckingUpdateCopyWith(CheckingUpdate value, $Res Function(CheckingUpdate) _then) = _$CheckingUpdateCopyWithImpl;
@useResult
$Res call({
 String serviceName, List<NasService> services, HardwareInfo hardwareInfo
});


$HardwareInfoCopyWith<$Res> get hardwareInfo;

}
/// @nodoc
class _$CheckingUpdateCopyWithImpl<$Res>
    implements $CheckingUpdateCopyWith<$Res> {
  _$CheckingUpdateCopyWithImpl(this._self, this._then);

  final CheckingUpdate _self;
  final $Res Function(CheckingUpdate) _then;

/// Create a copy of NasStatusState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? serviceName = null,Object? services = null,Object? hardwareInfo = null,}) {
  return _then(CheckingUpdate(
null == serviceName ? _self.serviceName : serviceName // ignore: cast_nullable_to_non_nullable
as String,null == services ? _self._services : services // ignore: cast_nullable_to_non_nullable
as List<NasService>,null == hardwareInfo ? _self.hardwareInfo : hardwareInfo // ignore: cast_nullable_to_non_nullable
as HardwareInfo,
  ));
}

/// Create a copy of NasStatusState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$HardwareInfoCopyWith<$Res> get hardwareInfo {
  
  return $HardwareInfoCopyWith<$Res>(_self.hardwareInfo, (value) {
    return _then(_self.copyWith(hardwareInfo: value));
  });
}
}

/// @nodoc


class Error implements NasStatusState {
  const Error(this.message);
  

 final  String message;

/// Create a copy of NasStatusState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ErrorCopyWith<Error> get copyWith => _$ErrorCopyWithImpl<Error>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Error&&(identical(other.message, message) || other.message == message));
}


@override
int get hashCode => Object.hash(runtimeType,message);

@override
String toString() {
  return 'NasStatusState.error(message: $message)';
}


}

/// @nodoc
abstract mixin class $ErrorCopyWith<$Res> implements $NasStatusStateCopyWith<$Res> {
  factory $ErrorCopyWith(Error value, $Res Function(Error) _then) = _$ErrorCopyWithImpl;
@useResult
$Res call({
 String message
});




}
/// @nodoc
class _$ErrorCopyWithImpl<$Res>
    implements $ErrorCopyWith<$Res> {
  _$ErrorCopyWithImpl(this._self, this._then);

  final Error _self;
  final $Res Function(Error) _then;

/// Create a copy of NasStatusState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? message = null,}) {
  return _then(Error(
null == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
