import 'package:sport/model/common_response.dart';
import 'package:json_annotation/json_annotation.dart';
part 'category_batch.g.dart';


@JsonSerializable()
class CategoryAndBatch extends CommonResponse{
  CategoryAndBatch({this.data
  }) : super();


@JsonKey(name:"Data")
MyData? data;


 factory CategoryAndBatch.fromJson(Map<String, dynamic> json) =>
      _$CategoryAndBatchFromJson(json);
  Map<String, dynamic> toJson() => _$CategoryAndBatchToJson(this);
  
}

@JsonSerializable()
class MyData {

     MyData({
      this.batchList,this.categoryList
     });
     
     @JsonKey(name: "BatchList")
      List<Batch>? batchList;

     @JsonKey(name: "CategoryList")
     List<Category>? categoryList;


     factory MyData.fromJson(Map<String, dynamic> json) =>
      _$MyDataFromJson(json);
  Map<String, dynamic> toJson() => _$MyDataToJson(this);

     
    
}



@JsonSerializable()
class Batch {

  Batch({
    this.id, this.batch,
  });

  @JsonKey(name: "Id")
  int? id;

  @JsonKey(name: "Batch")
  String? batch;

 

  factory Batch.fromJson(Map<String, dynamic> json) =>
      _$BatchFromJson(json);
  Map<String, dynamic> toJson() => _$BatchToJson(this);
  


}

@JsonSerializable()
class Category{
  Category({
     this.id,this.category
  });

  @JsonKey(name:"Id")
  int? id;
  
  @JsonKey(name:"Category")
  String? category;

  factory Category.fromJson(Map<String, dynamic> json) =>
      _$CategoryFromJson(json);
  Map<String, dynamic> toJson() => _$CategoryToJson(this);

  static map() {}
}


