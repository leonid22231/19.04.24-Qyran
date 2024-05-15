import 'package:json_annotation/json_annotation.dart';
import 'package:qyran/test/QuestionModel.dart';

part 'TestModel.g.dart';

@JsonSerializable()
class TestModel {
  int item;
  int count;
  List<QuestionModel> questions;

  TestModel({required this.item, required this.count, required this.questions});

  factory TestModel.fromJson(Map<String, dynamic> json) => _$TestModelFromJson(json);
  Map<String, dynamic> toJson() => _$TestModelToJson(this);
}
