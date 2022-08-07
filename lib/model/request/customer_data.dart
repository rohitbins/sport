import 'package:json_annotation/json_annotation.dart';
part 'customer_data.g.dart';

@JsonSerializable(explicitToJson: true)
class CustomerDataRequest {
  CustomerDataRequest({this.batchId, this.categoryId});
  String? batchId;
  String? categoryId;
  Map<String, dynamic> toJson() => _$CustomerDataRequestToJson(this);
}
