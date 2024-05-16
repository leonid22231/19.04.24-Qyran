import 'package:json_annotation/json_annotation.dart';
part 'TempTestResponse.g.dart';

@JsonSerializable()
class TempTestResponse {
  int item;
  int id;
  TempTestResponse({required this.id, required this.item});
  factory TempTestResponse.fromJson(Map<String, dynamic> json) =>
      _$TempTestResponseFromJson(json);
  Map<String, dynamic> toJson() => _$TempTestResponseToJson(this);
}
