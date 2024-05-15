import 'package:json_annotation/json_annotation.dart';

part 'TestResultEntity.g.dart';

@JsonSerializable()
class TestResultEntity {
  int id;
  int result;
  String goodIds;
  String badIds;
  TestResultEntity(
      {required this.id,
      required this.result,
      required this.badIds,
      required this.goodIds});

  factory TestResultEntity.fromJson(Map<String, dynamic> json) =>
      _$TestResultEntityFromJson(json);
  Map<String, dynamic> toJson() => _$TestResultEntityToJson(this);
}
