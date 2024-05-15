import 'package:json_annotation/json_annotation.dart';

part 'ResponseModel.g.dart';

@JsonSerializable()
class ResponseModel {
  int id;
  String text;
  ResponseModel({required this.id, required this.text});

  factory ResponseModel.fromJson(Map<String, dynamic> json) => _$ResponseModelFromJson(json);
  Map<String, dynamic> toJson() => _$ResponseModelToJson(this);
}
