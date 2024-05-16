import 'package:json_annotation/json_annotation.dart';

part 'NewEntity.g.dart';

@JsonSerializable()
class NewEntity {
  int id;
  String title;
  String description;
  String image;
  DateTime date;

  NewEntity(
      {required this.id,
      required this.title,
      required this.description,
      required this.image,
      required this.date});

  factory NewEntity.fromJson(Map<String, dynamic> json) =>
      _$NewEntityFromJson(json);
  Map<String, dynamic> toJson() => _$NewEntityToJson(this);
}
