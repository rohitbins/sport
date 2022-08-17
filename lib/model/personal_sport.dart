import 'package:json_annotation/json_annotation.dart';
import 'package:sport/model/common_response.dart';
part 'personal_sport.g.dart';

@JsonSerializable()
class PersonalSportInfo extends CommonResponse{
 PersonalSportInfo({this.data}) : super();

 InfoData? data;

 factory  PersonalSportInfo.fromJson(Map<String, dynamic> json) =>
      _$PersonalSportInfoFromJson(json);
  Map<String, dynamic> toJson() => _$PersonalSportInfoToJson(this);

}

@JsonSerializable()
class InfoData {
  InfoData({
   required this.personalInfo,
   required this.sportsInfo
  });

 PersonalInfo personalInfo;
 SportsInfo   sportsInfo;

factory  InfoData.fromJson(Map<String, dynamic> json) =>
      _$InfoDataFromJson(json);
  Map<String, dynamic> toJson() => _$InfoDataToJson(this);

}

@JsonSerializable()
class SportsInfo {
  SportsInfo({
    this.batch,
    this.category,
    this.dateOfJoining,
    this.discount,
    this.feeType,
    this.finalFee,
    this.speciality,
    this.sport,
    this.startTime,
    this.totalFee,
    this.type
});

   String? dateOfJoining;
   String? sport;
   String? type;
   String? category;
   String? batch;
   String? feeType;
   String? speciality;
   String? startTime;
   int? totalFee;
   int? discount;
   int? finalFee;

   factory  SportsInfo.fromJson(Map<String, dynamic> json) =>
      _$SportsInfoFromJson(json);
  Map<String, dynamic> toJson() => _$SportsInfoToJson(this);
}

@JsonSerializable()
class PersonalInfo{
  PersonalInfo({
    this.address,
    this.city,
    this.dateOfBirth,
    this.email,
    this.fatherName,
    this.gender,
    this.mobile,
    this.name,
    this.pincode,
    this.state
  });

  String? dateOfBirth;
  String? name;
  String? fatherName;
  String? email;
  String? mobile;
  String? gender;
  String? address;
  String? state;
  String? city;
  String? pincode;

  factory  PersonalInfo.fromJson(Map<String, dynamic> json) =>
      _$PersonalInfoFromJson(json);
  Map<String, dynamic> toJson() => _$PersonalInfoToJson(this);

}