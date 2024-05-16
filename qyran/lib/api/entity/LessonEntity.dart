import 'package:json_annotation/json_annotation.dart';
import 'package:qyran/api/entity/CourseEntity.dart';
import 'package:qyran/api/entity/UserEntity.dart';
part 'LessonEntity.g.dart';

@JsonSerializable()
class LessonEntity {
  String id;
  String title;
  String description;
  String? image;
  UserEntity teacher;
  CourseEntity? course;

  LessonEntity({
    required this.id,
    required this.title,
    required this.description,
    required this.teacher,
    required this.course,
    this.image,
  });

  factory LessonEntity.fromJson(Map<String, dynamic> json) =>
      _$LessonEntityFromJson(json);
  Map<String, dynamic> toJson() => _$LessonEntityToJson(this);
}
