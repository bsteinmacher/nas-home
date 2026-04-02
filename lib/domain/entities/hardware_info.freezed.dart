// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'hardware_info.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$HardwareInfo {

 String get hostname; double get cpuUsage; double get ramUsed; double get ramTotal; String get uptime; double get temperature; double get downloadSpeed; double get uploadSpeed; double get ssdUsed; double get ssdTotal; double get hddUsed; double get hddTotal;
/// Create a copy of HardwareInfo
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$HardwareInfoCopyWith<HardwareInfo> get copyWith => _$HardwareInfoCopyWithImpl<HardwareInfo>(this as HardwareInfo, _$identity);

  /// Serializes this HardwareInfo to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is HardwareInfo&&(identical(other.hostname, hostname) || other.hostname == hostname)&&(identical(other.cpuUsage, cpuUsage) || other.cpuUsage == cpuUsage)&&(identical(other.ramUsed, ramUsed) || other.ramUsed == ramUsed)&&(identical(other.ramTotal, ramTotal) || other.ramTotal == ramTotal)&&(identical(other.uptime, uptime) || other.uptime == uptime)&&(identical(other.temperature, temperature) || other.temperature == temperature)&&(identical(other.downloadSpeed, downloadSpeed) || other.downloadSpeed == downloadSpeed)&&(identical(other.uploadSpeed, uploadSpeed) || other.uploadSpeed == uploadSpeed)&&(identical(other.ssdUsed, ssdUsed) || other.ssdUsed == ssdUsed)&&(identical(other.ssdTotal, ssdTotal) || other.ssdTotal == ssdTotal)&&(identical(other.hddUsed, hddUsed) || other.hddUsed == hddUsed)&&(identical(other.hddTotal, hddTotal) || other.hddTotal == hddTotal));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,hostname,cpuUsage,ramUsed,ramTotal,uptime,temperature,downloadSpeed,uploadSpeed,ssdUsed,ssdTotal,hddUsed,hddTotal);

@override
String toString() {
  return 'HardwareInfo(hostname: $hostname, cpuUsage: $cpuUsage, ramUsed: $ramUsed, ramTotal: $ramTotal, uptime: $uptime, temperature: $temperature, downloadSpeed: $downloadSpeed, uploadSpeed: $uploadSpeed, ssdUsed: $ssdUsed, ssdTotal: $ssdTotal, hddUsed: $hddUsed, hddTotal: $hddTotal)';
}


}

/// @nodoc
abstract mixin class $HardwareInfoCopyWith<$Res>  {
  factory $HardwareInfoCopyWith(HardwareInfo value, $Res Function(HardwareInfo) _then) = _$HardwareInfoCopyWithImpl;
@useResult
$Res call({
 String hostname, double cpuUsage, double ramUsed, double ramTotal, String uptime, double temperature, double downloadSpeed, double uploadSpeed, double ssdUsed, double ssdTotal, double hddUsed, double hddTotal
});




}
/// @nodoc
class _$HardwareInfoCopyWithImpl<$Res>
    implements $HardwareInfoCopyWith<$Res> {
  _$HardwareInfoCopyWithImpl(this._self, this._then);

  final HardwareInfo _self;
  final $Res Function(HardwareInfo) _then;

/// Create a copy of HardwareInfo
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? hostname = null,Object? cpuUsage = null,Object? ramUsed = null,Object? ramTotal = null,Object? uptime = null,Object? temperature = null,Object? downloadSpeed = null,Object? uploadSpeed = null,Object? ssdUsed = null,Object? ssdTotal = null,Object? hddUsed = null,Object? hddTotal = null,}) {
  return _then(_self.copyWith(
hostname: null == hostname ? _self.hostname : hostname // ignore: cast_nullable_to_non_nullable
as String,cpuUsage: null == cpuUsage ? _self.cpuUsage : cpuUsage // ignore: cast_nullable_to_non_nullable
as double,ramUsed: null == ramUsed ? _self.ramUsed : ramUsed // ignore: cast_nullable_to_non_nullable
as double,ramTotal: null == ramTotal ? _self.ramTotal : ramTotal // ignore: cast_nullable_to_non_nullable
as double,uptime: null == uptime ? _self.uptime : uptime // ignore: cast_nullable_to_non_nullable
as String,temperature: null == temperature ? _self.temperature : temperature // ignore: cast_nullable_to_non_nullable
as double,downloadSpeed: null == downloadSpeed ? _self.downloadSpeed : downloadSpeed // ignore: cast_nullable_to_non_nullable
as double,uploadSpeed: null == uploadSpeed ? _self.uploadSpeed : uploadSpeed // ignore: cast_nullable_to_non_nullable
as double,ssdUsed: null == ssdUsed ? _self.ssdUsed : ssdUsed // ignore: cast_nullable_to_non_nullable
as double,ssdTotal: null == ssdTotal ? _self.ssdTotal : ssdTotal // ignore: cast_nullable_to_non_nullable
as double,hddUsed: null == hddUsed ? _self.hddUsed : hddUsed // ignore: cast_nullable_to_non_nullable
as double,hddTotal: null == hddTotal ? _self.hddTotal : hddTotal // ignore: cast_nullable_to_non_nullable
as double,
  ));
}

}


/// Adds pattern-matching-related methods to [HardwareInfo].
extension HardwareInfoPatterns on HardwareInfo {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _HardwareInfo value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _HardwareInfo() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _HardwareInfo value)  $default,){
final _that = this;
switch (_that) {
case _HardwareInfo():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _HardwareInfo value)?  $default,){
final _that = this;
switch (_that) {
case _HardwareInfo() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String hostname,  double cpuUsage,  double ramUsed,  double ramTotal,  String uptime,  double temperature,  double downloadSpeed,  double uploadSpeed,  double ssdUsed,  double ssdTotal,  double hddUsed,  double hddTotal)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _HardwareInfo() when $default != null:
return $default(_that.hostname,_that.cpuUsage,_that.ramUsed,_that.ramTotal,_that.uptime,_that.temperature,_that.downloadSpeed,_that.uploadSpeed,_that.ssdUsed,_that.ssdTotal,_that.hddUsed,_that.hddTotal);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String hostname,  double cpuUsage,  double ramUsed,  double ramTotal,  String uptime,  double temperature,  double downloadSpeed,  double uploadSpeed,  double ssdUsed,  double ssdTotal,  double hddUsed,  double hddTotal)  $default,) {final _that = this;
switch (_that) {
case _HardwareInfo():
return $default(_that.hostname,_that.cpuUsage,_that.ramUsed,_that.ramTotal,_that.uptime,_that.temperature,_that.downloadSpeed,_that.uploadSpeed,_that.ssdUsed,_that.ssdTotal,_that.hddUsed,_that.hddTotal);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String hostname,  double cpuUsage,  double ramUsed,  double ramTotal,  String uptime,  double temperature,  double downloadSpeed,  double uploadSpeed,  double ssdUsed,  double ssdTotal,  double hddUsed,  double hddTotal)?  $default,) {final _that = this;
switch (_that) {
case _HardwareInfo() when $default != null:
return $default(_that.hostname,_that.cpuUsage,_that.ramUsed,_that.ramTotal,_that.uptime,_that.temperature,_that.downloadSpeed,_that.uploadSpeed,_that.ssdUsed,_that.ssdTotal,_that.hddUsed,_that.hddTotal);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _HardwareInfo implements HardwareInfo {
  const _HardwareInfo({required this.hostname, required this.cpuUsage, required this.ramUsed, required this.ramTotal, required this.uptime, required this.temperature, required this.downloadSpeed, required this.uploadSpeed, required this.ssdUsed, required this.ssdTotal, required this.hddUsed, required this.hddTotal});
  factory _HardwareInfo.fromJson(Map<String, dynamic> json) => _$HardwareInfoFromJson(json);

@override final  String hostname;
@override final  double cpuUsage;
@override final  double ramUsed;
@override final  double ramTotal;
@override final  String uptime;
@override final  double temperature;
@override final  double downloadSpeed;
@override final  double uploadSpeed;
@override final  double ssdUsed;
@override final  double ssdTotal;
@override final  double hddUsed;
@override final  double hddTotal;

/// Create a copy of HardwareInfo
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$HardwareInfoCopyWith<_HardwareInfo> get copyWith => __$HardwareInfoCopyWithImpl<_HardwareInfo>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$HardwareInfoToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _HardwareInfo&&(identical(other.hostname, hostname) || other.hostname == hostname)&&(identical(other.cpuUsage, cpuUsage) || other.cpuUsage == cpuUsage)&&(identical(other.ramUsed, ramUsed) || other.ramUsed == ramUsed)&&(identical(other.ramTotal, ramTotal) || other.ramTotal == ramTotal)&&(identical(other.uptime, uptime) || other.uptime == uptime)&&(identical(other.temperature, temperature) || other.temperature == temperature)&&(identical(other.downloadSpeed, downloadSpeed) || other.downloadSpeed == downloadSpeed)&&(identical(other.uploadSpeed, uploadSpeed) || other.uploadSpeed == uploadSpeed)&&(identical(other.ssdUsed, ssdUsed) || other.ssdUsed == ssdUsed)&&(identical(other.ssdTotal, ssdTotal) || other.ssdTotal == ssdTotal)&&(identical(other.hddUsed, hddUsed) || other.hddUsed == hddUsed)&&(identical(other.hddTotal, hddTotal) || other.hddTotal == hddTotal));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,hostname,cpuUsage,ramUsed,ramTotal,uptime,temperature,downloadSpeed,uploadSpeed,ssdUsed,ssdTotal,hddUsed,hddTotal);

@override
String toString() {
  return 'HardwareInfo(hostname: $hostname, cpuUsage: $cpuUsage, ramUsed: $ramUsed, ramTotal: $ramTotal, uptime: $uptime, temperature: $temperature, downloadSpeed: $downloadSpeed, uploadSpeed: $uploadSpeed, ssdUsed: $ssdUsed, ssdTotal: $ssdTotal, hddUsed: $hddUsed, hddTotal: $hddTotal)';
}


}

/// @nodoc
abstract mixin class _$HardwareInfoCopyWith<$Res> implements $HardwareInfoCopyWith<$Res> {
  factory _$HardwareInfoCopyWith(_HardwareInfo value, $Res Function(_HardwareInfo) _then) = __$HardwareInfoCopyWithImpl;
@override @useResult
$Res call({
 String hostname, double cpuUsage, double ramUsed, double ramTotal, String uptime, double temperature, double downloadSpeed, double uploadSpeed, double ssdUsed, double ssdTotal, double hddUsed, double hddTotal
});




}
/// @nodoc
class __$HardwareInfoCopyWithImpl<$Res>
    implements _$HardwareInfoCopyWith<$Res> {
  __$HardwareInfoCopyWithImpl(this._self, this._then);

  final _HardwareInfo _self;
  final $Res Function(_HardwareInfo) _then;

/// Create a copy of HardwareInfo
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? hostname = null,Object? cpuUsage = null,Object? ramUsed = null,Object? ramTotal = null,Object? uptime = null,Object? temperature = null,Object? downloadSpeed = null,Object? uploadSpeed = null,Object? ssdUsed = null,Object? ssdTotal = null,Object? hddUsed = null,Object? hddTotal = null,}) {
  return _then(_HardwareInfo(
hostname: null == hostname ? _self.hostname : hostname // ignore: cast_nullable_to_non_nullable
as String,cpuUsage: null == cpuUsage ? _self.cpuUsage : cpuUsage // ignore: cast_nullable_to_non_nullable
as double,ramUsed: null == ramUsed ? _self.ramUsed : ramUsed // ignore: cast_nullable_to_non_nullable
as double,ramTotal: null == ramTotal ? _self.ramTotal : ramTotal // ignore: cast_nullable_to_non_nullable
as double,uptime: null == uptime ? _self.uptime : uptime // ignore: cast_nullable_to_non_nullable
as String,temperature: null == temperature ? _self.temperature : temperature // ignore: cast_nullable_to_non_nullable
as double,downloadSpeed: null == downloadSpeed ? _self.downloadSpeed : downloadSpeed // ignore: cast_nullable_to_non_nullable
as double,uploadSpeed: null == uploadSpeed ? _self.uploadSpeed : uploadSpeed // ignore: cast_nullable_to_non_nullable
as double,ssdUsed: null == ssdUsed ? _self.ssdUsed : ssdUsed // ignore: cast_nullable_to_non_nullable
as double,ssdTotal: null == ssdTotal ? _self.ssdTotal : ssdTotal // ignore: cast_nullable_to_non_nullable
as double,hddUsed: null == hddUsed ? _self.hddUsed : hddUsed // ignore: cast_nullable_to_non_nullable
as double,hddTotal: null == hddTotal ? _self.hddTotal : hddTotal // ignore: cast_nullable_to_non_nullable
as double,
  ));
}


}

// dart format on
