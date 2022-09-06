import 'package:json_annotation/json_annotation.dart';
part 'check_permisson.g.dart';

@JsonSerializable()
class CheckPermisson{
  CheckPermisson({this.statusCode,
  this.isError,
  this.message,
  this.data,});

  int? statusCode;
  bool? isError;
  String? message;
  PermissonData? data;

 factory CheckPermisson.fromJson(Map<String, dynamic> json) =>
      _$CheckPermissonFromJson(json);

  Map<String, dynamic> toJson() => _$CheckPermissonToJson(this);
}

@JsonSerializable()
class PermissonData {
  PermissonData({
    this.name,
    this.staffKey,
    this.academyLogoURL,
    this.showFee,
    this.takePNPAttendance,
    this.takeMemberAttendance,
    this.isChanged,
    this.canLogin,
    
   });

  String? name;
  String? staffKey;
  String? academyLogoURL;
  bool? showFee;
  bool? takePNPAttendance;
  bool? takeMemberAttendance;
  bool? isChanged;
  bool? canLogin;

  factory PermissonData.fromJson(Map<String, dynamic> json) =>
      _$PermissonDataFromJson(json);

  Map<String, dynamic> toJson() => _$PermissonDataToJson(this);
}