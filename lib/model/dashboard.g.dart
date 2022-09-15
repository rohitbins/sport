// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'dashboard.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Dashboard _$DashboardFromJson(Map<String, dynamic> json) => Dashboard(
      statusCode: json['statusCode'] as int?,
      isError: json['isError'] as bool?,
      message: json['message'] as String?,
      data: json['data'] == null
          ? null
          : DashboardData.fromJson(json['data'] as Map<String, dynamic>),
      mode: json['mode'] as String?,
    );

Map<String, dynamic> _$DashboardToJson(Dashboard instance) => <String, dynamic>{
      'statusCode': instance.statusCode,
      'isError': instance.isError,
      'message': instance.message,
      'data': instance.data,
      'mode': instance.mode,
    };

DashboardData _$DashboardDataFromJson(Map<String, dynamic> json) =>
    DashboardData(
      showFee: json['showFee'] as bool?,
      takePNPAttendance: json['takePNPAttendance'] as bool?,
      takeMemberAttendance: json['takeMemberAttendance'] as bool?,
      isChanged: json['isChanged'] as bool?,
      canLogin: json['canLogin'] as bool?,
      currentMemberPlay: json['currentMemberPlay'] as int?,
      currentStudentplay: json['currentStudentplay'] as int?,
      currentPPRPlay: json['currentPPRPlay'] as int?,
      todayMemberPlay: json['todayMemberPlay'] as int?,
      todayStudentPlay: json['todayStudentPlay'] as int?,
      todayPPRPlay: json['todayPPRPlay'] as int?,
      memberFeeCount: json['memberFeeCount'] as int?,
      memberFeeAmount: json['memberFeeAmount'] as int?,
      studentFeeCount: json['studentFeeCount'] as int?,
      studentFeeAmount: json['studentFeeAmount'] as int?,
      feeData: (json['FeeData'] as List<dynamic>)
          .map((e) => FeeData.fromJson(e as Map<String, dynamic>))
          .toList(),
      attendanceData: (json['AttendanceData'] as List<dynamic>)
          .map((e) => AttendanceData.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$DashboardDataToJson(DashboardData instance) =>
    <String, dynamic>{
      'showFee': instance.showFee,
      'takePNPAttendance': instance.takePNPAttendance,
      'takeMemberAttendance': instance.takeMemberAttendance,
      'isChanged': instance.isChanged,
      'canLogin': instance.canLogin,
      'currentMemberPlay': instance.currentMemberPlay,
      'currentStudentplay': instance.currentStudentplay,
      'currentPPRPlay': instance.currentPPRPlay,
      'todayMemberPlay': instance.todayMemberPlay,
      'todayStudentPlay': instance.todayStudentPlay,
      'todayPPRPlay': instance.todayPPRPlay,
      'memberFeeCount': instance.memberFeeCount,
      'memberFeeAmount': instance.memberFeeAmount,
      'studentFeeCount': instance.studentFeeCount,
      'studentFeeAmount': instance.studentFeeAmount,
      'FeeData': instance.feeData,
      'AttendanceData': instance.attendanceData,
    };

AttendanceData _$AttendanceDataFromJson(Map<String, dynamic> json) =>
    AttendanceData(
      customerType: json['customerType'] as String?,
      playingCount: json['playingCount'] as int?,
      totalCount: json['totalCount'] as int?,
    );

Map<String, dynamic> _$AttendanceDataToJson(AttendanceData instance) =>
    <String, dynamic>{
      'customerType': instance.customerType,
      'playingCount': instance.playingCount,
      'totalCount': instance.totalCount,
    };

FeeData _$FeeDataFromJson(Map<String, dynamic> json) => FeeData(
      customerType: json['customerType'] as String?,
      feeAmount: json['feeAmount'] as int?,
      feeCount: json['feeCount'] as int?,
    );

Map<String, dynamic> _$FeeDataToJson(FeeData instance) => <String, dynamic>{
      'customerType': instance.customerType,
      'feeCount': instance.feeCount,
      'feeAmount': instance.feeAmount,
    };
