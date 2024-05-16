import 'package:json_annotation/json_annotation.dart';
part 'SimpleTestModel.g.dart';

@JsonSerializable()
class SimpleTestModel {
  String name;
  String description;
  int item;
  SimpleTestModel(
      {required this.name, required this.description, required this.item});

  factory SimpleTestModel.fromJson(Map<String, dynamic> json) =>
      _$SimpleTestModelFromJson(json);
  Map<String, dynamic> toJson() => _$SimpleTestModelToJson(this);
}
