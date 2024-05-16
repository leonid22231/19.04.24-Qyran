import 'package:json_annotation/json_annotation.dart';
import 'package:qyran/api/entity/LessonEntity.dart';
part 'LessonCurrentModel.g.dart';

@JsonSerializable()
class LessonCurrentModel {
  LessonEntity lesson;
  double percent;

  LessonCurrentModel({required this.lesson, required this.percent});

  factory LessonCurrentModel.fromJson(Map<String, dynamic> json) =>
      _$LessonCurrentModelFromJson(json);
  Map<String, dynamic> toJson() => _$LessonCurrentModelToJson(this);
}
