import 'package:flutter/widgets.dart';
import 'package:qyran/api/entity/UserEntity.dart';
import 'package:qyran/api/entity/enums/UserRole.dart';
import 'package:qyran/controller/StorageController.dart';
import 'package:qyran/utils/globals.dart';
import 'package:shared_preferences/shared_preferences.dart';

class UserController {
  static final instance = UserController();
  late UserEntity user;
  late UserRole role;
  late String phone;
  late String name;
  late String surname;
  late String email;
  late String? social_1;
  late String? social_2;

  bool isReady = false;
  Future<void> init() async {
    String? local_phone = await StorageController.instance.getPhone();
    user = await api().findProfile(local_phone!);
    role = user.role;
    phone = user.phone;
    name = user.name;
    surname = user.surname;
    email = user.email;
    social_1 = user.social_1;
    social_2 = user.social_2;
    isReady = true;
    debugPrint(
        "User controller is load [name: $name, surname: $surname, phone: $phone, role: $role]");
  }

  void print() {
    debugPrint("User Entity ${user!.toJson().toString()}");
    debugPrint("Fields:");
    debugPrint("role:$role");
    debugPrint("phone:$phone");
    debugPrint("name:$name");
    debugPrint("surname:$surname");
    debugPrint("email:$email");
    debugPrint("social_1:$social_1");
    debugPrint("social_2:$social_2");
    debugPrint("isReady:$isReady");
  }
}
