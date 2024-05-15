import 'package:json_annotation/json_annotation.dart';
part 'TestResultModel.g.dart';

@JsonSerializable()
class TestResultModel {
  int id = 0;
  List<TestResultAnswerModel> results = [];
  TestResultModel({required this.id, required this.results});

  factory TestResultModel.fromJson(Map<String, dynamic> json) =>
      _$TestResultModelFromJson(json);
  Map<String, dynamic> toJson() => _$TestResultModelToJson(this);
}

@JsonSerializable()
class TestResultAnswerModel {
  int id = 0;
  List<int> answers = [];
  TestResultAnswerModel({required this.id, required this.answers});

  factory TestResultAnswerModel.fromJson(Map<String, dynamic> json) =>
      _$TestResultAnswerModelFromJson(json);
  Map<String, dynamic> toJson() => _$TestResultAnswerModelToJson(this);
}
