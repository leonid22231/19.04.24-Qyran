import 'package:json_annotation/json_annotation.dart';

part 'CourseEntity.g.dart';

@JsonSerializable()
class CourseEntity {
  String id;
  String name;
  CourseEntity({required this.id, required this.name});

  factory CourseEntity.fromJson(Map<String, dynamic> json) => _$CourseEntityFromJson(json);
  Map<String, dynamic> toJson() => _$CourseEntityToJson(this);
}
