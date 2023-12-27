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
  final String? bredFor;
  final String? breedGroup;
  final String? lifeSpan;
  final String? temperament;
  final String? origin;
  final String? referenceImageId;

  BreedsDataResponse({
    required this.weight,
    required this.height,
    required this.id,
    required this.name,
    this.bredFor,
    this.breedGroup,
    this.lifeSpan,
    this.temperament,
    this.origin,
    this.referenceImageId,
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
      bredFor: bredFor,
      breedGroup: breedGroup,
      lifeSpan: lifeSpan,
      temperament: temperament,
      origin: origin,
      referenceImageId: referenceImageId,
    );
  }
  // List<Breed> toDomain() {
  //   return (breeds ?? [])
  //       .map(
  //         (item) => Breed(
  //           weight: item.weight,
  //           height: item.height,
  //           id: item.id,
  //           name: item.name,
  //           bredFor: item.bredFor,
  //           breedGroup: item.breedGroup,
  //           lifeSpan: item.lifeSpan,
  //           temperament: item.temperament,
  //           origin: item.origin,
  //           referenceImageId: item.referenceImageId,
  //         ),
  //       )
  //       .toList();
  // }
}
