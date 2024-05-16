import 'package:json_annotation/json_annotation.dart';
import 'package:qyran/api/entity/TestEntity.dart';
import 'package:qyran/api/entity/VideoEntity.dart';
import 'package:qyran/test/SimpleTestModel.dart';
part 'ThemeParamModel.g.dart';

@JsonSerializable()
class ThemeParamModel {
  List<SimpleTestModel> testList;
  List<VideoEntity> videoList;

  ThemeParamModel({required this.testList, required this.videoList});

  factory ThemeParamModel.fromJson(Map<String, dynamic> json) =>
      _$ThemeParamModelFromJson(json);
  Map<String, dynamic> toJson() => _$ThemeParamModelToJson(this);
}
