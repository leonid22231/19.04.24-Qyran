import 'package:json_annotation/json_annotation.dart';
import 'package:qyran/test/TrueResponsesModel.dart';

part 'TrueTestModel.g.dart';

@JsonSerializable()
class TrueTestModel {
  int item;
  int count;
  List<TrueResponsesModel> responses;
  TrueTestModel(
      {required this.item, required this.count, required this.responses});
  factory TrueTestModel.fromJson(Map<String, dynamic> json) =>
      _$TrueTestModelFromJson(json);
  Map<String, dynamic> toJson() => _$TrueTestModelToJson(this);
}
