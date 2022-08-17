// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'payment.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CustomerPayment _$CustomerPaymentFromJson(Map<String, dynamic> json) =>
    CustomerPayment(
      data: Data.fromJson(json['data'] as Map<String, dynamic>),
    )
      ..statusCode = json['statusCode'] as int?
      ..isError = json['isError'] as bool?
      ..message = json['message'] as String?;

Map<String, dynamic> _$CustomerPaymentToJson(CustomerPayment instance) =>
    <String, dynamic>{
      'statusCode': instance.statusCode,
      'isError': instance.isError,
      'message': instance.message,
      'data': instance.data,
    };

Data _$DataFromJson(Map<String, dynamic> json) => Data(
      advance: json['advance'] as int?,
      advanceHEX: json['advanceHEX'] as String?,
      paymentList: (json['paymentList'] as List<dynamic>?)
          ?.map((e) => Payment.fromJson(e as Map<String, dynamic>))
          .toList(),
      pending: json['pending'] as int?,
      pendingHEX: json['pendingHEX'] as String?,
    );

Map<String, dynamic> _$DataToJson(Data instance) => <String, dynamic>{
      'advance': instance.advance,
      'advanceHEX': instance.advanceHEX,
      'pending': instance.pending,
      'pendingHEX': instance.pendingHEX,
      'paymentList': instance.paymentList,
    };

Payment _$PaymentFromJson(Map<String, dynamic> json) => Payment(
      amount: json['amount'] as int,
      amountColorHEX: json['amountColorHEX'] as String,
      date: json['date'] as String,
      dateBGColorHex: json['dateBGColorHex'] as String,
      firstText: json['firstText'] as String,
      firstTextColorHex: json['firstTextColorHex'] as String,
      secondTextColorHex: json['secondTextColorHex'] as String,
      secondTextText: json['secondTextText'] as String,
    );

Map<String, dynamic> _$PaymentToJson(Payment instance) => <String, dynamic>{
      'date': instance.date,
      'dateBGColorHex': instance.dateBGColorHex,
      'amount': instance.amount,
      'amountColorHEX': instance.amountColorHEX,
      'firstText': instance.firstText,
      'firstTextColorHex': instance.firstTextColorHex,
      'secondTextText': instance.secondTextText,
      'secondTextColorHex': instance.secondTextColorHex,
    };
