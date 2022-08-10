import 'package:json_annotation/json_annotation.dart';

part 'otp_validator.g.dart';

@JsonSerializable()
class OtpValidator {
  int statusCode = 0;
  bool isError = false;
  String? message;
  OtpData? data;

  OtpValidator(
      {required this.statusCode,
      required this.isError,
      this.message,
      this.data});

  OtpValidator.fromMap(Map<String, dynamic> json) {
    statusCode = json['statusCode'] as int;
    isError = json['isError'] as bool;
    message = json['message'];
    data = json['data'];
  }

  factory OtpValidator.fromJson(Map<String, dynamic> json) =>
      _$OtpValidatorFromJson(json);

  Map<String, dynamic> toJson() => _$OtpValidatorToJson(this);
}

@JsonSerializable(explicitToJson: true)
class OtpData {
  OtpData({this.academyLogoURL, this.customerKey, this.name});
  String? name;
  String? customerKey;
  String? academyLogoURL;

  factory OtpData.fromJson(Map<String, dynamic> json) =>
      _$OtpDataFromJson(json);

  Map<String, dynamic> toJson() => _$OtpDataToJson(this);
}
