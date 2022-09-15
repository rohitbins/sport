import 'package:json_annotation/json_annotation.dart';
part 'pending_customer_fee.g.dart';
@JsonSerializable()
class PendingFeeGuru{
  PendingFeeGuru({
    this.statusCode,
    this.isError,
    this.message,
   required this.data
  });
  int? statusCode;
  bool? isError;
  String? message;
  List<Data> data = [];


  factory PendingFeeGuru.fromJson(Map<String, dynamic> json) =>
      _$PendingFeeGuruFromJson(json);
  Map<String, dynamic> toJson() => _$PendingFeeGuruToJson(this);
}

@JsonSerializable()
class Data {
  Data({
    this.name,
    this.customerKey,
    this.feeText,
    this.pendingDays,
    this.fee,
    this.feeDate
  });

  String? name;
  String? customerKey;
  String? feeText;
  int? pendingDays;
  double? fee;
  String? feeDate;


  factory Data.fromJson(Map<String, dynamic> json) =>
      _$DataFromJson(json);
  Map<String, dynamic> toJson() => _$DataToJson(this);
}