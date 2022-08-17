import 'package:json_annotation/json_annotation.dart';
import 'package:sport/model/common_response.dart';
part 'payment.g.dart';


@JsonSerializable()
class CustomerPayment extends CommonResponse{
    CustomerPayment({required this.data});

    Data data;

    factory CustomerPayment.fromJson(Map<String, dynamic> json) =>
      _$CustomerPaymentFromJson(json);
  Map<String, dynamic> toJson() => _$CustomerPaymentToJson(this);
}

@JsonSerializable()
class Data {
  Data({
    this.advance,
    this.advanceHEX,
    this.paymentList,
    this.pending,
    this.pendingHEX
  });

  int? advance;
  String? advanceHEX;
  int? pending;
  String? pendingHEX;
  List<Payment>? paymentList;

  factory Data.fromJson(Map<String, dynamic> json) =>
      _$DataFromJson(json);
  Map<String, dynamic> toJson() => _$DataToJson(this);
}

@JsonSerializable()
class Payment {
  Payment({
    required this.amount,
    required this.amountColorHEX,
    required this.date,
    required this.dateBGColorHex,
    required this.firstText,
    required this.firstTextColorHex,
    required this.secondTextColorHex,
    required this.secondTextText
  });

  String date;
  String dateBGColorHex;
  int amount;
  String amountColorHEX;
  String firstText;
  String firstTextColorHex;
  String secondTextText;
  String secondTextColorHex;

  factory Payment.fromJson(Map<String, dynamic> json) =>
      _$PaymentFromJson(json);
  Map<String, dynamic> toJson() => _$PaymentToJson(this);
}


