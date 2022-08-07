// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'category_batch.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CategoryAndBatch _$CategoryAndBatchFromJson(Map<String, dynamic> json) =>
    CategoryAndBatch(
      data: json['Data'] == null
          ? null
          : MyData.fromJson(json['Data'] as Map<String, dynamic>),
    )
      ..statusCode = json['StatusCode'] as int?
      ..isError = json['IsError'] as bool?
      ..message = json['Message'] as String?;

Map<String, dynamic> _$CategoryAndBatchToJson(CategoryAndBatch instance) =>
    <String, dynamic>{
      'StatusCode': instance.statusCode,
      'IsError': instance.isError,
      'Message': instance.message,
      'Data': instance.data,
    };

MyData _$MyDataFromJson(Map<String, dynamic> json) => MyData(
      batchList: (json['BatchList'] as List<dynamic>?)
          ?.map((e) => Batch.fromJson(e as Map<String, dynamic>))
          .toList(),
      categoryList: (json['CategoryList'] as List<dynamic>?)
          ?.map((e) => Category.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$MyDataToJson(MyData instance) => <String, dynamic>{
      'BatchList': instance.batchList,
      'CategoryList': instance.categoryList,
    };

Batch _$BatchFromJson(Map<String, dynamic> json) => Batch(
      id: json['Id'] as int?,
      batch: json['Batch'] as String?,
    );

Map<String, dynamic> _$BatchToJson(Batch instance) => <String, dynamic>{
      'Id': instance.id,
      'Batch': instance.batch,
    };

Category _$CategoryFromJson(Map<String, dynamic> json) => Category(
      id: json['Id'] as int?,
      category: json['Category'] as String?,
    );

Map<String, dynamic> _$CategoryToJson(Category instance) => <String, dynamic>{
      'Id': instance.id,
      'Category': instance.category,
    };
