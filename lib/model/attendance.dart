import 'package:json_annotation/json_annotation.dart';
import 'package:sport/model/common_response.dart';
part 'attendance.g.dart';


@JsonSerializable()
class CustomerAttendance extends CommonResponse {
  CustomerAttendance({
   required this.data
  });
  Data data;

  factory CustomerAttendance.fromJson(Map<String, dynamic> json) =>
      _$CustomerAttendanceFromJson(json);
  Map<String, dynamic> toJson() => _$CustomerAttendanceToJson(this);
} 



@JsonSerializable()
class Data{
  Data ({this.attendanceList});

  List<Attendance>? attendanceList;

  factory Data.fromJson(Map<String, dynamic> json) =>
      _$DataFromJson(json);
  Map<String, dynamic> toJson() => _$DataToJson(this);
}

@JsonSerializable()
class Attendance {
Attendance({
required this.dateBGColorHEX,
required this.duration,
required this.id,
required this.inColorHEX,
required this.inDate,
required this.inText,
required this.outColorHEX,
required this.outText,
required this.rowIndex

});


int rowIndex;
int id;
String inText;
String outText;
String inDate;
String duration;
String dateBGColorHEX;
String inColorHEX;
String outColorHEX;


factory Attendance.fromJson(Map<String, dynamic> json) =>
      _$AttendanceFromJson(json);
  Map<String, dynamic> toJson() => _$AttendanceToJson(this);
}