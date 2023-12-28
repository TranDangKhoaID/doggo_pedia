import 'package:doggo_pedia/domain/models/breed.dart';
import 'package:doggo_pedia/domain/models/dimesion.dart';
import 'package:json_annotation/json_annotation.dart';

part 'breeds_response.g.dart';

// @JsonSerializable()
// class BreedsResponse {
//   BreedsResponse();
//   List<BreedsDataResponse>? breeds;
//   factory BreedsResponse.fromJson(Map<String, dynamic> json) =>
//       _$BreedsResponseFromJson(json);
//   Map<String, dynamic> toJson() => _$BreedsResponseToJson(this);
// }

@JsonSerializable()
class BreedsDataResponse {
  final Dimension weight;
  final Dimension height;
  final int id;
  final String name;
  final String? bred_for;
  final String? breed_group;
  final String? life_span;
  final String? temperament;
  final String? origin;
  final String? reference_image_id;

  BreedsDataResponse({
    required this.weight,
    required this.height,
    required this.id,
    required this.name,
    this.bred_for,
    this.breed_group,
    this.life_span,
    this.temperament,
    this.origin,
    this.reference_image_id,
  });

  factory BreedsDataResponse.fromJson(Map<String, dynamic> json) =>
      _$BreedsDataResponseFromJson(json);

  Map<String, dynamic> toJson() => _$BreedsDataResponseToJson(this);
}

extension BreedsResponseMapper on BreedsDataResponse {
  Breed toDomain() {
    return Breed(
      weight: weight,
      height: height,
      id: id,
      name: name,
      bredFor: bred_for,
      breedGroup: breed_group,
      lifeSpan: life_span,
      temperament: temperament,
      origin: origin,
      referenceImageId: reference_image_id,
    );
  }
}
