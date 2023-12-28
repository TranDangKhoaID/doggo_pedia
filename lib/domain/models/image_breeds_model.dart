import 'package:doggo_pedia/domain/models/breed.dart';
import 'package:json_annotation/json_annotation.dart';

part 'image_breeds_model.g.dart';

@JsonSerializable()
class ImageBreedsModel {
  final String id;
  final String url;
  final List<Breed> breeds;
  final int width;
  final int height;

  ImageBreedsModel({
    required this.id,
    required this.url,
    required this.breeds,
    required this.width,
    required this.height,
  });

  factory ImageBreedsModel.fromJson(Map<String, dynamic> json) =>
      _$ImageBreedsModelFromJson(json);
  Map<String, dynamic> toJson() => _$ImageBreedsModelToJson(this);
}
