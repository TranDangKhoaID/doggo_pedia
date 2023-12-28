// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'image_breeds_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ImageBreedsResponse _$ImageBreedsResponseFromJson(Map<String, dynamic> json) =>
    ImageBreedsResponse(
      id: json['id'] as String,
      url: json['url'] as String,
      breeds: (json['breeds'] as List<dynamic>)
          .map((e) => Breed.fromJson(e as Map<String, dynamic>))
          .toList(),
      width: json['width'] as int,
      height: json['height'] as int,
    )..success = json['success'] as bool?;

Map<String, dynamic> _$ImageBreedsResponseToJson(
        ImageBreedsResponse instance) =>
    <String, dynamic>{
      'success': instance.success,
      'id': instance.id,
      'url': instance.url,
      'breeds': instance.breeds,
      'width': instance.width,
      'height': instance.height,
    };
