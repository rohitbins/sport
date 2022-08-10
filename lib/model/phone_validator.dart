import 'package:json_annotation/json_annotation.dart';

part 'phone_validator.g.dart';

@JsonSerializable()
class PhoneValidator {
  int? statusCode;
  bool? isError;
  String? message;
  Map<String, dynamic>? data;

  PhoneValidator({this.statusCode, this.isError, this.message, this.data});

  PhoneValidator.fromMap(Map<String, dynamic> json) {
    statusCode = json['statusCode'];
    isError = json['isError'];
    message = json['message'];
    data = json['data'];
  }

  factory PhoneValidator.fromJson(Map<String, dynamic> json) =>
      _$PhoneValidatorFromJson(json);

  Map<String, dynamic> toJson() => _$PhoneValidatorToJson(this);
}
