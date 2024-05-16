import 'package:json_annotation/json_annotation.dart';
import 'package:qyran/api/entity/CourseEntity.dart';
import 'package:qyran/api/entity/TestEntity.dart';

part 'CurrentTestsModel.g.dart';

@JsonSerializable()
class CurrentTestsModel {
  CourseEntity course;
  List<TestEntity> tests;

  CurrentTestsModel({required this.course, required this.tests});

  factory CurrentTestsModel.fromJson(Map<String, dynamic> json) =>
      _$CurrentTestsModelFromJson(json);
  Map<String, dynamic> toJson() => _$CurrentTestsModelToJson(this);
}
