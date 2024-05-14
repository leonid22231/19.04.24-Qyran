import 'package:json_annotation/json_annotation.dart';

part 'VideoEntity.g.dart';

@JsonSerializable()
class VideoEntity {
  int id;
  String name;
  String url;
  int item;
  bool view;
  VideoEntity({required this.id, required this.name, required this.url, required this.item, required this.view});

  factory VideoEntity.fromJson(Map<String, dynamic> json) => _$VideoEntityFromJson(json);
  Map<String, dynamic> toJson() => _$VideoEntityToJson(this);
}
