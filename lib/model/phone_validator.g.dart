// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'phone_validator.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PhoneValidator _$PhoneValidatorFromJson(Map<String, dynamic> json) =>
    PhoneValidator(
      statusCode: json['statusCode'] as int?,
      isError: json['isError'] as bool?,
      message: json['message'] as String?,
      data: json['data'] as Map<String, dynamic>?,
    );

Map<String, dynamic> _$PhoneValidatorToJson(PhoneValidator instance) =>
    <String, dynamic>{
      'statusCode': instance.statusCode,
      'isError': instance.isError,
      'message': instance.message,
      'data': instance.data,
    };
