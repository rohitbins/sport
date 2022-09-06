// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'check_permisson.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CheckPermisson _$CheckPermissonFromJson(Map<String, dynamic> json) =>
    CheckPermisson(
      statusCode: json['statusCode'] as int?,
      isError: json['isError'] as bool?,
      message: json['message'] as String?,
      data: json['data'] == null
          ? null
          : PermissonData.fromJson(json['data'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$CheckPermissonToJson(CheckPermisson instance) =>
    <String, dynamic>{
      'statusCode': instance.statusCode,
      'isError': instance.isError,
      'message': instance.message,
      'data': instance.data,
    };

PermissonData _$PermissonDataFromJson(Map<String, dynamic> json) =>
    PermissonData(
      name: json['name'] as String?,
      staffKey: json['staffKey'] as String?,
      academyLogoURL: json['academyLogoURL'] as String?,
      showFee: json['showFee'] as bool?,
      takePNPAttendance: json['takePNPAttendance'] as bool?,
      takeMemberAttendance: json['takeMemberAttendance'] as bool?,
      isChanged: json['isChanged'] as bool?,
      canLogin: json['canLogin'] as bool?,
    );

Map<String, dynamic> _$PermissonDataToJson(PermissonData instance) =>
    <String, dynamic>{
      'name': instance.name,
      'staffKey': instance.staffKey,
      'academyLogoURL': instance.academyLogoURL,
      'showFee': instance.showFee,
      'takePNPAttendance': instance.takePNPAttendance,
      'takeMemberAttendance': instance.takeMemberAttendance,
      'isChanged': instance.isChanged,
      'canLogin': instance.canLogin,
    };
