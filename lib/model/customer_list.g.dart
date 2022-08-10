// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'customer_list.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CustomerListData _$CustomerListDataFromJson(Map<String, dynamic> json) =>
    CustomerListData(
      data: (json['data'] as List<dynamic>?)
          ?.map((e) => CustomerData.fromJson(e as Map<String, dynamic>))
          .toList(),
    )
      ..statusCode = json['statusCode'] as int?
      ..isError = json['isError'] as bool?
      ..message = json['message'] as String?;

Map<String, dynamic> _$CustomerListDataToJson(CustomerListData instance) =>
    <String, dynamic>{
      'statusCode': instance.statusCode,
      'isError': instance.isError,
      'message': instance.message,
      'data': instance.data,
    };

CustomerData _$CustomerDataFromJson(Map<String, dynamic> json) => CustomerData(
      batch: json['batch'] as String,
      categoryType: json['categoryType'] as String,
      feePening: json['feePening'] as int,
      id: json['id'] as int,
      name: json['name'] as String,
      customerKey: json['customerKey'] as String,
      inTime: json['inTime'] as String?,
      isPlaying: json['isPlaying'] as int,
      totalPlay: json['totalPlay'] as String?,
    );

Map<String, dynamic> _$CustomerDataToJson(CustomerData instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'batch': instance.batch,
      'categoryType': instance.categoryType,
      'feePening': instance.feePening,
      'isPlaying': instance.isPlaying,
      'inTime': instance.inTime,
      'totalPlay': instance.totalPlay,
      'customerKey': instance.customerKey,
    };
