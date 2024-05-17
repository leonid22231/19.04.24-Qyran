import 'package:flutter/material.dart';

class ToggleCourseController {
  static final instance = ToggleCourseController();
  late ValueNotifier<int> currentTab;
  void init() {
    currentTab = ValueNotifier(0);
  }
}
