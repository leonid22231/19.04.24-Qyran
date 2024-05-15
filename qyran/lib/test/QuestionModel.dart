import 'package:json_annotation/json_annotation.dart';
import 'package:qyran/test/ResponseModel.dart';

part 'QuestionModel.g.dart';

@JsonSerializable()
class QuestionModel {
  int id;
  String text;
  String? image;
  bool multi;
  List<ResponseModel> responses;

  QuestionModel({required this.id, required this.text, this.image, required this.multi, required this.responses});

  factory QuestionModel.fromJson(Map<String, dynamic> json) => _$QuestionModelFromJson(json);
  Map<String, dynamic> toJson() => _$QuestionModelToJson(this);
}
