// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'pending_customer_fee.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PendingFeeGuru _$PendingFeeGuruFromJson(Map<String, dynamic> json) =>
    PendingFeeGuru(
      statusCode: json['statusCode'] as int?,
      isError: json['isError'] as bool?,
      message: json['message'] as String?,
      data: (json['data'] as List<dynamic>)
          .map((e) => Data.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$PendingFeeGuruToJson(PendingFeeGuru instance) =>
    <String, dynamic>{
      'statusCode': instance.statusCode,
      'isError': instance.isError,
      'message': instance.message,
      'data': instance.data,
    };

Data _$DataFromJson(Map<String, dynamic> json) => Data(
      name: json['name'] as String?,
      customerKey: json['customerKey'] as String?,
      feeText: json['feeText'] as String?,
      pendingDays: json['pendingDays'] as int?,
      fee: (json['fee'] as num?)?.toDouble(),
      feeDate: json['feeDate'] as String?,
    );

Map<String, dynamic> _$DataToJson(Data instance) => <String, dynamic>{
      'name': instance.name,
      'customerKey': instance.customerKey,
      'feeText': instance.feeText,
      'pendingDays': instance.pendingDays,
      'fee': instance.fee,
      'feeDate': instance.feeDate,
    };
