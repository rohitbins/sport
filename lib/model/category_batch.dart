import 'package:sport/model/common_response.dart';
import 'package:json_annotation/json_annotation.dart';
part 'category_batch.g.dart';

@JsonSerializable()
class CategoryAndBatch extends CommonResponse {
  CategoryAndBatch({this.data}) : super();

  MyData? data;

  factory CategoryAndBatch.fromJson(Map<String, dynamic> json) =>
      _$CategoryAndBatchFromJson(json);
  Map<String, dynamic> toJson() => _$CategoryAndBatchToJson(this);
}

@JsonSerializable()
class MyData {
  MyData({this.batchList, this.categoryList});

  List<Batch>? batchList;

  List<Category>? categoryList;

  factory MyData.fromJson(Map<String, dynamic> json) => _$MyDataFromJson(json);
  Map<String, dynamic> toJson() => _$MyDataToJson(this);
}

@JsonSerializable()
class Batch {
  Batch({
   required this.id,
   required this.batch,
   required this.sport,
   required this.sportLogo
  });

  int id;

  String batch;
  String sport;
  String sportLogo;
  factory Batch.fromJson(Map<String, dynamic> json) => _$BatchFromJson(json);
  Map<String, dynamic> toJson() => _$BatchToJson(this);
}

@JsonSerializable()
class Category {
  Category({
    required this.id,
    required this.category,
    required this.sport,
    required this.sportLogo
    
    });

  final int id;

  final String category;
  String sport;
  String sportLogo;

  factory Category.fromJson(Map<String, dynamic> json) =>
      _$CategoryFromJson(json);
  Map<String, dynamic> toJson() => _$CategoryToJson(this);
}
