import 'package:json_annotation/json_annotation.dart';

part 'TestEntity.g.dart';

@JsonSerializable()
class TestEntity {
  int id;
  String name;
  String description;
  DateTime create_date;
  int item;
  bool view;
  bool result;
  TestEntity(
      {required this.id,
      required this.name,
      required this.description,
      required this.create_date,
      required this.item,
      required this.result,
      required this.view});

  factory TestEntity.fromJson(Map<String, dynamic> json) =>
      _$TestEntityFromJson(json);
  Map<String, dynamic> toJson() => _$TestEntityToJson(this);
}
