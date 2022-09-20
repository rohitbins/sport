import 'package:json_annotation/json_annotation.dart';
part 'dashboard.g.dart';

@JsonSerializable()
class Dashboard{
  Dashboard({
    this.statusCode,
    this.isError,
    this.message,
    this.data,
    this.mode
  });

  int? statusCode;
  bool? isError;
  String? message;
  DashboardData? data;
  String? mode;

  factory Dashboard.fromJson(Map<String, dynamic> json) =>
      _$DashboardFromJson(json);
  Map<String, dynamic> toJson() => _$DashboardToJson(this);

}

@JsonSerializable()
class DashboardData {
  DashboardData({
    this.showFee,
    this.takePNPAttendance,
    this.takeMemberAttendance,
    this.isChanged,
    this.canLogin,
    this.currentMemberPlay,
    this.currentStudentplay,
    this.currentPPRPlay,
    this.todayMemberPlay,
    this.todayStudentPlay,
    this.todayPPRPlay,
    this.memberFeeCount,
    this.memberFeeAmount,
    this.studentFeeCount,
    this.studentFeeAmount,
    required this.feeData,
    required this.attendanceData
  });

  bool? showFee;
  bool? takePNPAttendance;
  bool? takeMemberAttendance;
  bool? isChanged;
  bool? canLogin;
  int? currentMemberPlay;
  int? currentStudentplay;
  int? currentPPRPlay;
  int? todayMemberPlay;
  int? todayStudentPlay;
  int? todayPPRPlay;
  int? memberFeeCount;
  int? memberFeeAmount;
  int? studentFeeCount;
  int? studentFeeAmount;
  @JsonKey(name: 'FeeData')
  List<FeeData> feeData = [];
  @JsonKey(name: 'AttendanceData')
  List<AttendanceData> attendanceData = [];

  factory DashboardData.fromJson(Map<String, dynamic> json) =>
      _$DashboardDataFromJson(json);
  Map<String, dynamic> toJson() => _$DashboardDataToJson(this);
}

@JsonSerializable()
class AttendanceData {
  AttendanceData({
    this.customerType,
    this.playingCount,
    this.totalCount
  });

  String? customerType;
  int? playingCount;
  int? totalCount;

  factory AttendanceData.fromJson(Map<String, dynamic> json) =>
      _$AttendanceDataFromJson(json);
  Map<String, dynamic> toJson() => _$AttendanceDataToJson(this);
}

@JsonSerializable()
class FeeData {
  FeeData({
    this.customerType,
    this.feeAmount,
    this.feeCount
  });
  
  String? customerType;
  int? feeCount;
  int? feeAmount;

  factory FeeData.fromJson(Map<String, dynamic> json) =>
      _$FeeDataFromJson(json);
  Map<String, dynamic> toJson() => _$FeeDataToJson(this);
}