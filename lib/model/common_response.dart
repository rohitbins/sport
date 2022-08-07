import 'package:json_annotation/json_annotation.dart';

abstract class CommonResponse{
  @JsonKey(name: "StatusCode")
int? statusCode;

@JsonKey(name: "IsError")
bool? isError;

@JsonKey(name: "Message")
String? message;

} 