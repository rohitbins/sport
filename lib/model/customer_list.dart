import 'package:sport/model/common_response.dart';
import 'package:json_annotation/json_annotation.dart';
part 'customer_list.g.dart';


@JsonSerializable()
class CustomerListData extends CommonResponse{
  CustomerListData({this.data});

  @JsonKey(name: "Data")
  List<CustomerData>? data;

 factory CustomerListData.fromJson(Map<String, dynamic> json) =>
      _$CustomerListDataFromJson(json);
  Map<String, dynamic> toJson() => _$CustomerListDataToJson(this);
  
}



@JsonSerializable()
class CustomerData{
CustomerData({this.batch,this.categoryType,this.feePening,this.id,this.name});

  @JsonKey(name: "Id")
  int? id;

  @JsonKey(name: "Name")
  String? name;

  @JsonKey(name: "Batch")
  String? batch;

  @JsonKey(name: "CategoryType")
  String? categoryType;

  @JsonKey(name: "FeePening")
  int? feePening;

 factory CustomerData.fromJson(Map<String, dynamic> json) =>
      _$CustomerDataFromJson(json);
  Map<String, dynamic> toJson() => _$CustomerDataToJson(this);
  
}