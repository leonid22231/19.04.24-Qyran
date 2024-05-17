import 'dart:ui';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:qyran/api/RestClient.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

int currenTabCourse = 0;
Color primaryColor = const Color(0xffFFAB07);
Color gold = const Color(0xffFFC107);
Color secondaryColor = const Color(0xffF6F6F6);
Color errorColor = Colors.redAccent;
Color appGreen = const Color(0xff4B9460);
Color appGray1 = const Color(0xffE8E8E8);
Color appGray2 = const Color(0xffBDBDBD);
Color appGray3 = const Color(0xff666666);
Color appGray4 = const Color(0xff5B5B5C);
Color appGray5 = const Color(0xff212121);
Color appGray6 = const Color(0xff878787);
Color borderPinput = const Color(0xffD9D9DB);
Color textContext = const Color(0xff606060);
double widgetPadding = 2.h;
double miniSize = 14.sp;
double mainSize = 16.sp;
double buttonTextSize = 18.sp;
double welcomeTitleSize = 20.sp;
double progressRadius = 30;
String baseUrl = "http://86.104.73.36:8080";
String _api = "api/v1";
late RestClient _client;
void initRestClient() {
  debugPrint(
      "Init API [$_api] in base url $baseUrl address to [$baseUrl/$_api]");
  Dio dio = Dio();
  _client = RestClient(dio, baseUrl: "$baseUrl/$_api");
}

String userPhotoUrl(String phone) {
  return "$baseUrl/$_api/user/profile/image?phone=$phone";
}

String teacherPhotoUrl(String id) {
  return "$baseUrl/$_api/teacher/image?id=$id";
}

String lessonImageUrl(String id) {
  return "$baseUrl/$_api/lesson/image?id=$id";
}

String newImageUrl(int id) {
  return "$baseUrl/$_api/new/image?id=$id";
}

RestClient api() {
  return _client;
}
