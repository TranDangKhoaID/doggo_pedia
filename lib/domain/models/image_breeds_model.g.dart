// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'image_breeds_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ImageBreedsModel _$ImageBreedsModelFromJson(Map<String, dynamic> json) =>
    ImageBreedsModel(
      id: json['id'] as String,
      url: json['url'] as String,
      breeds: (json['breeds'] as List<dynamic>)
          .map((e) => Breed.fromJson(e as Map<String, dynamic>))
          .toList(),
      width: json['width'] as int,
      height: json['height'] as int,
    );

Map<String, dynamic> _$ImageBreedsModelToJson(ImageBreedsModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'url': instance.url,
      'breeds': instance.breeds,
      'width': instance.width,
      'height': instance.height,
    };
