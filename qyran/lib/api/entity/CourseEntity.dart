import 'package:json_annotation/json_annotation.dart';

part 'CourseEntity.g.dart';

@JsonSerializable()
class CourseEntity {
  String id;
  String name;
  bool sub;
  CourseEntity({required this.id, required this.name, required this.sub});
  factory CourseEntity.fromJson(Map<String, dynamic> json) =>
      _$CourseEntityFromJson(json);
  Map<String, dynamic> toJson() => _$CourseEntityToJson(this);
}
