// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'breed.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Breed _$BreedFromJson(Map<String, dynamic> json) => Breed(
      weight: Dimension.fromJson(json['weight'] as Map<String, dynamic>),
      height: Dimension.fromJson(json['height'] as Map<String, dynamic>),
      id: json['id'] as int,
      name: json['name'] as String,
      bredFor: json['bredFor'] as String?,
      breedGroup: json['breedGroup'] as String?,
      lifeSpan: json['lifeSpan'] as String?,
      temperament: json['temperament'] as String?,
      origin: json['origin'] as String?,
      referenceImageId: json['referenceImageId'] as String?,
    );

Map<String, dynamic> _$BreedToJson(Breed instance) => <String, dynamic>{
      'weight': instance.weight,
      'height': instance.height,
      'id': instance.id,
      'name': instance.name,
      'bredFor': instance.bredFor,
      'breedGroup': instance.breedGroup,
      'lifeSpan': instance.lifeSpan,
      'temperament': instance.temperament,
      'origin': instance.origin,
      'referenceImageId': instance.referenceImageId,
    };
