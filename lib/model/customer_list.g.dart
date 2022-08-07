// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'customer_list.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CustomerListData _$CustomerListDataFromJson(Map<String, dynamic> json) =>
    CustomerListData(
      data: (json['Data'] as List<dynamic>)
          .map((e) => CustomerData.fromJson(e as Map<String, dynamic>))
          .toList(),
    )
      ..statusCode = json['StatusCode'] as int?
      ..isError = json['IsError'] as bool?
      ..message = json['Message'] as String?;

Map<String, dynamic> _$CustomerListDataToJson(CustomerListData instance) =>
    <String, dynamic>{
      'StatusCode': instance.statusCode,
      'IsError': instance.isError,
      'Message': instance.message,
      'Data': instance.data,
    };

CustomerData _$CustomerDataFromJson(Map<String, dynamic> json) => CustomerData(
      batch: json['Batch'] as String?,
      categoryType: json['CategoryType'] as String?,
      feePening: json['FeePening'] as int?,
      id: json['Id'] as int?,
      name: json['Name'] as String?,
    );

Map<String, dynamic> _$CustomerDataToJson(CustomerData instance) =>
    <String, dynamic>{
      'Id': instance.id,
      'Name': instance.name,
      'Batch': instance.batch,
      'CategoryType': instance.categoryType,
      'FeePening': instance.feePening,
    };
