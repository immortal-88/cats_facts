// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'cat_fact_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CatFactResponse _$CatFactResponseFromJson(Map<String, dynamic> json) =>
    CatFactResponse(
      fact: json['fact'] as String,
      length: json['length'] as int,
    );

Map<String, dynamic> _$CatFactResponseToJson(CatFactResponse instance) =>
    <String, dynamic>{
      'fact': instance.fact,
      'length': instance.length,
    };
