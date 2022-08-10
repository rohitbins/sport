// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'category_batch.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CategoryAndBatch _$CategoryAndBatchFromJson(Map<String, dynamic> json) =>
    CategoryAndBatch(
      data: json['data'] == null
          ? null
          : MyData.fromJson(json['data'] as Map<String, dynamic>),
    )
      ..statusCode = json['statusCode'] as int?
      ..isError = json['isError'] as bool?
      ..message = json['message'] as String?;

Map<String, dynamic> _$CategoryAndBatchToJson(CategoryAndBatch instance) =>
    <String, dynamic>{
      'statusCode': instance.statusCode,
      'isError': instance.isError,
      'message': instance.message,
      'data': instance.data,
    };

MyData _$MyDataFromJson(Map<String, dynamic> json) => MyData(
      batchList: (json['batchList'] as List<dynamic>?)
          ?.map((e) => Batch.fromJson(e as Map<String, dynamic>))
          .toList(),
      categoryList: (json['categoryList'] as List<dynamic>?)
          ?.map((e) => Category.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$MyDataToJson(MyData instance) => <String, dynamic>{
      'batchList': instance.batchList,
      'categoryList': instance.categoryList,
    };

Batch _$BatchFromJson(Map<String, dynamic> json) => Batch(
      id: json['id'] as int,
      batch: json['batch'] as String,
    );

Map<String, dynamic> _$BatchToJson(Batch instance) => <String, dynamic>{
      'id': instance.id,
      'batch': instance.batch,
    };

Category _$CategoryFromJson(Map<String, dynamic> json) => Category(
      id: json['id'] as int,
      category: json['category'] as String,
    );

Map<String, dynamic> _$CategoryToJson(Category instance) => <String, dynamic>{
      'id': instance.id,
      'category': instance.category,
    };
