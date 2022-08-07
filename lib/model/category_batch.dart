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
    this.id,
    this.batch,
  });

  int? id;

  String? batch;

  factory Batch.fromJson(Map<String, dynamic> json) => _$BatchFromJson(json);
  Map<String, dynamic> toJson() => _$BatchToJson(this);
}

@JsonSerializable()
class Category {
  Category({required this.id, required this.category});

  final int id;

  final String category;

  factory Category.fromJson(Map<String, dynamic> json) =>
      _$CategoryFromJson(json);
  Map<String, dynamic> toJson() => _$CategoryToJson(this);
}
