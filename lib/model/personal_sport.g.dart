// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'personal_sport.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PersonalSportInfo _$PersonalSportInfoFromJson(Map<String, dynamic> json) =>
    PersonalSportInfo(
      data: json['data'] == null
          ? null
          : InfoData.fromJson(json['data'] as Map<String, dynamic>),
    )
      ..statusCode = json['statusCode'] as int?
      ..isError = json['isError'] as bool?
      ..message = json['message'] as String?;

Map<String, dynamic> _$PersonalSportInfoToJson(PersonalSportInfo instance) =>
    <String, dynamic>{
      'statusCode': instance.statusCode,
      'isError': instance.isError,
      'message': instance.message,
      'data': instance.data,
    };

InfoData _$InfoDataFromJson(Map<String, dynamic> json) => InfoData(
      personalInfo:
          PersonalInfo.fromJson(json['personalInfo'] as Map<String, dynamic>),
      sportsInfo:
          SportsInfo.fromJson(json['sportsInfo'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$InfoDataToJson(InfoData instance) => <String, dynamic>{
      'personalInfo': instance.personalInfo,
      'sportsInfo': instance.sportsInfo,
    };

SportsInfo _$SportsInfoFromJson(Map<String, dynamic> json) => SportsInfo(
      batch: json['batch'] as String?,
      category: json['category'] as String?,
      dateOfJoining: json['dateOfJoining'] as String?,
      discount: json['discount'] as int?,
      feeType: json['feeType'] as String?,
      finalFee: json['finalFee'] as int?,
      speciality: json['speciality'] as String?,
      sport: json['sport'] as String?,
      startTime: json['startTime'] as String?,
      totalFee: json['totalFee'] as int?,
      type: json['type'] as String?,
    );

Map<String, dynamic> _$SportsInfoToJson(SportsInfo instance) =>
    <String, dynamic>{
      'dateOfJoining': instance.dateOfJoining,
      'sport': instance.sport,
      'type': instance.type,
      'category': instance.category,
      'batch': instance.batch,
      'feeType': instance.feeType,
      'speciality': instance.speciality,
      'startTime': instance.startTime,
      'totalFee': instance.totalFee,
      'discount': instance.discount,
      'finalFee': instance.finalFee,
    };

PersonalInfo _$PersonalInfoFromJson(Map<String, dynamic> json) => PersonalInfo(
      address: json['address'] as String?,
      city: json['city'] as String?,
      dateOfBirth: json['dateOfBirth'] as String?,
      email: json['email'] as String?,
      fatherName: json['fatherName'] as String?,
      gender: json['gender'] as String?,
      mobile: json['mobile'] as String?,
      name: json['name'] as String?,
      pincode: json['pincode'] as String?,
      state: json['state'] as String?,
    );

Map<String, dynamic> _$PersonalInfoToJson(PersonalInfo instance) =>
    <String, dynamic>{
      'dateOfBirth': instance.dateOfBirth,
      'name': instance.name,
      'fatherName': instance.fatherName,
      'email': instance.email,
      'mobile': instance.mobile,
      'gender': instance.gender,
      'address': instance.address,
      'state': instance.state,
      'city': instance.city,
      'pincode': instance.pincode,
    };
