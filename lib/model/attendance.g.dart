// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'attendance.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CustomerAttendance _$CustomerAttendanceFromJson(Map<String, dynamic> json) =>
    CustomerAttendance(
      data: Data.fromJson(json['data'] as Map<String, dynamic>),
    )
      ..statusCode = json['statusCode'] as int?
      ..isError = json['isError'] as bool?
      ..message = json['message'] as String?;

Map<String, dynamic> _$CustomerAttendanceToJson(CustomerAttendance instance) =>
    <String, dynamic>{
      'statusCode': instance.statusCode,
      'isError': instance.isError,
      'message': instance.message,
      'data': instance.data,
    };

Data _$DataFromJson(Map<String, dynamic> json) => Data(
      attendanceList: (json['attendanceList'] as List<dynamic>?)
          ?.map((e) => Attendance.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$DataToJson(Data instance) => <String, dynamic>{
      'attendanceList': instance.attendanceList,
    };

Attendance _$AttendanceFromJson(Map<String, dynamic> json) => Attendance(
      dateBGColorHEX: json['dateBGColorHEX'] as String,
      duration: json['duration'] as String,
      id: json['id'] as int,
      inColorHEX: json['inColorHEX'] as String,
      inDate: json['inDate'] as String,
      inText: json['inText'] as String,
      outColorHEX: json['outColorHEX'] as String,
      outText: json['outText'] as String,
      rowIndex: json['rowIndex'] as int,
    );

Map<String, dynamic> _$AttendanceToJson(Attendance instance) =>
    <String, dynamic>{
      'rowIndex': instance.rowIndex,
      'id': instance.id,
      'inText': instance.inText,
      'outText': instance.outText,
      'inDate': instance.inDate,
      'duration': instance.duration,
      'dateBGColorHEX': instance.dateBGColorHEX,
      'inColorHEX': instance.inColorHEX,
      'outColorHEX': instance.outColorHEX,
    };
