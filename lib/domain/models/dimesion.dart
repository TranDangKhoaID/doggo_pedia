import 'package:json_annotation/json_annotation.dart';

part 'dimesion.g.dart';

@JsonSerializable()
class Dimension {
  final String imperial;
  final String metric;

  Dimension({required this.imperial, required this.metric});

  factory Dimension.fromJson(Map<String, dynamic> json) =>
      _$DimensionFromJson(json);
  Map<String, dynamic> toJson() => _$DimensionToJson(this);
}
