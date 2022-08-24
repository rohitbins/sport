// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'customer_data.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CustomerDataRequest _$CustomerDataRequestFromJson(Map<String, dynamic> json) =>
    CustomerDataRequest(
      batchId: json['batchId'] as String?,
      categoryId: json['categoryId'] as String?,
    );

Map<String, dynamic> _$CustomerDataRequestToJson(
        CustomerDataRequest instance) =>
    <String, dynamic>{
      'batchId': instance.batchId,
      'categoryId': instance.categoryId,
    };
