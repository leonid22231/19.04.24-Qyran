import 'package:json_annotation/json_annotation.dart';
import 'package:qyran/api/entity/TestEntity.dart';
import 'package:qyran/api/entity/VideoEntity.dart';

part 'ThemeEntity.g.dart';

@JsonSerializable()
class ThemeEntity {
  int id;
  String name;
  List<VideoEntity> videoList;
  List<TestEntity> testList;

  ThemeEntity({required this.id, required this.name, required this.testList, required this.videoList});

  factory ThemeEntity.fromJson(Map<String, dynamic> json) => _$ThemeEntityFromJson(json);
  Map<String, dynamic> toJson() => _$ThemeEntityToJson(this);
}
