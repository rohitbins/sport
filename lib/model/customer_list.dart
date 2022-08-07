import 'package:sport/model/common_response.dart';
import 'package:json_annotation/json_annotation.dart';
part 'customer_list.g.dart';

@JsonSerializable()
class CustomerListData extends CommonResponse {
  CustomerListData({this.data});

  List<CustomerData>? data;

  factory CustomerListData.fromJson(Map<String, dynamic> json) =>
      _$CustomerListDataFromJson(json);
  Map<String, dynamic> toJson() => _$CustomerListDataToJson(this);
}

@JsonSerializable()
class CustomerData {
  CustomerData(
      {this.batch, this.categoryType, this.feePening, this.id, this.name});

  int? id;

  String? name;

  String? batch;

  String? categoryType;

  int? feePening;

  factory CustomerData.fromJson(Map<String, dynamic> json) =>
      _$CustomerDataFromJson(json);
  Map<String, dynamic> toJson() => _$CustomerDataToJson(this);
}
