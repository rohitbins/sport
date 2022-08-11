// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'otp_validator.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

OtpValidator _$OtpValidatorFromJson(Map<String, dynamic> json) => OtpValidator(
      statusCode: json['statusCode'] as int,
      isError: json['isError'] as bool,
      message: json['message'] as String?,
      data: json['data'] == null
          ? null
          : OtpData.fromJson(json['data'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$OtpValidatorToJson(OtpValidator instance) =>
    <String, dynamic>{
      'statusCode': instance.statusCode,
      'isError': instance.isError,
      'message': instance.message,
      'data': instance.data,
    };

OtpData _$OtpDataFromJson(Map<String, dynamic> json) => OtpData(
      academyLogoURL: json['academyLogoURL'] as String?,
      customerKey: json['customerKey'] as String?,
      name: json['name'] as String?,
    );

Map<String, dynamic> _$OtpDataToJson(OtpData instance) => <String, dynamic>{
      'name': instance.name,
      'customerKey': instance.customerKey,
      'academyLogoURL': instance.academyLogoURL,
    };