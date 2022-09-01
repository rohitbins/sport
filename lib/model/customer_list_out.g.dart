// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'customer_list_out.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CustomerListOut _$CustomerListOutFromJson(Map<String, dynamic> json) =>
    CustomerListOut(
      data: (json['data'] as List<dynamic>?)
          ?.map((e) => CustomerOut.fromJson(e as Map<String, dynamic>))
          .toList(),
    )
      ..statusCode = json['statusCode'] as int?
      ..isError = json['isError'] as bool?
      ..message = json['message'] as String?;

Map<String, dynamic> _$CustomerListOutToJson(CustomerListOut instance) =>
    <String, dynamic>{
      'statusCode': instance.statusCode,
      'isError': instance.isError,
      'message': instance.message,
      'data': instance.data,
    };

CustomerOut _$CustomerOutFromJson(Map<String, dynamic> json) => CustomerOut(
      batch: json['batch'] as String,
      categoryType: json['categoryType'] as String,
      feePending: json['feePending'] as int,
      id: json['id'] as int,
      name: json['name'] as String,
      customerKey: json['customerKey'] as String,
      inTime: json['inTime'] as String,
      totalPlay: json['totalPlay'] as String?,
      isPlaying: json['isPlaying'] as int,
      isPNP: json['isPNP'] as bool,
      slotId: json['slotId'] as int,
    );

Map<String, dynamic> _$CustomerOutToJson(CustomerOut instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'batch': instance.batch,
      'categoryType': instance.categoryType,
      'feePending': instance.feePending,
      'isPlaying': instance.isPlaying,
      'inTime': instance.inTime,
      'totalPlay': instance.totalPlay,
      'customerKey': instance.customerKey,
      'slotId': instance.slotId,
      'isPNP': instance.isPNP,
    };
