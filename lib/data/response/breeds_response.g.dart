// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'breeds_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

BreedsDataResponse _$BreedsDataResponseFromJson(Map<String, dynamic> json) =>
    BreedsDataResponse(
      weight: Dimension.fromJson(json['weight'] as Map<String, dynamic>),
      height: Dimension.fromJson(json['height'] as Map<String, dynamic>),
      id: json['id'] as int,
      name: json['name'] as String,
      bred_for: json['bred_for'] as String?,
      breed_group: json['breed_group'] as String?,
      life_span: json['life_span'] as String?,
      temperament: json['temperament'] as String?,
      origin: json['origin'] as String?,
      reference_image_id: json['reference_image_id'] as String?,
    );

Map<String, dynamic> _$BreedsDataResponseToJson(BreedsDataResponse instance) =>
    <String, dynamic>{
      'weight': instance.weight,
      'height': instance.height,
      'id': instance.id,
      'name': instance.name,
      'bred_for': instance.bred_for,
      'breed_group': instance.breed_group,
      'life_span': instance.life_span,
      'temperament': instance.temperament,
      'origin': instance.origin,
      'reference_image_id': instance.reference_image_id,
    };
