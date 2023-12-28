import 'package:doggo_pedia/data/response/base_response.dart';
import 'package:doggo_pedia/domain/models/breed.dart';
import 'package:doggo_pedia/domain/models/image_breeds_model.dart';
import 'package:json_annotation/json_annotation.dart';

part 'image_breeds_response.g.dart';

@JsonSerializable()
class ImageBreedsResponse extends BaseResponse {
  final String id;
  final String url;
  final List<Breed> breeds;
  final int width;
  final int height;

  ImageBreedsResponse({
    required this.id,
    required this.url,
    required this.breeds,
    required this.width,
    required this.height,
  });

  factory ImageBreedsResponse.fromJson(Map<String, dynamic> json) =>
      _$ImageBreedsResponseFromJson(json);
  Map<String, dynamic> toJson() => _$ImageBreedsResponseToJson(this);
}

extension ImageBreedsResponseMapper on ImageBreedsResponse {
  ImageBreedsModel toDomain() {
    return ImageBreedsModel(
      id: id,
      url: url,
      breeds: breeds,
      width: width,
      height: height,
    );
  }
}
