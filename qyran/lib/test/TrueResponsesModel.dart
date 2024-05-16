import 'package:json_annotation/json_annotation.dart';
part 'TrueResponsesModel.g.dart';

@JsonSerializable()
class TrueResponsesModel {
  int id;
  List<int> trues;
  TrueResponsesModel({required this.id, required this.trues});
  factory TrueResponsesModel.fromJson(Map<String, dynamic> json) =>
      _$TrueResponsesModelFromJson(json);
  Map<String, dynamic> toJson() => _$TrueResponsesModelToJson(this);
}
