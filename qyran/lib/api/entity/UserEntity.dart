import 'package:json_annotation/json_annotation.dart';
import 'package:qyran/api/entity/enums/UserRole.dart';

part 'UserEntity.g.dart';

@JsonSerializable()
class UserEntity {
  String id;
  String phone;
  String name;
  String surname;
  String email;
  String? social_1;
  String? social_2;
  UserRole role;

  UserEntity({required this.id, required this.phone, required this.name, required this.surname, required this.email, required this.role, this.social_1, this.social_2});

  factory UserEntity.fromJson(Map<String, dynamic> json) => _$UserEntityFromJson(json);
  Map<String, dynamic> toJson() => _$UserEntityToJson(this);
}
