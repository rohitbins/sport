import 'package:json_annotation/json_annotation.dart';
import 'package:sport/model/common_response.dart';
part 'customer_list_out.g.dart';


@JsonSerializable()
class CustomerListOut extends CommonResponse {
  CustomerListOut ({this.data});

  List <CustomerOut>? data;

  factory CustomerListOut.fromJson(Map<String, dynamic> json) =>
      _$CustomerListOutFromJson(json);
  Map<String, dynamic> toJson() => _$CustomerListOutToJson(this);
}



@JsonSerializable()
class CustomerOut {
  CustomerOut({
   required this.batch,
   required this.categoryType,
   required this.feePending,
   required this.id,
   required this.name,
   required this.customerKey,
   required this.inTime,
    this.totalPlay,
   required this.isPlaying,
  

  });

  int id;
  String name;
  String batch;
  String categoryType;
  int feePending;
  int isPlaying;
  String inTime;
  String? totalPlay;
  String customerKey;

factory CustomerOut.fromJson(Map<String, dynamic> json) =>
      _$CustomerOutFromJson(json);
  Map<String, dynamic> toJson() => _$CustomerOutToJson(this);

}